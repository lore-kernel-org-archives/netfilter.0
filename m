From: Rocco Stanzione <iptables@linuxkungfu.org>
Subject: A few questions
Date: Fri, 15 Nov 2002 02:20:58 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211150220.58430.iptables@linuxkungfu.org>
Reply-To: grasshopper@linuxkungfu.org
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
To: netfilter@lists.samba.org

I have a few questions about iptables, and about some of the traffic I've=
 seen=20
on this list.

1) I've successfully set up DNAT so that I can, say, request port 81 on t=
he=20
firewall/gateway box and hit the webserver on port 80 on a box behind the=
=20
gateway.  No problem.  But it doesn't work on the LAN.  I understand why,=
=20
after reading some docs, but I've been trying to find a way around it. =20
Problem is, I don't know what all iptables will auto-reverse for me and w=
hat=20
I need to specify.  For example, I suppose I could SNAT local connections=
=20
through the gateway --to-source $GATEWAYIP, but would returning packets b=
e=20
taken care of, or must I come up with a rule for that?  I've tried both=20
without success.

2) Quite a few people are using my iptables script, and the most common=20
complaint I get is dcc failure.  ip_conntrack_irc (and everything else) i=
s=20
compiled into my (monolithic) kernel.  Most people don't have this setup.=
 =20
Dcc of course works for me.  I have the user modprobe ip_conntrack_irc, a=
nd=20
typically it still doesn't work for them.  Logs show it failing at a=20
catch-all rule, which tells me conntrack isn't working.  However if we ad=
d=20
ip_conntrack_irc to /etc/modules and reboot, all is well.  So, 2a) why is=
=20
this? and 2b) surely there's something less drastic than a reboot that wi=
ll=20
put ip_conntrack_irc to work?

3) I see quite a few messages on the list about people going to a great d=
eal=20
of trouble to get a VPN connection to NAT through an iptables firewall.  =
I=20
have an always-on PPTP connection to the M$ VPN server at work, and I hav=
e=20
never had to do anything special to get it to work.  I have to assume, th=
en,=20
that I have some liberal rule or policy that is likely insecure, and I wo=
nder=20
what it could be.  I'm afraid I don't have a pasteable rule set, as it's=20
spread out across config files and such.  If anyone cares to pore over it=
,=20
it's at http://www.linuxkungfu.org/ipkungfu-0.2.0.tgz

Thanks!

Rocco

