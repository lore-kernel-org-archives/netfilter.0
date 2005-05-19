From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Thu, 19 May 2005 09:39:25 -0500
Message-ID: <428CA51D.4080206@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>	<42897A5E.7010401@wp.pl>	<42897EE5.90703@wp.pl>	<42898402.10507@eccotours.dyndns.org>	<4289E72F.7020901@wp.pl>	<428B3798.9050407@eccotours.dyndns.org>	<428C1C3F.9030600@riverviewtech.net>
	<428C56C9.9000607@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <428C56C9.9000607@eccotours.dyndns.org>
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

> I understand what you are saying, but what was hoping for. Was a 
> solution whereby the src ip is not part of my whitelist.
> 
> For example, I have a dialup account (dynamic ip) at home. If I need to 
> SSH into my linux box from home. I cant because the ip I have been 
> allocted will not be in the whitelist.

Can I ask why you would not be able to get in from your dynamic IP at home?  The rule set will allow (how ever many NEW attempts you designate) to connect for a specified number of times in a specified amount of time.  You don't have to have your dynamic IP in the list as any IP will still be able to initiate NEW connections a few times before the rule starts TARPITing / DROPing the connection.  There is also the fact that you could configure your SSH server to listen on a (2nd) port at a higher port number that you would know about that most people would not.  This port would not be processed by this script and thus you would be able to connect from anywhere.



Grant. . . .

