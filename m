From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: why can't I DNAT SIP?
Date: Thu, 08 May 2008 17:31:29 -0700
Message-ID: <48239B61.5060107@mailinator.com>
References: <fvtjuu$7i1$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fvtjuu$7i1$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

sean darcy wrote:
> On my outside box I trying to route sip ( port 5060 ) and iax ( 4659 ) 
> packets to an internal asterisk server. I use DNAT, which works fine for 
>  iax, but doesn't for SIP. I'm using identical DNAT statments.
> 
> The log shows the SIP packets coming in, but then going to the INPUT 
> chain. Nothing shows up on the FORWARD chain.
> 
> iptables -L -n -v -t nat
> Chain PREROUTING (policy ACCEPT 168K packets, 17M bytes)
>  pkts bytes target     prot opt in     out     source destination
>     0     0 DNAT       udp  --  external *       0.0.0.0/0 
> 0.0.0.0/0           udp dpt:4569 to:10.10.10.180:4569
>     0     0 DNAT       udp  --  external *       0.0.0.0/0 
> 0.0.0.0/0           udp dpts:10000:10100 to:10.10.10.180
>     0     0 DNAT       udp  --  external *       0.0.0.0/0 
> 0.0.0.0/0           udp dpt:5060 to:10.10.10.180:5060
> 
> Chain POSTROUTING (policy ACCEPT 3098 packets, 298K bytes)
>  pkts bytes target     prot opt in     out     source destination
>     0     0 LOG        udp  --  *      lan     0.0.0.0/0 
> 0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-POST: '
>     5   268 SNAT       all  --  *      external  0.0.0.0/0 
> 0.0.0.0/0           to:xxx.yyy.zzz.ooo
>

I've found it very helpful to look at the rules as output by the command
"iptables-save".  It's formatted nicely and in order of evaluation.  If
there are errors they are easier to spot (at least for me).

my 2p

