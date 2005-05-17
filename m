From: =?ISO-8859-2?Q?=A3ukasz_Hejnak?= <sziftgroup@wp.pl>
Subject: Re: SSH Brute force attacks
Date: Tue, 17 May 2005 07:00:14 +0200
Message-ID: <42897A5E.7010401@wp.pl>
References: <427B93EE.3030905@eccotours.dyndns.org>
	<427C4EA3.5090501@riverviewtech.net>
	<4281FC1A.8090000@eccotours.dyndns.org>
	<42824D1E.7040508@riverviewtech.net> <4285C016.2060900@wp.pl>
	<42864CA9.7050802@riverviewtech.net> <428856F8.60706@wp.pl>
	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Charlie Brady wrote:
> On Mon, 16 May 2005, [ISO-8859-2] =A3ukasz Hejnak wrote:
>> But as for the recent module itself it's a werid one, cause it looks=20
>> like my iptables don't accept lines like
>> `iptables -m recent ... -m recent ...`
>> I mean no matter what I put after the second -m recent, it get's=20
>> rejected with a 'Unknown arg' msg, altrough the first one works fine :\
>> Can't figure this one out, anybody has an idea?
>=20
> Stick with one "-m recent".
> try this:
> iptables -A SSH_Brute_Force -m recent --name SSH ! --update --seconds 60
>  --hitcount 4 -j RETURN

I tried this way but it doesn't work..
I can send more then 4 ssh login requests even within 10 seconds, and it=20
still let's me trough, and of course I'm not trying from a white listed IP.

:\

--
with regards
=A3ukasz Hejnak

