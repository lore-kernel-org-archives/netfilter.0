From: "Gary W. Smith" <gary@primeexalia.com>
Subject: PPTP problems again, still no solution
Date: Wed, 12 Jan 2005 22:34:25 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F0198C5@pxtvjoexd01.pxt.primeexalia.com>
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

Hello,=20

This is a repeat of a former post which is still unresolved...

I have been having a hell of a time with the ip_nat_pptp filter working
with a machine running POPTOP and PPTP-client.  Our current environment
(RHEL 3).  I've emailed the author with no response to day.

We have tried a few scripting solutions but nothing seems to be working.

Here is a link to the general configuration
http://www.localassociates.com/gary/alamo-network-diagram.png.

Brief overview.  We have office A which connects to office B with a
persistent PPTP connection.  Site A is using pptpclient and site B is
running poptop.  This link works well unless I load ip_nat_pptp.  I can
load ip_nat_proto_gre but it doesn't seem to impact it.  This part works
great.=20

We have mobile contractors coming from their remote offices.  When they
get to our office primary office (site A) and they try to make a
connection to their personal office (running POPTOP of Windows) it
fails.  Loading ip_nat_pptp and ip_nat_proto_gre then the clients can
indeed connect to the remote sites but now I run into problems from site
A's firewall making a connection going out.  One thing to note is that
the server fails to connect when ip_nat_proto_gre and ip_nat_pptp are
loaded.  If either of these two modules are unloaded (doesn't matter
which one) then the connection will succeed.  But if both of these
modules are not loaded then the clients behind it (weather XP or Linux)
cannot connect.

How can we configure the firewall in such a way that it can open
connections to external PPTP servers at the same time having machines
behind it open up connections to other firewalls?  Please note we did
patch the servers using patch-o-matic 20031219.  We've tried the newer
patch-o-magic-ng but there seems to be some versioning issues.  Behind
an MS server this works fine.

What we have tried a couple things.  We put a script in place that will
unload ip_nat_pptp before making the outgoing call from the server then
waiting until the call is done and reloading it.  That gave us mixed
results as it works for a couple minutes before the tunnel collapses.

Here is out load script:

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
/sbin/modprobe iptable_nat


We have tested this with iptables completely open to troubleshoot.  It
didn't help.


