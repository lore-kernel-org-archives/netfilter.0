From: "Jamie Vuyk" <jvuyk@jacobson.co.uk>
Subject: GRE/PPTP
Date: Mon, 1 Sep 2003 13:02:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <8EC0756327A4994298EFD721CFC7355B01B14C@jfm2.jacobson.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

This is a followup on an older question regarding passing through a VPN
that I couldn't see a resolution for.  I have done a whole heap of
searching around the net and there are conflicting opinions.  I would be
nice to get a firm answer...

( http://lists.netfilter.org/pipermail/netfilter/2002-June/035176.html
<http://lists.netfilter.org/pipermail/netfilter/2002-June/035176.html> )

=20

Basically there are two aspects to my problems:

1)       Does the standard kernel (RH 2.4.18) need to be patched in any
way in order to PASS THROUGH proto 47 (GRE) to an internal server?  Im
running a simply iptables firewall which I want to pass an external VPN
connection through to an internal server.  As I understand if I want
Linux to terminate the PPTP VPN I need a patch, if I want it to pass
through I don't.  However I am having a lot of trouble getting this to
work and I would like to know if Im on the right track.  Also note that
the firewall is masquerading all connections.

=20

2)       I have setup my firewall to allow and forward the 1723 to my
internal server.  This appears to work but the external Win2k box gets
stuck on "verifying username and password".  This eventually times out
with "disconnected".  A simple test was to Telnet to port 1723.
Although there is no response as such from the server (expected) it does
connect both internally and externally.  At what point does the 1723
data exchange end and the "payload" as such start on the GRE protocol?
Is GRE involved in the 'verifying username and password' stage or is
that still TCP on 1723?

=20

If you could get some basic info I maybe able to troubleshoot this and
get it operational.

Cheers for you help.

J

=20

=20

=20

=20


