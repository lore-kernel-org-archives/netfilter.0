From: =?ISO-8859-2?Q?=A3ukasz_Hejnak?= <sziftgroup@wp.pl>
Subject: Re: SSH Brute force attacks
Date: Tue, 17 May 2005 14:44:31 +0200
Message-ID: <4289E72F.7020901@wp.pl>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>	<42897A5E.7010401@wp.pl>
	<42897EE5.90703@wp.pl> <42898402.10507@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42898402.10507@eccotours.dyndns.org>
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

Brent Clark wrote:
> Would you be so kind as to copy and paste your ruleset for this.
No problem, here's my variation, based on Taylor Grant's ruleset

$ipt -N SSH_Brute_Force
$ipt -A INPUT -p tcp --dport 22 -m state --state NEW -s ! $MyIP -j=20
SSH_Brute_Force
$ipt -A SSH_Brute_Force -m recent --set --name SSH
$ipt -A SSH_Brute_Force -m recent ! --rcheck --name SSH --seconds 60=20
--hitcount 3 -j RETURN
$ipt -A SSH_Brute_Force -m recent --name SSH --update
$ipt -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
$ipt -A SSH_Brute_Force -j DROP

I am forced to use DROP here instead of TARPIT as the TARPIT isn't
supported yet for the 2.6.x kernel branch

--
with regards
=A3ukasz Hejnak

