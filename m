From: Banszki Gabor <banszki.gabor@chello.hu>
Subject: queue buffer size increasing howto?
Date: Sun, 22 Aug 2004 15:40:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093182015.17276.24.camel@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

 
Hi everybody!

Greetings for you! I am a new member of this list. 

Please somebody help me!

I am developing an application for counting and processing packets in a
linux box with using the ip_queue module. 

It is working properly, but sometimes I have a problem, that I get often
this message:

Failed to receive netlink message, No buffer space available

Maybee the cause of this, that the box has a lot of short hardly tasks
sometimes. 
I think the solution to prevent the packet loss If I would increase the
queue length. I did it with this command:

echo 2048 > /proc/sys/net/ipv4/ip_queue_maxlen

#cat /proc/net/ip_queue
Peer PID          : 23985
Copy mode         : 2
Copy range        : 2048
Queue length      : 184
Queue max. length : 2048

The enviroment:
 2.4.26 kernel and  iptables: 1.2.9 with promiscuous patch 1.2.3


With this command: watch -n 0 "cat /proc/net/ip_queue" during my
application running the biggest number of "Queue length" is 255.

I don't understand it, because the "Queue max. length" is 2048.

How can I increase the queue length?

What is the really method of the queue increasing?

Thanx:

Gabor











