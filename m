From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Some packets flagged INVALID
Date: Tue, 18 Feb 2014 23:38:31 +0100
Message-ID: <5303E0E7.8090201@chello.at>
References: <20140218215218.194660@gmx.com> <201402181726.31992.neal.p.murphy@alum.wpi.edu>
Reply-To: mart.frauenlob@chello.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201402181726.31992.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: neal.p.murphy@alum.wpi.edu
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Bob.sauvage@gmx.fr

On 18.02.2014 23:26, Neal Murphy wrote:
> On Tuesday, February 18, 2014 04:52:18 PM Bob Sauvage wrote:
>> Hi *,
>>
>> I'm running a high volume web application that uses Apache 2.2.15 mod_proxy
>> to reverse proxy content from apache to JBoss 6.
>>
>> I found 503 errors which happen sporadically throughout the day on random
>> requests (perhaps 1/1000 of daily requests).
>>
>> After investigations, I noticed that every error coincides with an invalid
>> tcp packet:
>>
>> kernel: invalid:IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00
>> SRC=127.0.0.1 DST=127.0.0.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=33082 DF
>> PROTO=TCP SPT=48340 DPT=8080 WINDOW=32792 RES=0x00 SYN URGP=0
>>
>> After some investigations, this SYN packet is not acknowledged by JBoss in
>> order to perform the TCP 3-Way Handshake. Mhmm, strange, I decide to
>> investigate in firewall rules, build by another sysadmin:
>>
>> In the INPUT chain, I found a rule that logs and REJECTS all INVALID
>> packets:
>>
>> iptables -A INPUT -m state --state INVALID -j LOG --log-prefix "invalid:"
>> iptables -A INPUT -m state --state INVALID -j REJECT
>>
>> Then logs and REJECTS not SYN but new:
>>
>> iptables -A INPUT -p tcp ! --syn -m state --state NEW -j LOG --log-prefix
>> "new-not-syn:"
>> iptables -A INPUT -p tcp ! --syn -m state --state NEW -j
>> REJECT --reject-with tcp-reset
>>
>> I decided to add a rule in order to ACCEPT all packets from 127.0.0.1 to or
>> from port 8080.
>>
>> Since this update, I don't see this kind of errors anymore.
>>
>> Why does iptables tag this packet as invalid ?
>
> I believe INVALID applies to all packets that netfilter has no clue why it has
> receieved them. Often, it's a RST or FIN for a non-existent conn or one
> recently torn-down. DDoS packets are often INVALID.
>
> I think those 'syn' rules above are 'defective' (or extraneous). For TCP, only
> a SYN packet should be tagged NEW because there is no other way to initiate a
> TCP conn.

right, but in a fail-over scenario with conntrackd you need to set a 
sysctl to allow:

nf_conntrack_tcp_loose - BOOLEAN
         0 - disabled
         not 0 - enabled (default)

         If it is set to zero, we disable picking up already established
         connections.


or you might tune the behaviour with:

nf_conntrack_tcp_be_liberal - BOOLEAN
         0 - disabled (default)
         not 0 - enabled

         Be conservative in what you do, be liberal in what you accept 
from others.
         If it's non-zero, we mark only out of window RST segments as 
INVALID.

see:
Documentation/networking/nf_conntrack-sysctl.txt

in your kernel source dir.

>
> In this particular case, it may be that the SYN arrived during the grace
> period after a previous matching conn was torn down. (Related to
> SO_REUSEADDR?)

