From: "Martinez, Michael" <MMARTINEZ@CSREES.USDA.GOV>
Subject: Re: Additional Security
Date: Sat, 20 Sep 2003 09:27:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <83EED274D3127740995A6B621B88F2E1DF7D29@csrees-exchange.csrees.usda.gov>
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
To: alagana@discmail.com, JALaramie@Loudoun-Fairfax.com, netfilter@lists.netfilter.org

Yes, it's a good idea to install and run tripwire. Since it is a file =
integrity checker, it is complementary to the other packages listed =
below. Make sure to maintain a CD copy of the database that tripwire =
generates when you initialize it.

The drawback is that if you have a file system that changes frequently =
(dynamic), then you either have to frequently update the database, which =
is cumbersome and wasteful of CDs, or you find yourself reading =
ever-growing Tripwire reports.

Mike

--------------------------
Sent from my BlackBerry Wireless Handheld


-----Original Message-----
From: Aldo S. Lagana <alagana@discmail.com>
To: 'Jeffrey Laramie' <JALaramie@Loudoun-Fairfax.com>; =
netfilter@lists.netfilter.org <netfilter@lists.netfilter.org>
Sent: Fri Sep 19 13:39:40 2003
Subject: RE: Additional Security

Tripwire seems to be a filesystem monitor - I wouldn't necessarily run =
it or
feel more secure running it, but others may disagree...
I run portsentry, snort, squid and iptables (along with poptop and =
freeswan
VPN servers)


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Jeffrey =
Laramie
Sent: Friday, September 19, 2003 1:15 PM
To: netfilter@lists.netfilter.org

Hi All,

I previously used Redhat releases for my firewall boxes, and they=20
install iptables and tripwire by default. I have switched to SuSE 8.2=20
which doesn't install tripwire by default. My question is:

Do you think it's worthwhile to install and configure tripwire on an=20
iptables firewall box?

I can't think of a better forum to get a straight opinion on this and I=20
think this topic is of interest to most of the list members. However I=20
understand this thread is off topic and will gladly take it off list or=20
move it to another forum if you can suggest one.

Jeff





