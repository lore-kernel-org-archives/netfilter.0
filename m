From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: Re: SSH Brute force attacks
Date: Wed, 25 May 2005 10:48:37 +0200
Message-ID: <001601c56106$8d8419b0$4206a8c0@loki>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com><42920AA7.6070909@riverviewtech.net>
	<42940E9B.1070502@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: netfilter@lists.netfilter.org

Hi Brent, Hi List,

On Wednesday, May 25, 2005 7:35 AM,
Brent Clark wrote:

> For some funny reason I still cant seem to get this right.
> I tried connecting from home (dynamic assigned ip) and I still cant
> connect.

From having a short look over your ruleset, I can't find a rule that finally 
accepts NEW ssh connections after the packet successfully passed the 
bruteforce section. Perhaps you want to append an ACCEPT rule for that, so 
the whole block about ssh looks like the following:

[...]
$IPT -N SSH_Brute_Force
[...]
$IPT -A SSH_Brute_Force -j DROP
# Now finally accept NEW ssh traffic
$IPT -t filter -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT
[...]

An alternative way might be replacing the RETURN targets with ACCEPT. Though 
I think the way with RETURN is cleaner. For if you append other DROP rules 
to your ruleset later, you might wonder why some ssh connections are 
magically accepted.
Speaking of cleanliness: maybe you also want to remove the final DROP rule 
and set the policy of the INPUT chain to DROP instead. But this should not 
affect functionality ;-)
Oh, almost forgot: sometimes the reason for strange behaviour is your rules 
not getting flushed. Don't think it's the case here, but if it still does 
not work after adding the ACCEPT rule... ;-)

Good Luck!

Marius 


