From: "Hammond, Jeffrey" <Jeffrey.Hammond@tekelec.com>
Subject: RE: Passing X11 through  IPTABLES NAT
Date: Thu, 12 May 2005 06:55:52 -0500
Message-ID: <D1D49B61B5B64B4A8FB647B97BEC4ED9025521D9@DCEVS1.tekelec.com>
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

Thank you;

	I actually got this to work doing exactly what you mentioned. I
went from masquerading to dnat & snat and it worked.=20

	My problem now is that when I have 2 clients connected via the
same VPN I can only get the DISPLAY back to an individual client (which
ever one is the source IP in the SNAT statement). Putting a range of
I.P.'s (i.e. --to-source 192.168.10.50-192.168.10.70) doesn't give me
any display back.

	I'm assuming I'm not connection or stream tracking.

Jeff Hammond
Customer Suppport
972 461 4152

-----Original Message-----
From: Sietse van Zanen [mailto:sietse@wizdom.nu]=20
Sent: Thursday, May 12, 2005 2:12 AM
To: Hammond, Jeffrey
Subject: RE: Passing X11 through IPTABLES NAT

 Hi,

This is most likely due to the fact, that the X11 connection is opened
in
the other direction. You will need to do some SNAT back to your clients.

It goes like this:
Client telnets ---> Server
Server X11 ---> Client. (In fact your clients runs the X11 server, and
the
server the X11 client).

Greets.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Hammond,
Jeffrey
Sent: 10 May 2005 14:20
To: netfilter@lists.netfilter.org
Subject: Passing X11 through IPTABLES NAT

All;

            I'm using IPTABLES to NAT various client LINUX boxes through
a
VPN server. I'm able to connect through the server, NAT the client and
out
the VPN connection successfully. Telnet is successful. However when I
try to
export the X display back to my client I receive 'Can't open Display
<I.P.>'
where the I.P. is that of the NAT'd client from the host, and see and
'invalid data' packet while sniffing on the client.
I've tried DNATting X11 port 6000 packets back to the original I.P. with
no
success.

=20

            Any help would be appreciated.

=20

Jeff Hammond

=20





