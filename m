From: "Mardaga Stephan" <smardaga@brutele.be>
Subject: Re: Masquerade don't masquerade
Date: Wed, 25 Aug 2004 21:40:12 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <004d01c48adb$5b9d4180$c6ea44d4@famille>
References: <D5C9032B2B09C64EA2409D6214E91AC90512E3@asimail2.alphanumeric.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

From: "Jason Opperisano" <Jopperisano@alphanumeric.com>


>  iptables release 1.2.6a
>  Linux  2.4.18-bf2.4 #1 Son Apr 14 09:53:28 CEST 2002 i686 unknown
>
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
>
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> LOG        all  --  anywhere             anywhere           LOG level
> warning
> MASQUERADE  all  --  192.168.1.0/24       anywhere
> LOG        all  --  anywhere             anywhere           LOG level
> warning
>
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>
> Any help and/or suggestions will be accepted gratefully.

blind gues would be that you have the wrong interface specified in your
MASQUERADE rule.  can you post the output of "iptables -t nat -vnL" instead
of just "-nL" so we can see the in/out interfaces.

here are :

Chain PREROUTING (policy ACCEPT 643 packets, 82862 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain POSTROUTING (policy ACCEPT 61 packets, 18460 bytes)
 pkts bytes target     prot opt in     out     source
destination
   55 16492 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          LOG flags 0 level 4
    0     0 MASQUERADE  all  --  *      eth0    192.168.1.0/24
0.0.0.0/0
   55 16492 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          LOG flags 0 level 4

Chain OUTPUT (policy ACCEPT 61 packets, 18460 bytes)
 pkts bytes target     prot opt in     out     source
destination

Stef


