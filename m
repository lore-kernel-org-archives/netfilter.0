From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Authentication in a Firewall Question
Date: Wed, 25 Aug 2004 10:02:38 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF56794AA@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: "Hihn, Jason" <Jason.Hihn@verint.com>, netfilter@lists.netfilter.org


> A firewall that rejects all traffic to everyone, except for one port.
> This one port is used to authenticate an IP address through a
> challenge/response algorithm.
> If successful, the IP is then allowed through the firewall.
> After a period of idle time, the IP is removed from the allow table.

This one isn't well supported by many clients at this point. I was
looking into developing something to fix that, but it didn't happen.

> This seems like simple way to protect the box from script kiddies.
> Does anyone know of a product like this in existence?

pam_iptables is a nice tool, although it needs a little updating to
assign custom rules per/user, etc.. It requires that you have an open
out-of-band connection to a pam service on the firewall. This could be
SSH for instance. The plus is that installation is relatively straight
forward and you can use any authentication mechanism through PAM that
you see fit. The negative is that you're tied to keeping that pam
program open. Once the program is shutdown, the firewall rules close up.

Of course, Checkpoint has all of this integrated if you're willing to
spend serious cash for the functionality. Connect to telnet/etc.. type
username/password, then the rest is taken care of by daemons controlled
by the connection's policy. (Totalconnections, total bandwidth, timeout,
etc..)


