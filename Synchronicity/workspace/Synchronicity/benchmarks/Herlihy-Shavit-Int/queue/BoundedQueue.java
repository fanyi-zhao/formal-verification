/*
 * BoundedQueue.java
 *
 * Created on December 27, 2005, 7:14 PM
 *
 * The Art of Multiprocessor Programming, by Maurice Herlihy and Nir Shavit.
 * Copyright 2006 Elsevier Inc. All rights reserved.
 */

package queue;

import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Bounded blocking queue
 * @param int item type
 * @author Maurice Herlihy
 */
public class BoundedQueue {
  
  /**
   * Lock out other enqueuers (dequeuers)
   */
  ReentrantLock enqLock, deqLock;
  /**
   * wait/signal when queue is not empty or not full
   */
  Condition notEmptyCondition, notFullCondition;
  /**
   * Number of empty slots.
   */
  AtomicInteger size;
  /**
   * First entry in queue.
   */
  Entry head;
  /**
   * Last entry in queue.
   */
  Entry tail;
  /**
   * Max number of entries allowed in queue.
   */
  int capacity;
  /**
   * Constructor.
   * @param capacity Max number of items allowed in queue.
   */
  public BoundedQueue(int capacity) {
    this.capacity = capacity;
    this.head = new Entry(0);
    this.tail = head;
    this.size = new AtomicInteger(capacity);
    this.enqLock = new ReentrantLock();
    this.notFullCondition = enqLock.newCondition();
    this.deqLock = new ReentrantLock();
    this.notEmptyCondition = deqLock.newCondition();
  }
  /**
   * Remove and return head of queue.
   * @return remove first item in queue
   */
  public int deq() {
    int result;
    boolean mustWakeEnqueuers = true;
    deqLock.lock();
    try {
      while (size.get() == capacity) {
        try {
          notEmptyCondition.await();
        } catch (InterruptedException ex) {}
      }
      result = head.next.value;
      head = head.next;
      if (size.getAndIncrement() == 0) {
        mustWakeEnqueuers = true;
      }
    } finally {
      deqLock.unlock();
    }
    if (mustWakeEnqueuers) {
      enqLock.lock();
      try {
        notFullCondition.signalAll();
      } finally {
        enqLock.unlock();
      }
    }
    return result;
  }
  /**
   * Append item to end of queue.
   * @param x item to append
   */
  public void enq(int x) {
    boolean mustWakeDequeuers = false;
    enqLock.lock();
    try {
      while (size.get() == 0) {
        try {
          notFullCondition.await();
        } catch (InterruptedException e) {}
      }
      Entry e = new Entry(x);
      tail.next = e;
      tail = e;
      if (size.getAndDecrement() == capacity) {
        mustWakeDequeuers = true;
      }
    } finally {
      enqLock.unlock();
    }
    if (mustWakeDequeuers) {
      deqLock.lock();
      try {
        notEmptyCondition.signalAll();
      } finally {
        deqLock.unlock();
      }
    }
  }
  /**
   * Individual queue item.
   */
  protected class Entry {
    /**
     * Actual value of queue item.
     */
    public int value;
    /**
     * next item in queue
     */
    public Entry next;
    /**
     * Constructor
     * @param x Value of item.
     */
    public Entry(int x) {
      value = x;
      next = null;
    }
  }
}
