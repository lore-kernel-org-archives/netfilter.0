From: Saulius Menkevicius <razzmatazz@mail.lt>
Subject: a way to forward packets to another gateway?
Date: Mon, 9 Dec 2002 00:33:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ISPFE815jM1wrv0BFF500082938@mail.takas.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

=09Is there a way of forwarding certain types of packets to another=
 
gateway on the same LAN?
=09For example I have 2 gateways on the same network (10.0.0.1 & 
10.0.0.2), both are ADSLs and have a bunch of clients which are 
evenly masqueraded on them. There is Squid running on 10.0.0.1=
 and 
I'd like for the www connections comming from clients sitting on=
 
10.0.0.2 gateway to be redirected to squid on 10.0.0.1. 10.0.0.1=
 runs 
transparent proxy. It should be as simple as transmitting=
 unchanged 
packets to another gateway on the receiving (internal to LAN) 
interface. Still I could not find a way to do such thing on 
linux/iptables.

=09In FreeBSD there is ipfw rule which does the thing:
=09=09ipfw fwd 10.0.0.1 tcp from some_client to any 80

=09I'm open to any other remedies I don't know of (such as some=
 kind of 
DNAT/SNAT). I.e. this is just my guess on how to make it work.

=09Thanks
-- 
Saulius Menkevicius, razzmatazz@mail.lt on 2002.12.09


