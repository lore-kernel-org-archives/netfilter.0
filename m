From: Andrei Ivanov <andrei.ivanov@ines.ro>
Subject: tos 0x62
Date: Mon, 16 Sep 2002 17:51:14 +0300 (EEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209161748060.6328-100000@webdev.ines.ro>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hello,
I'm trying to filter packets which have a TOS value of 0x62, and it seems 
I cannot.
I tried the tos module, but it only knows valid tos values.
I look for the ftos module from patch-o-matic, but it seems it has been 
obsoleted by DSCP and ECN module.
If I try iptables -I acc_IN -i eth1 -m dscp --dscp 0x62 it spits out:
iptables v1.2.7a: DSCP `98` out of range

How can I do this ?
(I coudln't search the mail archives for this problem because this mailing 
list manager doesn't offer such a facility)


