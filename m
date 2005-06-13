From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Mon, 13 Jun 2005 09:39:26 -0500
Message-ID: <42AD9A9E.7070603@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>	<42897A5E.7010401@wp.pl>	<42897EE5.90703@wp.pl>	<42898402.10507@eccotours.dyndns.org>	<4289E72F.7020901@wp.pl>	<428B3798.9050407@eccotours.dyndns.org>	<428C1C3F.9030600@riverviewtech.net>	<428C56C9.9000607@eccotours.dyndns.org>	<428CA51D.4080206@riverviewtech.net>	<428DDFBC.1080905@eccotours.dyndns.org>	<428DF9F1.9060602@riverviewtech.net>	<42920563.7070406@eccotours.dyndns.org>	<1117728830.10257.15.camel@debianbox>	<429F3740.8070105@riverviewtech.net>
	<1117739926.10257.22.camel@debianbox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1117739926.10257.22.camel@debianbox>
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

Sadus . wrote:
> Portsentry listens to a set of ports you set. when someone nmaps your
> machine or do some kind of scanning on certain ports, portsentry blocks
> that IP via the method you prefer (ipchain, iptables...) and it can echo
> the IP to /etc/hosts.deny thus droping all connections with the
> attacker. I want to expand the SSH Brute force script to enable this
> feature.
> It is not important to know if an IP is already in the /etc/hosts.deny
> list because since the IP is droped and denied from accessing, the IP
> won't reach the brute force script, so normaly you won't have repetition
> of IPs.

I'm working on a re-write of the SSH_Brute_Force chain on my home firewall.  This rewrite will be VERY different and should be the foundation for much growth and adaptation in to other things as well.  The basic idea behind it is to use a multi level triggering system.  Restated in english if you trigger the first level you are banned for a specific amount of time.  If you trip the first level and are banned for the specified amount of chem and then re trip the first level you are then banned at the second level and banned for a longer time.  At present my levels are as follows, 1 minute, 1 hour, 1 day, 1 week, 1 month, 1 year and then permanent ban.  I'm also adding IPs to a recent list that can be checked by other chains early on in the chain set out side of the SSH_Brute_Force chain.  Needless to say it's very complex and I'm doing some testing to make sure that it works the way that 
 I want it to.  Once I get it working I'll either post it to this thread or start a new one
 with an appropriate subject.  I'm trying to include some functionality or the capability of the functionality of Portsentry as you have requested.

I'm not sure if /etc/hosts.deny will prevent packets from entering IPTables or not as I thought that the file was read by user space daemons as a list of IPs to never talk to, not necissarly to the IP table to deny access to.  I could be wrong on this though.



Grant. . . .

