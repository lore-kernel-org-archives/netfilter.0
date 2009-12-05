From: Lorenzo Allegrucci <lorenzo.allegrucci@forinicom.it>
Subject: Re: match SIP & RTP packets
Date: Sat, 05 Dec 2009 09:35:15 +0100
Message-ID: <4B1A1B43.6020404@forinicom.it>
References: <4B16EC4F.4080703@forinicom.it> <4B179CD8.2080002@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B179CD8.2080002@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

Patrick McHardy wrote:
> Lorenzo Allegrucci wrote:
>> Hi all, it's not clear to me whether nf_conntrack_sip does SIP and RTP
>> connection
>> tracking or just SIP.. can you clarify?
>> I need to match both SIP and RTP packets and I was wondering if the rule
>> below would satisfy my requirements:
>>
>> iptables -t mangle -A FORWARD -o eth0 -m helper --helper sip -j CLASSIFY
>> --set-class 1:1
> 
> Almost, this will match on RTP packets and incoming signalling
> connections (-m helper matches on expected connections). What's
> missing is the original signalling connection on port 5060.

It doesn't work for me, but when I run the above
iptables rule it loads just the following modules:

nf_conntrack_ipv4      13352  1
nf_defrag_ipv4          1756  1 nf_conntrack_ipv4
xt_helper               1788  1
nf_conntrack           67608  2 nf_conntrack_ipv4,xt_helper

it doesn't load nf_conntrack_sip as I would expect..
(although it gives no errors)

I'll try again loading nf_conntrack manually and playing with
its parameters.
