From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: SSH Brute force attacks
Date: Wed, 18 May 2005 14:39:52 +0200
Message-ID: <428B3798.9050407@eccotours.dyndns.org>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>	<42897A5E.7010401@wp.pl>	<42897EE5.90703@wp.pl>
	<42898402.10507@eccotours.dyndns.org> <4289E72F.7020901@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4289E72F.7020901@wp.pl>
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
> $ipt -N SSH_Brute_Force
> $ipt -A INPUT -p tcp --dport 22 -m state --state NEW -s ! $MyIP -j=20
> SSH_Brute_Force
> $ipt -A SSH_Brute_Force -m recent --set --name SSH
> $ipt -A SSH_Brute_Force -m recent ! --rcheck --name SSH --seconds 60=20
> --hitcount 3 -j RETURN
> $ipt -A SSH_Brute_Force -m recent --name SSH --update
> $ipt -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  =
"
> $ipt -A SSH_Brute_Force -j DROP

Hi all

Would it not be possible to base the the ruleset, based on connection=20
suceeded.

For example, At my home I have a dialup account (dynamic ip). So if I=20
need to SSH in my hosting box, I cant, because of the ruleset ( $myip=20
will be the works static ip) .

Is there not a away to have iptables look at if the connection was=20
succesful or not (not based on source ip of $myip). So if I am able to=20
ssh (logged in etc)in to my box, then doesnt iptables see that as=20
ESTABLISED and RELATED (Normally placed as one of the first entrys in=20
your ruleset). But if Ive I not been successful then connection attempt=20
again will be considered as NEW.

So my question is, cant we make iptables see the number of NEW=20
connections / attempts (Basically dictionary attack) given in a time=20
frame. And if the number of NEW connections exceed a certain time frame. =

Then start DROP or TARPIT.

Just something I was thinking

Kind Regards
Brent Clark



