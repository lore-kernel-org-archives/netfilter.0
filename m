From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Sat, 28 May 2005 20:01:28 -0500
Message-ID: <42991468.7010300@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>
	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>
	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>	<42920AA7.6070909@riverviewtech.net>
	<20050529012406.72442ce1@mikejones.ghb.fh-furtwangen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050529012406.72442ce1@mikejones.ghb.fh-furtwangen.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> I don't know if this ever came up, maybe I overlooked it but I have a
> problem with the anti-brute-force-thing:
> My server has this little feature and its IP is X and mine is A.
> Here the interresting part: The bad guy Tom. 
> To make it short: Tom does 
> 
> hping2 --syn --spoof A --destport 22 --fast X
> 
> I could put A in my $whitelist but I hing you got the point :)

I see what you are saying.  My immediate (before I really sit down and think about this) answer would be to add the "--rttl" option to the recent match.  The idea behind this would be to make the recent match TTL aware and thus hopefully able to differentiate from various hosts spoofing the source IP based on the TTL that the packets come in to the host with.  You would probably also want to not have a white list and just know that you can not connect more than a specified number of NEW connections with in the specified amount of time.  Something else that could be done would be to find out how many packets (on average) or number of byes (on average) pass one way or the other or both in an SSH connection to determine that the user has successfully logged in, thus not brute forcing.  With this number you could do a packet / byte count on any given SSH connection and then do a "--remove" o
 n the recent match extension thus allowing you to create more than the specified number of
 NEW connections with in the specified amount of time.  We could also extend this idea to add source IPs (and possibly TTLs) of presumed good SSH connections to a 2nd recent list that would be checked against to override the specified number of NEW connections with in the specified amount of time.  Do any of these ideas sound like they might address your problem?  I would be more than willing to try to modify the SSH_Brute_Force chain to accommodate this, just let me know.



Grant. . . .

