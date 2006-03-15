From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: ipset not blocking
Date: Wed, 15 Mar 2006 18:16:10 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0603151809450.13629@blackhole.kfki.hu>
References: <D2EA20593E6AAD4DA6D07DE0EC12D1610133DA@ebs-2200.ebasedsecurity.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D2EA20593E6AAD4DA6D07DE0EC12D1610133DA@ebs-2200.ebasedsecurity.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Raef <traef06@ebasedsecurity.com>
Cc: netfilter@lists.netfilter.org

On Wed, 15 Mar 2006, Thomas Raef wrote:

> I was looking to block traffic to my port 25 (gateway device) from a
> list of CIDRs that I obtained from arin, apnic, ripe, lacnic & afrinic.
>
> I don't think my idea will work as it appears the sending host
> continually retries sending the message with just a -j DROP in my
> iptables. I guess I need to send a 553 message so it stops trying.

Yes, that's how SMTP supposed to work.

> But I'd still like to know why it's not blocking.
>
> Here is my iptables -nL:
>
> Chain INPUT (policy DROP)
> target     prot opt source               destination
> DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp
> dpts:135:139
> ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:520
>
> DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp
> spts:67:68
> ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:873
>
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0

This rule catches and accepts everything.

> Chain FORWARD (policy DROP)
> target     prot opt source               destination
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
> RELATED,ESTABLISHED
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
> RELATED,ESTABLISHED
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state NEW
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state NEW

Duplicated rules, but anyway, these state rules catch and accept
everything (except INVALID).

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

