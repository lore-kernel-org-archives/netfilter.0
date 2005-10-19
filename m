From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: logging port 25
Date: Tue, 18 Oct 2005 23:32:55 -0500
Message-ID: <200510182332.55144.rob0@gmx.co.uk>
References: <435514F5.9000201@mail.bloomfield.k12.mo.us>
	<200510181059.34916.rob0@gmx.co.uk>
	<435542B2.2020907@mail.bloomfield.k12.mo.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <435542B2.2020907@mail.bloomfield.k12.mo.us>
Content-Disposition: inline
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

On Tuesday 2005-October-18 13:45, Scott Mayo wrote:
> >>I am trying to do this in case I get a virus that uses its own smtp
> >>to send out mail.
> >
> > Good idea. You probably already have some.
>
> Well, I have virus protections on most things, but uses seem to get
> them turned off once in a while. :)

It's impossible to truly secure Windows, especially with the clueless 
users you so often have on it.

> > Tell us what you tried and I will tell you why it was wrong. My
> > crystal ball thinks you put the rules in INPUT. Was it right?
>
> I was not sure, so I put the rules in both the INPUT and FORWARD
> chain.

local = IP address bound on the iptables machine itself
INPUT   = destination is local
OUTPUT  = source is local
FORWARD = neither is local

Every packet hits exactly one chain, except loopback traffic hits 
OUTPUT, then INPUT.

> INT_IP_RANGE="10.0.0/16"

And you got a syntax error here. You have to specify all 4 quads: 
"10.0.0.0/16".

> INT_IP_RANGE2="192.168.0.0/24"
>
> $IPTABLES -A INPUT -p tcp -d mail_server_IP --dport 25 -j ACCEPT

If mail_server_IP is not local, this rule is never matched.

> $IPTABLES -A INPUT -p tcp -s $INT_IP_RANGE --dport 25 -j LOG
> --log-level debug
> $IPTABLES -A INPUT -p tcp -s $INT_IP_RANGE --dport 25 -j LOG
> --log-prefix "EMAIL:"
> $IPTABLES -A INPUT -p tcp -s $INT_IP_RANGE --dport 25 -j LOG
> --log-tcp-sequence
> $IPTABLES -A INPUT -p tcp -s $INT_IP_RANGE --dport 25 -j LOG
> --log-ip-options
snip $INT_IP_RANGE2 commands

You're wanting *4* separate log entries for EACH smtp packet? Wow. I 
don't think you really want that. You probably want to consolidate all 
those options in a single -j LOG rule. Further I would suggest limiting 
it, either or both "--syn" or "-m state --state NEW". You only need one 
packet logged per connection attempt.

> I did the same thing for the FORWARD chain, except changed teh INPUT
> to FORWARD obviously. :)

If mail_server_IP is not local, these rules are matched in FORWARD ... 
unless of course some other terminating rule matched it before they 
come up. And that is beyond the ability of my crystal ball. :)

One (and perhaps only one) way in which "iptables -L" is useful is in 
conjunction with "-v", where you get packet counters. Perhaps you will 
see that these rules are not being hit at all; otherwise your logs 
would be inundated by a spam zombie. 2-3 zombies could conceivably DoS 
your firewall, or at least crash your syslogd.

Put corrected rules in INPUT or FORWARD (FORWARD I guess from what you 
said, the mail_server_IP not being behind your firewall) and test from 
a firewalled client: "telnet some.other.mail.server 25", see if you get 
out (I presume there is a -j DROP rule or -P DROP following, although 
you might consider a -j REJECT for these) and/or are logged.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

