From: "terry l. ridder" <artisticforge@gmail.com>
Subject: Re: iptables leaking blocked ip addresses.
Date: Mon, 20 Jun 2005 12:20:01 -0500
Message-ID: <49bf7d70506201020643ab165@mail.gmail.com>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201055.25861.rob0@gmx.co.uk>
	<49bf7d7050620091748a270fc@mail.gmail.com>
	<200506201159.46123.rob0@gmx.co.uk>
Reply-To: "terry l. ridder" <artisticforge@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506201159.46123.rob0@gmx.co.uk>
Content-Disposition: inline
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
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

hello;

reply below.

On 6/20/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Monday 20 June 2005 11:17, terry l. ridder wrote:
> > while i have reservations concerning posting the output of
> > iptables-save i have placed it on my web server:
> >
> > http://204.238.34.206/iptables-save-20jun2005.txt
>=20
> Yikes, this is very long. First, I see that you're doing all your
> filtering in nat, PREROUTING and POSTROUTING. Why?
>

because that is the way i know that works.
it has worked fine for many years. it was not until i upgraded the
firewall machine (new computer with debian sarge) that iptables
began to leak.

>
> I prefer to do filtering in the filter table as $DEITY intended. :)
>=20

<major sniip>

one of the reasons for using table nat is to dnat all ip addresses with
destination port 25 (smtp) to the mail server, 204.238.34.206.

connection tracking is turned off since at one time i was
using tarpit instead of just dropping the connections.
tarpitting all of lacnic, apnic, a large portion of ripencc, and a large po=
rtion
of arin became boring. now i just drop the connections.

i have added logging on both the firewall box, 204.238.34.232, and the mail
server, 204.238.34.206. both boxes will be logging the leaks.

--=20
terry l. ridder ><>

