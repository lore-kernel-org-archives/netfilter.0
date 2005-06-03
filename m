From: "Ginter, Jeff A" <Jeff.Ginter@ca.com>
Subject: 2 Questions--state (est, rel) and tuning
Date: Fri, 3 Jun 2005 08:59:06 -0400
Message-ID: <B80488675062364A909EE60F4A66603807840D05@usilms23.ca.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

=20

I am brand new to the list and couldn't find an easy way to browse the
whole archive, so my apologies if this has been discussed (as it
probably has).

=20

I understand the state concepts, however, I keep seeing example iptable
scripts with the first rule in each chain being something like....ACCEPT
related and established packets. =20

=20

My first question is...Is that really needed?  In my other experiences
with stateful firewalls this rule is not needed because the firewall
remembers the outgoing packet and the rule is implied...or do I have
this very wrong?

=20

=20

My second question, which may not be totally applicable for this list
is...I have my netfilter/iptables set up on a Redhat 4 Ent WS box...are
the following parameters for hardening still useful and applicable with
the current kernel and distro?

=20

net.ipv4.tcp_syncookies =3D 1
net.ipv4.conf.all.accept_source_route =3D 0
net.ipv4.conf.all.accept_redirects =3D 0
net.ipv4.conf.all.rp_filter =3D 1
net.ipv4.icmp_echo_ignore_all =3D 1 =3D 1
net.ipv4.icmp_echo_ignore_broadcasts =3D 1
net.ipv4.icmp_ignore_bogus_error_responses =3D 1
net.ipv4.conf.all.log_martians =3D 1

=20

=20

Thanks very much for any help!

=20

=20

=20

Jeff Ginter, CISSP

Computer Associates

Mid-Atlantic Consulting Manager

tel:    +1 908 874-9726

cell:   +1 609 577-1494

jeff.ginter@ca.com

=20

=20

