From: "mdpeters" <michael.peters@lazarusalliance.com>
Subject: Re: transparent bridge troubles?
Date: Fri, 7 Jan 2005 15:36:06 -0500
Message-ID: <001e01c4f4f8$83367ef0$3e0010ac@esonet18>
References: <7C9884991ADAE0479C14F10C858BCDF5679642@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org

I'm afraid I don't understand what you mean by "Write a log rule before and 
after the QUEUE rules".

This is what I have:

/usr/local/sbin/iptables -P FORWARD DROP
/usr/local/sbin/iptables -A FORWARD -p tcp --syn -m state --state NEW -j 
QUEUE
/usr/local/sbin/iptables -A FORWARD -p tcp -m state --state 
RELATED,ESTABLISHED -j QUEUE
/usr/local/sbin/iptables -A FORWARD -p udp -j QUEUE
/usr/local/sbin/iptables -A FORWARD -p icmp -j QUEUE

Do you mean this?

/usr/local/sbin/iptables -P FORWARD DROP
/usr/local/sbin/iptables -A FORWARD -p tcp --syn -m state --state NEW -j 
QUEUE
/usr/local/sbin/iptables -A FORWARD -p tcp --syn -m state --state NEW -j LOG
/usr/local/sbin/iptables -A FORWARD -p tcp -m state --state 
RELATED,ESTABLISHED -j QUEUE
/usr/local/sbin/iptables -A FORWARD -p tcp -m state --state 
RELATED,ESTABLISHED -j LOG
/usr/local/sbin/iptables -A FORWARD -p udp -j QUEUE
/usr/local/sbin/iptables -A FORWARD -p udp -j LOG
/usr/local/sbin/iptables -A FORWARD -p icmp -j QUEUE
/usr/local/sbin/iptables -A FORWARD -p icmp -j LOG

#/usr/local/sbin/iptables -vnxL

Chain INPUT (policy ACCEPT 1179077 packets, 74033865 bytes)
    pkts      bytes target     prot opt in     out     source 
destination

Chain FORWARD (policy DROP 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source 
destination
       0        0 QUEUE      tcp  --  *      *       0.0.0.0/0 
0.0.0.0/0           tcp flags:0x16/0x02 state NEW
       0        0 LOG        tcp  --  *      *       0.0.0.0/0 
0.0.0.0/0           tcp flags:0x16/0x02 state NEW LOG flags 0 level 4
       0        0 QUEUE      tcp  --  *      *       0.0.0.0/0 
0.0.0.0/0           state RELATED,ESTABLISHED
       0        0 LOG        tcp  --  *      *       0.0.0.0/0 
0.0.0.0/0           state RELATED,ESTABLISHED LOG flags 0 level 4
       0        0 QUEUE      udp  --  *      *       0.0.0.0/0 
0.0.0.0/0
       0        0 LOG        udp  --  *      *       0.0.0.0/0 
0.0.0.0/0           LOG flags 0 level 4
       0        0 QUEUE      icmp --  *      *       0.0.0.0/0 
0.0.0.0/0
       0        0 LOG        icmp --  *      *       0.0.0.0/0 
0.0.0.0/0           LOG flags 0 level 4

Chain OUTPUT (policy ACCEPT 2284490 packets, 3277660612 bytes)
    pkts      bytes target     prot opt in     out     source 
destination

----- Original Message ----- 
From: "Daniel Chemko" <dchemko@smgtec.com>
To: "mdpeters" <michael.peters@lazarusalliance.com>; 
<netfilter@lists.netfilter.org>
Sent: Friday, January 07, 2005 3:24 PM
Subject: RE: transparent bridge troubles?



> I am queuing all of the packets to a userspace daemon for
> Snort-inline to process. If Snort is the problem then could you
> advise me on the iptables to pass everything through the transparent
> bridge to eliminate it from the equation?

Write a log rule before and after the QUEUE rules.

You'll probably find that they enter the QUEUE targets section and never
leave. The QUEUE target will never return a packet to the system unless
the userspace program has processed the packet, so it snort-inline is
turned off or broken, none of the matched packets will pass through
QUEUE.

The problem is that there's no graceful timeout period in which QUEUE
assumes that the userspace process is dead. There should be a flag that
says the packet will 'continue'/'drop'/'accept' based on the userspace
program's timeout.



