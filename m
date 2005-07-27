From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: Re: SSH Brute Force not working (any longer)
Date: Wed, 27 Jul 2005 21:14:59 +0200
Message-ID: <003601c592df$9f92fda0$4206a8c0@loki>
References: <5d2f37910507270936737ad3d1@mail.gmail.com>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Netfilter User Mailing List <netfilter@lists.netfilter.org>

Hi everybody,

On Wednesday, July 27, 2005 6:36 PM,
curby . wrote:

> I know enough to realize that it didn't stop working just because it
> hates me: most likely, i changed something in the configuration or
> something to make it stop working.  However, I can't think of anyting
> I could have done to two different machines to make them stop working
> in exactly that same way.  Basically, every SSH attempt skips the
> return to the input chain and jumps directly to log/drop or
> log/tarpit.  I've tried increasing the --hitcount, tried rebooting or
> otherwise restarting the network service, tried using a different
> --name in recet, etc.

Well, from what your wrote I guess it suddenly ceased working. Don't worry, 
you are definitely alone. Since you mentioned that it looks like it was 
skipping the whole rule that should RETURN "good" packets, it sounds like 
you have encountered the same thing that happened to me.
I only had a closer look at your first and second ruleset example, and if I 
understand it right, the first example should always return the packets, 
since RETURN is the first rule (inverted rcheck) in SSH_Brute_Force, so the 
recent list should never receive an entry.
And I guess that in your second example the DROP rule (positive update 
check) always matches and therefore always drops, though the way I 
understand the rules, they should never match, because again the list entry 
has never been set.
If my above two guesses about your ruleset behaviour are true, then you have 
the same problem I had. Suddenly they ceased working, and the inverted match 
was always false (where it should have matched) and an added non-inverted 
match for testing with the same criteria did match, though it should have 
been the other way round.
I also tried roughly the same debugging you did, with no results. It 
happened with both a 2.6.12.1 kernel.org and a 2.6.11 debian kernel, reboot 
did not change anything, and I was unable to find out where the problem was.
What I found out was, that low hitcounts (20 or smaller) always matched a 
positive match, while high hitcounts (21 and above) never did, even after 
pushing a sufficiently large number of packets through that ruleset to have 
more than 21 entries within the last minute. So

iptables -A SSH_Brute_Force -m recent --name SSH ! --rcheck --seconds 
0  --hitcount 20  -j RETURN

never returned. While

iptables -A SSH_Brute_Force -m recent --name SSH ! --rcheck --seconds 
0  --hitcount 21  -j RETURN

always returned, regardless how many packets have been processed by that 
rule within the last minute. Maybe there is a similar "critical" number of 
hits for you.
So sorry, no idea how to get rid of it, but I thought you might be 
interested in knowing that you are not the only one encountering that 
problem. The only positive about it: I finally gave up debugging it, and as 
silently as it came, the problem disappeared. Everything is working fine 
again. With a still unchanged ruleset of course ;-)
So I hope (and assume) it will silently disappear for you, too, though I 
would give quite a lot to actually find out what the hell went wrong in the 
3 days it was not working.

Good luck,

Marius 


