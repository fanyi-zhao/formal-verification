/*
 * UnboundedQueue.java
 *
 * Created on March 8, 2006, 8:02 PM
 *
 * From "The Art of Multiprocessor Programming"
 * by Maurice Herlihy and Nir Shavit.
 * Copyright 2006 Elsevier Inc. All rights reserved.
 */

package queue;

import java.util.concurrent.locks.ReentrantLock;
import queue.EmptyException;

/**
 * Bounded, blocking queue
 * @param int item type
 * @author Maurice Herlihy
 */
public class UnboundedQueue {

  /**
   * Lock out other enqueuers (dequeuers)
   */
  ReentrantLock enqLock, deqLock;
  /**
   * First entry in queue.
   */
  Node head;
  /**
   * Last entry in queue.
   */
  Node tail;
  /**
   * Queue size.
   */
  int size;
  /**
   * Constructor.
   */
  public UnboundedQueue() {
    head = new Node(0);
    tail = head;
    enqLock = new ReentrantLock();
    deqLock = new ReentrantLock();
  }  
  /**
   * @return remove first item in queue
   * @throws queue.EmptyException 
   * 
   */
  public int deq() throws EmptyException {
    int result;
    deqLock.lock();
    try {
      if (head.next == null) {
        throw new EmptyException();
      }
      result = head.next.value;
      head = head.next;
    } finally {
      deqLock.unlock();
    }
    return result;
  }
  /**
   * Appende item to end of queue.
   * @param x item to append
   */
  public void enq(int x) {
    enqLock.lock();
    try {
      Node e = new Node(x);
      tail.next = e;
      tail = e;
    } finally {
      enqLock.unlock();
    }
  }

  /**
   * Individual queue item.
   */
  protected class Node {
    /**
     * Actual value of queue item.
     */
    public int value;
    /**
     * next item in queue
     */
    public Node next;
    /**
     * Constructor
     * @param x Value of item.
     */
    public Node(int x) {
      value = x;
      next = null;
    }
  }
}
