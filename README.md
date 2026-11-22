# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Name
Section 2, Group 6: Gabe and Everett

## Summary
In this lab, we created two different approaches to a state machine. We
implemented a One Hot state machine, which uses a D-Latch to represent each
state being "on" or "off." This creates a generally readable and easy-to-
understand approach to a state machine. A disadvantage of this is that many
D-Latches, and therefore many components, are used to represent even a small
amount of states. A more resource-efficient approach to this is to use a Binary
state machine, which keeps track of each state's number in binary format to hold
the current state. 

## Lab Questions

### Compare and contrast One Hot and Binary encodings
One Hot encoding uses more D-Latches to keep track of the current state, having
each latch represent one state, having one on at any time and the remaining off.
Binary encoding, on the other hand, only uses as many D-Latches needed to store
the number of states as a binary number value. The next state is then found
using an equation found with K-maps.

### Which method did your team find easier, and why?
We found it easier to logically wrap our heads around the One Hot because it is
conceptually simpler to understand. One D-Latch is equal to one state, which is
easier to write than finding the entire next state as a binary number in a K-map.

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
It makes more sense to use the Binary state machine when you have limited
resources available because it uses significantly fewer D-Latches as the size of
a state machine grows. This would free up resources to other modules in the FPGA.
