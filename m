From: Michael Schachtebeck <schachti@rbw.goe.net>
Subject: Re: limit extension
Date: Wed, 20 Jul 2005 16:15:44 +0200
Message-ID: <42DE5C90.70603@rbw.goe.net>
References: <42DD417F.4090804@rbw.goe.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42DD417F.4090804@rbw.goe.net>
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

Am 07/19/2005 08:07 PM schrieb Michael Schachtebeck:

> /sbin/iptables -t nat -I PREROUTING -p tcp -s $IP -i $LAN_DEV --sport
> 1024: --dport 80 --syn -m limit --limit 1/d --limit-burst 1 -j REDIRECT
> --to-port 5000
> 
> At first, I thought everything was fine: I got redirected when trying to
> open the first page in my browser, and after that, I could surf normally
> without being redirect. But after about 30 minutes, I got redirected
> again, and iptables -t nat -vnL PREROUTING said that the rule had
> matched twice.

As I could not test the rules that Jan has suggested in his answer to my
postings (it's a production machine and I couldn't reboot it with a
patched kernel so far), I did some more testing and discovered a very
strange behaviour which I believe to be indeed a bug:

- I added the above rule to the firewall, got redirected exactly once,
  and could surf the web for about 40 minutes without being redirected
  again.
- A cron job deleted some rules from the PREROUTING chain and added
  some new rules to the PREROUTING chain.
- I got redirected again (exactly once), directly after the cron job had
  modified the PREROUTING chain.
- I could surf the web for exactly 60 minutes without being redirected
  again.
- The cron job ran again.
- I got redirected again (exactly once), directly after the cron job had
  modified the PREROUTING chain.
- I ran the cron job manually.
- I got redirected again (exactly once) and could surf the web normally
  after that.
- I ran the cron job manually again.
- I got redirected again (exactly once).
- ... (I repeated it some times, same result)
- I could surf the web for about one hour without being redirected,
  until... you guess it, until the cron job ran again and modified the
  PREROUTING chain.

The cron job did not touch the rule above I am using to do the
redirection, it only deleted some other rules in the PREROUTING chain
and added some new rules to the PREROUTING chain.

So this seems to be a bug in the kernel's iptables implementation, right?

I'm using a 2.6.12.2 vanilla kernel and iptables 1.2.11 (gentoo package
net-firewall/iptables-1.2.11-r3).

Cheers,

Michael.
-- 
PGP Public Key:  http://www.num.math.uni-goettingen.de/schachte/key.asc
Key fingerprint: C474 8B85 17C0 0232 E439 0FBF 2451 E452 293C D798

