From: "Newton" <newton@netfids.com>
Subject: Module for Oracle with NAT
Date: Wed, 5 Mar 2003 10:21:49 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008e01c2e32a$f302e520$99e0e20a@int.tp.com.pe>
References: <3e660b98.769a.0@unacs.bg>
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
To: netfilter@lists.netfilter.org

Hi,

Friends Do you know if are there any module of kernel to work Oracle with
NAT ,????

Newton.


----- Original Message -----
From: <nedco@unacs.bg>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, March 05, 2003 9:37 AM
Subject: iptables dropping wrong packets


>
>
>
> Hi,
>
> looks like some of correct packes are droped
>
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
> num   pkts bytes target     prot opt in     out     source
destination
>
> 1    36142   16M ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0
>          TOS
> match 0x00
> 2     168K   54M ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0
>          TOS
> match 0x10
> 3       27  1782 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0
>          LOG
> flags 0 level 4
> 4       27  1782 DROP       all  --  *      *       0.0.0.0/0
0.0.0.0/0
>
>
>
> in log we can see that TOS of packets is 0x0 they are also packets with
0x10
>
>
>
> Mar  5 04:32:10 proliant kernel: IN=eth0 OUT=eth1 SRC=62.176.73.4
DST=62.176.105.30
> LEN=76
> TOS=0x00 PREC=0xC0
> Mar  5 04:32:15 proliant kernel: IN=eth0 OUT=eth1 SRC=62.176.73.4
DST=62.176.105.30
> LEN=76
> TOS=0x00 PREC=0xC0
> Mar  5 04:32:18 proliant kernel: IN=eth1 OUT=eth0 SRC=212.5.149.252
DST=212.5.134.3
> LEN=87
> TOS=0x00 PREC=0xC0
> Mar  5 04:32:19 proliant kernel: IN=eth0 OUT=eth2 SRC=62.176.73.4
DST=62.176.106.69
> LEN=88
> TOS=0x00 PREC=0xC0
> Mar  5 04:32:19 proliant kernel: IN=eth0 OUT=eth1 SRC=62.176.73.4
DST=62.176.105.30
> LEN=76
> TOS=0x00 PREC=0xC0
> Mar  5 04:32:29 proliant kernel: IN=eth0 OUT=eth2 SRC=195.230.9.159
DST=62.176.106.69
> LEN=48
> TOS=0x00 PREC=0x8
> Mar  5 04:32:31 proliant kernel: IN=eth0 OUT=eth1 SRC=62.176.73.4
DST=62.176.105.30
> LEN=76
> TOS=0x00 PREC=0xC0
> Mar  5 04:32:32 proliant kernel: IN=eth0 OUT=eth2 SRC=195.230.9.159
DST=62.176.106.69
> LEN=48
> TOS=0x00 PREC=0x8
>
> Am I doing something wrong?
>
> 10x in advance
> Nedko


