CFLAGS=-g -Wall --std=gnu99

itox: itox.c itox_c.c
	gcc $(CFLAGS) itox.c itox_c.c -o itox

itox_arm: itox.c itox_arm.s
	gcc $(CFLAGS) itox.c itox_arm.s -o itox_arm

ll: ll.c ll_c.c
	gcc $(CFLAGS) ll.c ll_c.c -o ll

ll_arm: ll.c ll_arm.s
	gcc $(CFLAGS) ll.c ll_arm.s -o ll_arm

tree: tree.c tree_c.c
	gcc $(CFLAGS) tree.c tree_c.c -o tree

tree_arm: tree.c tree_arm.s
	gcc $(CFLAGS) tree.c tree_arm.s -o tree_arm

clean:
	rm -f itox itox_arm ll ll_arm tree tree_arm

