From: "Thomas Raef" <traef06@ebasedsecurity.com>
Subject: RE: ipset not blocking
Date: Wed, 15 Mar 2006 11:20:36 -0600
Message-ID: <D2EA20593E6AAD4DA6D07DE0EC12D1610133DB@ebs-2200.ebasedsecurity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

But my previous rule that uses -m set is before the rules you list.

Any ideas?

Your email server blocks my messages to you.

I get:

Your message did not reach some or all of the intended recipients.

      Subject:	RE: ipset not blocking
      Sent:	3/15/2006 10:51 AM

The following recipient(s) could not be reached:

      Jozsef Kadlecsik on 3/15/2006 10:49 AM
            There was a SMTP communication problem with the recipient's
email server.  Please contact your system administrator.
            <mail.ebasedsecurity.com #5.5.0 smtp;550
<kadlec@blackhole.kfki.hu>: Recipient address rejected: Access denied.
Your site is banned because of the unsolicited mail messages received
from it.>

I check my blacklists frequently and I don't see me on any blacklists.
What's blocking me?

-----Original Message-----
From: Jozsef Kadlecsik [mailto:kadlec@blackhole.kfki.hu]=20
Sent: Wednesday, March 15, 2006 11:16 AM
To: Thomas Raef
Cc: netfilter@lists.netfilter.org
Subject: RE: ipset not blocking

On Wed, 15 Mar 2006, Thomas Raef wrote:

> I was looking to block traffic to my port 25 (gateway device) from a
> list of CIDRs that I obtained from arin, apnic, ripe, lacnic &
afrinic.
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
> ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp
dpt:520
>
> DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp
> spts:67:68
> ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
dpt:873
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

