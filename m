From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: thanks Antony ... and one more thing ...
Date: Fri, 9 Apr 2004 10:13:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404091013.24556.Antony@Soft-Solutions.co.uk>
References: <007801c41e05$2681d850$da0da8c0@pisic> <200404090928.33558.Antony@Soft-Solutions.co.uk> <00b401c41e10$06deef00$da0da8c0@pisic>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00b401c41e10$06deef00$da0da8c0@pisic>
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
To: netfilter@lists.netfilter.org

On Friday 09 April 2004 9:52 am, Danila Octavian wrote:

> > I suggest you investigate something like iptraf, netwatch or snort.
>
>  I have something like 30 clients ... in my LAN .
>  My boss is somehow paranoid and needs "total control" of every bit.

I hope you are in a jurisdiction where this kind iof traffic monitoring is 
legal :)

> I was thinking at something like  -A OUTPUT -d !extip !intip !localnet -j
> LOG

OUTPUT???   No - that's only for packets leaving the machine itself (unless 
you're talking about putting this rule onto each client machine?   But I 
don't think so...)   POSTROUTING mangle is the best place, as I said before, 
because the only other choices I can think of are:

1. PREROUTING mangle - catches (all) the packets on the way in, but will count 
those which get blocked by rules in your FORWARD chain as well

2. PRE or POSTROUTING nat - will not see much of the traffic because of the 
automatic connection-tracking based stuff which goes on in the background

3. FORWARD - assuming you use ESTABLISHED,RELATED (and I recommend that you 
do), again you will not see much of the traffic in any LOGging rules you put 
after this

Previously I suggested a rule with no target, just to count the bytes.

If you add a LOG target, you will LOG every packet (and you can calculate the 
number of bytes in it from the LENgth field of the log entry - just subtract 
the size of the headers).

> and then parse logs and generate reports with some script.

Sure - that would work.

> but the problem : i am not sure if adding three lines of -j LOG for every
> destination that i ignore (extip intip and localnet) is a good thing.

Three lines?   Why three?   I think just one will do the job.   It's your 
script which analyses the logs afterwards which has to pick out source, 
destination, port, length, and turn it all into something your boss can fall 
asleep to (but then that's what Perl was invented for...)

> what will happen with the packet after first line ?

I don't understand this bit of your question.

I'm suggesting you simply change the rule I posted previously, and add a LOG 
target to it:

iptables -A POSTROUTING -t mangle -s 192.168.13.222 -j LOG

If you want to log more than one machine as the source address, just make the 
source match a little wider:

iptables -A POSTROUTING -t mangle -s 192.168.13.0/24 -j LOG

(Okay, so this will catch packets from your firewall itself as well, but those 
can get parsed out by your script afterwards).

I still think snort would tell you a whole lot more interesting information, 
though :)

Regards,

Antony.

-- 
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the list;
                                                           please don't CC me.


