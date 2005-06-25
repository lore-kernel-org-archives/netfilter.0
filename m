From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: Re: SSH Brute force attacks - Script version 1.0
Date: Sun, 26 Jun 2005 01:54:55 +0200
Message-ID: <002e01c579e1$4d326d00$4206a8c0@loki>
References: <5d2f379105062511588033857@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Hi everybody,

On Saturday, June 25, 2005 8:58 PM,
curby . wrote:

> (1) First of all, why should there be a -p tcp in the TARPIT line?

This is because what TARPIT does, only works with tcp. It is similar to the 
fact, that for example the specification of --dport in a rule only works 
with either -p tcp or -p udp. Since the next logical question might be "But 
what exactly does TARPIT do that only works with tcp?" I took the freedom 
and googled a site that I think covers the rough basics quite 
straightforward: http://cpc.freeshell.org/linux/kernel-tarpit.html
The short version of this is: the -p tcp is not for a special filtering 
purpose, it's there because -j TARPIT wants it and you just have to do it 
;-)

> (2) Next, people interested in implementing this sort of protection
> might consider changing the duration and number of matches.

IMHO this is mostly just a matter of personal taste (or rather, what your 
network environment needs), so it is all your choice how you configure it. 
Personally I like to use it with short timespan and very small number of 
connections, because SSH access from outside is not frequently needed, just 
from time to time. The main reason for me to use it, is to stop 
script(kiddie)s from using my bandwidth, processor time and precious 
harddrive space by filling my logs with their attempts guess a weak 
username/password. Since none of them ever tried more than 50 combinations, 
I am very happy with DROPping them for a while until they move to the next 
host after their third connection attempt. But if you are more afraid that 
somebody might try to get into your machine by guessing passwords over an 
extended period of time, the longe timespan with a corresponding number of 
connections might be more suitable for you. Also if your SSH is used in a 
"bulky" way like you described it, a low number of tries within a short 
timespan might not be suitable for your setup.
But as I said, my reason for using this is more to annoy automated scans, 
than to provide additional protection. Your passwords/allowed users should 
be configured in a way, that even without additional limits you don't have 
to worry about anybody breaking in. So the best is to see this ruleset as a 
nice addition that keeps your logs cleaner.

> (3) Also, is this the only position for the negation that makes the
> rule work as intended?

Yes, you are telling the recent module to do an rcheck in the list, 
the --seconds and --hitcount just specifiy further criteria for that rcheck. 
The negation belongs to the whole rcheck construct, you cannot invert just 
single comparisons within that. Btw, be careful there, at least with my 
installation an incorrectly placed "!" does not trigger an error message, 
but is just ignored, so your rule might do the opposite of what you wanted 
it to do. For details and where negations are valid you can also have a look 
at "iptables -m recent --help"

HTH,

Marius 


