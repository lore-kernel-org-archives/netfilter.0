From: Michael Kearey <mutk@iprimus.com.au>
Subject: Re: icmp echo requests
Date: Tue, 30 Sep 2003 08:51:17 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F78B765.6060003@iprimus.com.au>
References: <3F77CE17.30605@kdtc.net> <Pine.LNX.4.53.0309291238510.2782@xena.cft.ca.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0309291238510.2782@xena.cft.ca.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Group <netfilter@lists.netfilter.org>

Jim Carter wrote:
> On Mon, 29 Sep 2003, cc wrote:
> 
>>I've been monitoring the NAT router with pktstat and am a little
>>perturbed to see quite a lot of icmp echo requests.  Now I've
>>setup my Linux firewall to reject icmp echo requests.
>>
>>Is this the right(?)/correct/valid/appropriate thing to do?
> 
> 
> I see a lot of pings too.  At home my Linksys residential gateway reports
> that they look like they were address spoofed.  (So how did it figure that
> out?)  This leads me to suspect that they are part of a distributed denial
> of service attack -- the alleged origin of the ping, to which you are
> supposed to send a packet, is the victim.

Not necessarily. The pings may be originating from Internal infected 
Windows machines..See below

> 
> Before my home Linux gateway blew its motherboard, I just dropped all pings
> (in fact, just about everything) on the wild-side interface.  Best not to
> send ICMP-host-unreachable; best to drop all unsolicited packets silently,
> except for AUTH requests, for which a rejection saves you an annoying
> timeout.  Except, I like to monitor the home machine from work, so I accept
> pings from the work subnet only.
> 
> James F. Carter          Voice 310 825 2897    FAX 310 206 6673
> UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
> Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)
> 
>


There are some Virus that cause the infected hosts to spew out lots of 
pings. I have seen it , and it brought a gateway/firewall to it's 
knees there were so many..

Since then I have done something like this:

# Add rate limiting to prevent DDos from within - Like some Worms and
# Viruses tend to produce
iptables -N echo_rate_limit
iptables -I echo_rate_limit -j DROP
iptables -I echo_rate_limit -m limit --limit 1 --limit-burst 2 -j $LOG 
--log-prefix "ICMP rate exceeded: "
iptables -I echo_rate_limit -m limit -p ICMP --limit 1 --limit-burst 5 
-j RETURN

iptables -I FORWARD -p ICMP  -j echo_rate_limit



I did it this way so I could easily insert the rate limit in an 
existing forwarding firewall. But you should be able to get the idea 
of rate limiting the echo-requests from what you see..

The best thing to do of course is fix the infected hosts.. That's why 
I log before dropping.

My appologies to OP for replying directly to him....

Cheers,
Michael





