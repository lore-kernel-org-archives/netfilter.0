From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: multiple nat'd clients to poptop
Date: Tue, 14 Dec 2004 15:02:43 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F1BBC@pxtvjoexd01.pxt.primeexalia.com>
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
To: Craig Nellist <nellistc@gmail.com>, netfilter@lists.netfilter.org

>trying to connect to a server which is itself behind a router and NAT'd

You mentioned that you applied the conntrack patch.  Did you do this on =
both the firewalls?  I have had success with the following.  Note that I =
have disabled ip_nat_pptp.  If I load ip_nat_pptp then only one person =
can connect and on the first time only.  Subsequent attempts fail.  I =
have asked but received no feedback on this as well.  But hopefully this =
will help you as well.

Anyways, here's what I run and the order that I run them in.  The =
firewall currently has two active incoming connections I did test =
multiple outgoing connections when I configured it. =20

/etc/rc.d/rc.local:
/sbin/modprobe ip_conntrack_proto_gre
/sbin/modprobe ip_conntrack_pptp
/sbin/modprobe ip_nat_proto_gre
#/sbin/modprobe ip_nat_pptp
/sbin/modprobe ip_conntrack_irc
/sbin/modprobe ip_nat_irc
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp
/sbin/modprobe ip_conntrack_mms
/sbin/modprobe ip_nat_mms
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_TARPIT
/sbin/modprobe ip_gre
/sbin/modprobe ipt_MASQUERADE
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_nat=20

=20
