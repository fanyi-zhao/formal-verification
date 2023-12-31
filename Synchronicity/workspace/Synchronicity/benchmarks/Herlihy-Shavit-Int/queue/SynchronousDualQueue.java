///*
// * SynchronousQueueDual.java
// *
// * Created on March 12, 2006, 5:56 PM
// *
// * From "The Art of Multiprocessor Programming"
// * by Maurice Herlihy and Nir Shavit.
// * Copyright 2006 Elsevier Inc. All rights reserved.
// */
//
//package queue;
//
//import java.util.concurrent.atomic.AtomicReference;
//
///**
// * Dual Synchronous Queue.
// * Based on "Scalable Synchronous Queues", by W. N. Scherer III, Doug Lea,
// * and M. L. Scott.  Symposium on Principles and Practice of Parallel
// * Programming, March 2006.
// * @author Maurice Herlihy
// */
//public class SynchronousDualQueue {
//  AtomicReference<Node> head;
//  AtomicReference<Node> tail;
//  /**
//   * Constructor: creates an empty synchronous queue.
//   */
//  public SynchronousDualQueue() {
//    Node sentinel = new Node(null, NodeType.ITEM);
//    head = new AtomicReference<Node>(sentinel);
//    tail = new AtomicReference<Node>(sentinel);
//  }
//  /**
//   * Append item to end of queue.
//   * @param e item to append
//   */
//  public void enq(int e) {
//    Node offer = new Node(e, NodeType.ITEM);
//    while (true) {
//      Node t = tail.get();
//      Node h = head.get();
//      if (h == t || t.type == NodeType.ITEM) {
//        Node n = t.next.get();
//        if (t == tail.get()) {
//          if (n != null) {
//            tail.compareAndSet(t, n);
//          } else if (t.next.compareAndSet(n, offer)) {
//            tail.compareAndSet(t, offer );
//            while (offer.item.get() == e); // spin
//            h = head.get();
//            if (offer == h.next.get()) {
//              head.compareAndSet(h, offer);
//            }
//            return;
//          }
//        }
//      } else {
//        Node n = h.next.get();
//        if (t != tail.get() || h != head.get() || n == null) {
//          continue; // inconsistent snapshot
//        }
//        boolean success = n.item.compareAndSet(null, e);
//        head.compareAndSet(h, n);
//        if (success) {
//          return;
//        }
//      }
//    }
//  }
//  /**
//   * remove item from front of queue
//   * @return item removed
//   */
//  public int deq() {
//    Node offer = new Node(null, NodeType.RESERVATION);
//    while (true) {
//      Node t = tail.get();
//      Node h = head.get();
//      if (h == t || t.type == NodeType.RESERVATION) {
//        Node n = t.next.get();
//        if (t == tail.get()) {
//          if (n != null) {
//            tail.compareAndSet(t, n);
//          } else if (t.next.compareAndSet(n, offer)) {
//            tail.compareAndSet(t, offer);
//            while (offer.item.get() == null); // spin
//            h = head.get();
//            if (offer == h.next.get()) {
//              head.compareAndSet(h, offer);
//            }
//            return offer.item.get();
//          }
//        }
//      } else {
//        Node n = h.next.get();
//        if (t != tail.get() || h != head.get() || n == null) {
//          continue; // inconsistent snapshot
//        }
//        int item = n.item.get();
//        boolean success = n.item.compareAndSet(item, null);
//        head.compareAndSet(h, n);
//        if (success) {
//          return item;
//        }
//      }
//    }
//  }
//
//  private enum NodeType {ITEM, RESERVATION};
//  private class Node {
//    volatile NodeType type;
//    volatile AtomicReference item;
//    volatile AtomicReference<Node> next;
//    Node(int item, NodeType type) {
//      this.item = new AtomicReference(item);
//      this.next = new AtomicReference<Node>(null);
//      this.type = type;
//    }
//    public String toString() {
//      return "Node[" + type +
//          ", item: " + item +
//          ", next: " + next +
//          "]";
//    }
//  }
//}
