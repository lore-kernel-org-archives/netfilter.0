From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: track bandwith used
Date: Wed, 30 Jun 2004 11:07:37 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <12a101c45eab$99055aa0$49caa8c0@caris.priv>
References: <00e501c45ea3$28e2d110$49caa8c0@caris.priv> <200406301441.22500.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter <netfilter@lists.netfilter.org>

ya, that was great.  I guess there was one thing that you said that worried
me ... you said almost all packets will match the ESTABLISHED,RELATED check
on the forwared chain ... would that not be a bad thing ... is it dangerous
to have RELATED as an option on the FORWAED CHAIN.

???

Thankls

----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: "netfilter" <netfilter@lists.netfilter.org>
Sent: Wednesday, June 30, 2004 10:41 AM
Subject: Re: track bandwith used


On Wednesday 30 June 2004 2:07 pm, Peter Marshall wrote:

> Hi again,
>
> I was also wondering if anyone knows a way to track bandwith being used
> through the firewall .......

Well, there are plenty of network monitoring tools which will give you this
sort of information as an aggregate figure for an interface, or broken down
by source/destination address, port number etc - iptraf is not a bad start
to
see what can be done.

Other than that you can use netfilter rules to count the packets & bytes,
and
then use a cron job to record the counts at whatever intervals you want
(every minute, every hour, every day...), and then process them yourself.

Things I would mention if you're going to try the latter option:

1. Most packets do not match against rules in the nat table, so don't try
counting those - the only packets which match these are the first of each
connection - all the rest are processed invisibly by netfilter in the
background, and your rules don't see them (this is also the reason why you
should never set a default DROP policy on a nat table!)

2. If you are using a standard -m state --state ESTABLISHED,RELATED rule in
your FORWARD chain, remember that nearly all packets will match that, no
matter which direction they're going through the machine, and which port/s
they're going to or from.   Again, most of the rules in your FORWARD chain
will only match the first packet of a given connection, so you won't see
much
traffic on these rules either (although they can give you a useful
indication
of the number of connections of that type which get created).

3. The FORWARD mangle table can be a good place to put rules which will see
all traffic going through the system.

4. For accounting purposes, you can quite readily use rules with no target
(eg: iptables -A FORWARD -p tcp --dport 25); these will make no difference
to
whether the packets are ACCEPTed, DROPped, LOGged, REJECTed, or whatever
(obviously you need separate rules to do that somewhere else), but the
packet
& byte counters from iptables -L -nvx will show you how many of that type of
packet were seen.   You can make the rules as specific as you like if you
want to count certain connections in minute detail (eg: iptables -A FORWARD
-p tcp --dport 25 -s my.mail.ser.ver -d ISP.mail.ser.ver)

5. Don't overlook the raw packet & byte counts available from ifconfig if
all
you want to do is monitor traffic in & out of an interface.

Hope this give you some ideas.

Regards,

Antony.

-- 
"The future is already here.   It's just not evenly distributed yet."

 - William Gibson

                                                     Please reply to the
list;
                                                           please don't CC
me.



