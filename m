From: George Chacon <please.help.me@comcast.net>
Subject: RE: How to keep record of repeat attackers?
Date: Wed, 12 Mar 2003 23:19:40 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <PKEJLPJCFBFLJJPHMGPIAEBDCAAA.please.help.me@comcast.net>
References: <200303122224.55297.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200303122224.55297.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@newkirk.us, Netfilter Mailing List <netfilter@lists.netfilter.org>

>>Your first problem is defining "offenders", then "repeat offenders" and
>>"attackers".  Do you mean simply to track everyone who attempts to
>>connect to you?  I presume you don't expect much if any legitimate
>>incoming NEW traffic if this is the intent?

Thanks for the response Joel.  What I'd like to track are the IP addresses
that get denied or rejected, and the deny/reject rules that get accessed
frequently.  In other words, I'd like to track repeated, obvious, malicious
connections.  I'd like to know if the same person is relentlessly chipping
away at my firewall, looking for weaknesses.

I'll take a look at http://ntop.org.  That looks pretty good.

George



-----Original Message-----
From: Joel Newkirk [mailto:netfilter@newkirk.us]
Sent: Wednesday, March 12, 2003 7:25 PM
To: George Chacon; Netfilter Mailing List
Subject: Re: How to keep record of repeat attackers?


On Wednesday 12 March 2003 08:20 pm, George Chacon wrote:
> Hi,
>
> I'm an iptables newbie, and have a question about logging repeat
> offenders. Is it possible to have my firewall box remember incoming IP
> addresses, and generate a report showing which attackers keep coming
> back?
>
> Thank you,
>
> George Chacon

With iptables there are only two ways to do record information (apart
from simply the packet/byte counts that match each rule):  the LOG
target (formatted header information, basically, written to syslog) or
the ULOG target with an external accounting package.

Your first problem is defining "offenders", then "repeat offenders" and
"attackers".  Do you mean simply to track everyone who attempts to
connect to you?  I presume you don't expect much if any legitimate
incoming NEW traffic if this is the intent?

You might also want to look at http://ntop.org .  I've had it running on
my gateway for about a week now, and am delighted by the depth of detail
and the variety of views it offers.  Network load, protocol
distribution, etc are available along with per-IP information on
everyone who has connected, tracking when they've connected, what
protocols, bad packets, and much more.

j




