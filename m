From: "mdpeters" <michael.peters@lazarusalliance.com>
Subject: transparent bridge troubles?
Date: Fri, 7 Jan 2005 15:14:13 -0500
Message-ID: <001501c4f4f5$749ae690$3e0010ac@esonet18>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Here is the output you requested:

#/usr/local/sbin/iptables -vnxL

Chain INPUT (policy ACCEPT 1177615 packets, 73906075 bytes)
    pkts      bytes target     prot opt in     out     source            =
   destination

Chain FORWARD (policy DROP 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source            =
   destination
       0        0 QUEUE      tcp  --  *      *       0.0.0.0/0           =
 0.0.0.0/0           tcp flags:0x16/0x02 state NEW
       0        0 QUEUE      tcp  --  *      *       0.0.0.0/0           =
 0.0.0.0/0           state RELATED,ESTABLISHED
       0        0 QUEUE      udp  --  *      *       0.0.0.0/0           =
 0.0.0.0/0
       0        0 QUEUE      icmp --  *      *       0.0.0.0/0           =
 0.0.0.0/0

Chain OUTPUT (policy ACCEPT 2283371 packets, 3277380013 bytes)
    pkts      bytes target     prot opt in     out     source            =
   destination

I am queuing all of the packets to a userspace daemon for Snort-inline =
to process. If Snort is the problem then could you advise me on the =
iptables to pass everything through the transparent bridge to eliminate =
it from the equation?

Best regards,

Michael
