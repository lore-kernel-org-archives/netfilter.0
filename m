From: Charlie Brady <charlieb-netfilter@budge.apana.org.au>
Subject: Re: SSH Brute force attacks
Date: Mon, 16 May 2005 21:05:12 -0400 (EDT)
Message-ID: <Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>
References: <427B93EE.3030905@eccotours.dyndns.org>
	<427C4EA3.5090501@riverviewtech.net>
	<4281FC1A.8090000@eccotours.dyndns.org>
	<42824D1E.7040508@riverviewtech.net>
	<4285C016.2060900@wp.pl> <42864CA9.7050802@riverviewtech.net>
	<428856F8.60706@wp.pl>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463811723-528495441-1116291912=:3744"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <428856F8.60706@wp.pl>
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
To: =?ISO-8859-2?Q?=A3ukasz_Hejnak?= <sziftgroup@wp.pl>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811723-528495441-1116291912=:3744
Content-Type: TEXT/PLAIN; charset="iso-8859-2"; format="flowed"
Content-Transfer-Encoding: quoted-printable


On Mon, 16 May 2005, [ISO-8859-2] =A3ukasz Hejnak wrote:

> But as for the recent module itself it's a werid one, cause it looks like=
 my=20
> iptables don't accept lines like
> `iptables -m recent ... -m recent ...`
> I mean no matter what I put after the second -m recent, it get's rejected=
=20
> with a 'Unknown arg' msg, altrough the first one works fine :\
> Can't figure this one out, anybody has an idea?

Stick with one "-m recent".

Instead of this:

iptables -A SSH_Brute_Force -m recent --name SSH ! --rcheck --seconds 60 \
   -m recent --hitcount 4 --set--name SSH -j RETURN

try this:

iptables -A SSH_Brute_Force -m recent --name SSH ! --update --seconds 60
  --hitcount 4 -j RETURN

I think that might be what the OP intended.
---1463811723-528495441-1116291912=:3744--

