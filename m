From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: SSH Brute force attacks
Date: Fri, 6 May 2005 15:03:29 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE58290736C@pxtbenexd01.pxt.primeexalia.com>
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
To: Brent Clark <bclark@eccotours.dyndns.org>, iptables <netfilter@lists.netfilter.org>

A friend of mine wrote a perl script some time ago that would watch the
log and it a number of occurrences happened over a period of time he'd
block the source IP to the SSH port for a period of time.  He'd also
send himself an email if the threshold hit a certain number from a
particular IP address.

Not sure if this directly helps but I figure it wouldn't hurt.

Gary

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Brent Clark
> Sent: Friday, May 06, 2005 8:58 AM
> To: iptables
> Subject: SSH Brute force attacks
>=20
> Hi All
>=20
> One one of my hosted boxes, my logwatch scripts continuously pipe out
my
> ssh and auth log of unsuccessful dictionary attacks
>=20
> I came across this link : http://blog.andrew.net.au/2005/02/17/
>=20
> And seen that it would help me slow (in hope) that malious person
done.
>=20
> Would anyone care to comment / share tips etc on what I have below
>=20
> iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent
--set
> --name SSH
> iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j
SSH_WHITELIST
> iptables -A SSH_WHITELIST -s $MYIPADDRESS -m recent --remove --name
SSH
> -j ACCEPT
> iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent
> --update --seconds 60 --hitcount 4 --rttl --name SSH -j LOG
--log-prefix
> "SSH BRUTE"
> iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent
> --update --seconds 60 --hitcount 4 --rttl --name SSH -j DROP
>=20
> Kind Regards
> Brent Clark


