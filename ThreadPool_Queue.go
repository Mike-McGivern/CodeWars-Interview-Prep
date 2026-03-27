package kata

import "container/heap"

//min heap of ints representing each current workload
type IntHeap []int

func (h IntHeap) Len() int {return len(h)}
func (h IntHeap) Less(i, j int) bool {return h[i] < h[j]}
func (h IntHeap) Swap(i, j int) {h[i], h[j] = h[j], h[i]}
func (h *IntHeap) Push(x interface{}) {*h = append(*h, x.(int))}
func (h *IntHeap) Pop() interface{} {
  old := *h
  n := len(old)
  x := old[n-1]
  *h = old[:n-1]
  return x
}

func QueueTime(thread []int, n int) int {
  if(len(thread) == 0) {
    return 0
  } 
    tills := &IntHeap{}
    heap.Init(tills)
    for i := 0; i < n; i++ {
      heap.Push(tills, 0)
    }
    
    for _, t := range thread {
      earliest := heap.Pop(tills).(int)
      heap.Push(tills, earliest + t)
    }
    
    max := 0
    for tills.Len() > 0 {
      v := heap.Pop(tills).(int)
      if v > max {
        max = v
      }
    }
    
    return max
}

