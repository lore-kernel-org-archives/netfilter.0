From: Jason Opperisano <opie@817west.com>
Subject: Re: DNAT/Forward difficulties...
Date: Tue, 23 Nov 2004 15:45:41 -0500
Message-ID: <20041123204541.GA3026@bender.817west.com>
References: <001d01c4d197$955c5660$4501a8c0@squigglesworth>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001d01c4d197$955c5660$4501a8c0@squigglesworth>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Nov 23, 2004 at 12:04:04PM -0800, Some Clown wrote:
> Greetings--
> 
> I've been banging my head against the proverbial firewall for days now, and
> while I consider myself fairly versed in TCP/IP mechanics, I cannot seem to
> figure this out--probably because I'm relatively new to netfilter/IPTables.
> I have mashed together several pieces of scripts with some of my own
> creations and have come up with what I consider to be a fairly robust
> firewall script--at least for my own use.  I've tested, and as far as I can
> tell it does everything I want except for one thing--I can't seem to get any
> NEW inbound connections to get forwarded to any internal machines.  I have a
> cable box from Comcast, coming into ETH0 on my Linux box, then ETH1 to a
> plain-jane Cisco switch, then to various other Windows, Linux, and VOIP
> boxes.  I want to be able to allow certain NEW connections inbound, across
> the Linux (firewall) box, to certain internal machines.  For the life of me,
> however, I can't get it to work.
> 
> I tried to post a message to the list with my rc.firewall file included, but
> apparently it's too big.  Thus, I'll include a link to the file and hope
> that some friendly soul takes a look.  I would have posted only "relevant"
> parts in the message, but the whole thing is relevant... if I knew where the
> trouble was I'd fix it myself.
> 
> As an aside, if anyone sees any obvious pitfalls of this newbie's script...
> feel free to point them out--though I'm not expecting a comprehensive
> analysis... :)
> 
> http://home.comcast.net/~systemic/rc.firewall

coupla general thoughts:

(1) the IANA "reserved" space can be significantly summarized (from ~96
networks to ~30):

0.0.0.0/7 2.0.0.0/8 5.0.0.0/8 7.0.0.0/8 23.0.0.0/8 27.0.0.0/8
31.0.0.0/8 36.0.0.0/7 39.0.0.0/8 41.0.0.0/8 42.0.0.0/8 49.0.0.0/8
50.0.0.0/8 73.0.0.0/8 74.0.0.0/7 76.0.0.0/6 89.0.0.0/8 90.0.0.0/7
92.0.0.0/6 96.0.0.0/3 173.0.0.0/8 174.0.0.0/7 176.0.0.0/5 184.0.0.0/6
189.0.0.0/8 190.0.0.0/8 197.0.0.0/8 223.0.0.0/8 240.0.0.0/4

(2) "-m limit --limit 5/second" does not make a port scan "annoyingly
slow"--5/hour or 5/day would qualify as pretty annoying though...

then my head started to hurt trying to follow the script...it might be
easier (in the future) to present rules to people in the standard format
of:

  iptables -t mangle -vnxL && iptables -t nat -vnxL && iptables -vnxL

as it allows one to read the rules in order they're enforced, and puts
all those custom chains into context...but i digress...

to answer your question--you have a bunch of PREROUTING DNAT's setup,
such as:

  # SHAREAZA
  $IPTABLES -t nat -A PREROUTING -i $EXTERNAL -p tcp -d $EXT_IP
    --dport 57601 -j DNAT --to-destination 192.168.1.69
  $IPTABLES -t nat -A PREROUTING -i $EXTERNAL -p udp -d $EXT_IP
    --dport 57601 -j DNAT --to-destination 192.168.1.69

so one would think you would have filter rules to allow the traffic,
along the lines of:

  $IPTABLES -A FORWARD -i $EXTERNAL -o $INTERNAL -p tcp --syn \
    -d 192.168.1.69 --dport 57601 -j ACCEPT
  $IPTABLES -A FORWARD -i $EXTERNAL -o $INTERNAL -p udp \
    -d 192.168.1.69 --dport 57601 -j ACCEPT

but as far as i can tell (correct me if i'm wrong), your FORWARD chain
contains:

  $IPTABLES -A FORWARD -i $EXTERNAL -j EXTERNAL_INPUT
  [ snip ]

and EXTERNAL_INPUT contains:

  $IPTABLES -A EXTERNAL_INPUT -i $EXTERNAL -p tcp -j CHECK_FLAGS
  $IPTABLES -A EXTERNAL_INPUT -i $EXTERNAL -p ! icmp -j DENY_PORTS

and then you have this magic tidbit:

  $IPTABLES -A FORWARD -i $EXTERNAL -d $INTERNAL_NET -m state \
			--state NEW -j DROP

which is probably the source of your problem.

if you're really "relatively new to netfilter/IPTables" this script is
roughly (and this is just an estimate) eight million times more complex
than anything you should be troubleshooting...but that's just me.

hope this helps.

-j

--
"Simpson, Homer Simpson, he's the greatest guy in his-tor-y. From
 the town of Springfield, he's about to hit a chestnut tree....D'oh!"
        --The Simpsons

