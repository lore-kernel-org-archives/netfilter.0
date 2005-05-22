From: =?ISO-8859-2?Q?=A3ukasz_Hejnak?= <sziftgroup@wp.pl>
Subject: Re: SSH Brute force attacks
Date: Sun, 22 May 2005 12:57:19 +0200
Message-ID: <4290658F.20002@wp.pl>
References: <427B93EE.3030905@eccotours.dyndns.org>	<42898402.10507@eccotours.dyndns.org><4289E72F.7020901@wp.pl>	<200505211200.28314.pvolkov@mics.msu.su>	<428FB81F.6030403@riverviewtech.net>
	<004501c55ebb$61a49b00$4206a8c0@loki>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <004501c55ebb$61a49b00$4206a8c0@loki>
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

Marius Mertens wrote:
> and I admit it could be easily tested if "--set" updates an already=20
> existing "--set" or not, but I have to leave right now. I think I'll=20
> examine that when I'm back if nobody is faster ;-) )

well in fact I just run a test to see if it's true, and I had already=20
writen a long post to ask why is it so, as the ruleset with --hitcount 3=20
dropped normally the third connection (it doesn't have to be set to 6),
and then it hit me (--hitcount 1 ;) that the --update is AFTER the "-j=20
RETURN"

and it runs ok now, the --update rule can be easily removed, as the=20
--set does the trick the way it should.
My ruleset is now something like this below, and works as I intended it=20
to, 2 connections ok, third one drops.

ipt=3D/usr/local/sbin/iptables

$ipt -N SSH_Brute_Force
$ipt -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set=20
--name SSH
$ipt -A INPUT -s ! $MyIP -m recent --rcheck --name SSH -j SSH_Brute_Force
$ipt -A SSH_Brute_Force -m recent ! --rcheck --name SSH --seconds 60=20
--hitcount 3 -j RETURN
$ipt -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
$ipt -A SSH_Brute_Force -j DROP
# do any other checks on the returned ssh packets
$ipt -A INPUT -m recent --rcheck --name SSH -j ACCEPT

--
With regards
=A3ukasz Hejnak

