From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: Please explain the limit match
Date: Sun, 1 Feb 2004 16:51:43 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0402011643020.25106@localhost.localdomain>
References: <002101c3e908$0eb37d00$c800a8c0@klintan.cjb.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002101c3e908$0eb37d00$c800a8c0@klintan.cjb.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Klinteberg <micke@klintan.se>
Cc: netfilter@lists.netfilter.org



On Sun, 1 Feb 2004, Michael Klinteberg wrote:

> I have read the man page over and over again for the iptables limit
> match. Don't quite understad the --limit and --limit-burst.
> 
> Can anyone please give me some easy LOGing examples with diffrent
> time-intervalls.

  i remember, once upon a time, trying to figure this out and becoming
hopelessly confused by an overly-complicated explanation.  once i
discarded the verbiage, it seemed quite simple.

  think of starting with a collection of tokens that you use to pay
for packets.  if packets come in quickly, you'll quickly run out of 
tokens, and on a *regular* basis, you're given a token to replenish
your supply.

  as an example, let's say you define a limit of 5/sec, and a limit
burst of 10.  this means (and please correct me if i'm wrong), you start
with 10 tokens, and that's the *maximum* you'll ever be allowed to hold.

  every time a packet comes in that matches your criteria, if you want to
accept it, you have to pay a token.  based on your limit, you'll be 
replenished at the rate of 5/sec, or one every 0.2 seconds.

  if you get no packets, you'll just sit there, hoarding your 10 tokens.
if, suddenly, you get a flurry of activity (DoS attack), you'll spend your
10 tokens almost immediately, and then will have to reject further 
packets, except that every 0.2 seconds, you'll get another token, which
you'll spend immediately as long as you have heavy incoming traffic.

  only when the traffic dies off will you get a breather and a chance to
replenish your supply of tokens again, one every 0.2 seconds in your case.
i did, in fact, test this with logging and it matches what i described 
here.  others use an analogy of balls in a bucket, etc.

rday


