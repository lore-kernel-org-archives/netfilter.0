From: =?ISO-8859-2?Q?=A3ukasz_Hejnak?= <sziftgroup@wp.pl>
Subject: Re: SSH Brute force attacks
Date: Tue, 17 May 2005 07:19:33 +0200
Message-ID: <42897EE5.90703@wp.pl>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>
	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>
	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>
	<42897A5E.7010401@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42897A5E.7010401@wp.pl>
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

=A3ukasz Hejnak wrote:
> Charlie Brady wrote:
> Stick with one "-m recent".
> try this:
> iptables -A SSH_Brute_Force -m recent --name SSH ! --update --seconds 60
>  --hitcount 4 -j RETURN

ok, now I got it.. I mindlessly copied the set Taylor Grant sent to the=20
list, and didn't think enough about it. Now I found the missing piece,=20
the packets going in wheren't marked with --name SSH, so here's why the=20
above didn't work, now it works :]
Thanks for the help and the patience :)

--=20
with regards
=A3ukasz Hejnak

