From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: ip conntrack pptp and nat pptp problem
Date: Wed, 8 Dec 2004 23:17:05 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019828@pxtvjoexd01.pxt.primeexalia.com>
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
To: netfilter@lists.netfilter.org

This question is kinda directed to Harald Welte.  The version that I
have for ip_conntrack is from patch-o-matic-20031219.tar.  Could this be
the problem?  It seems that there is a slightly more update version of
the ip_nat_* files for PPTP in CVS (7 weeks old).  Would those few
changes have an impact on what I am seeing?

I've seemed to have mixed success and failures with PPTP.  When I get
one thing to work something else breaks.  I'm sure the answers out
there.

Gary Smith

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Gary W. Smith
> Sent: Wednesday, December 08, 2004 9:14 PM
> To: netfilter@lists.netfilter.org
> Subject: ip conntrack pptp and nat pptp problem
>=20
> Hello,
>=20
> I have a problem running both of these modules at one time
> (ip_conntrack_pptp and ip_nat_pptp).  Here is my scenario.  We have a
> firewall that is running both poptop and pptpclient under RHEL3.  The
> firewall can accept incoming pptp sessions without fail.  It can also
> make outgoing calls without fail unless ip_nat_pptp is loaded.  When
> ip_nat_pptp is loaded the firewall fails on all outgoing request.
> Clients behind the firewall that need to talk to other pptp servers
> cannot make reliable calls unless ip_nat_pptp is loaded.  If loaded
they
> work fine...
>=20
> Originally I was told that this was handled by ip_conntrack_pptp which
> is loaded but seems to have no effect for calls originating behind the
> firewall.  Here are the modules that I', loading and the order that
I'm
> loading them in (in case that makes a difference)
>=20
>=20
> /sbin/modprobe ip_conntrack_proto_gre
> /sbin/modprobe ip_conntrack_pptp
> /sbin/modprobe ip_nat_proto_gre
> /sbin/modprobe ip_nat_pptp
> /sbin/modprobe ip_conntrack_irc
> /sbin/modprobe ip_nat_irc
> /sbin/modprobe ip_conntrack_ftp
> /sbin/modprobe ip_nat_ftp
> /sbin/modprobe ip_conntrack_mms
> /sbin/modprobe ip_nat_mms
> /sbin/modprobe ipt_LOG
> /sbin/modprobe ip_gre
> /sbin/modprobe ipt_MASQUERADE
> /sbin/modprobe ip_conntrack
> /sbin/modprobe iptable_nat
>=20
> Please note that this is a custom kernel with the conntrack_pptp
module
> loaded (no other changes) as well as a recompiled iptables to match
> (because of the change table space structures).  Iptables is v1.2.11
>=20
> This is something that we have been fighting with for several weeks
now.
> Any help would be greatly appreciated.
>=20
> Gary Smith
>=20


