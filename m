From: Patrick McHardy <kaber@trash.net>
Subject: Re: why can't I DNAT SIP?
Date: Mon, 12 May 2008 18:01:11 +0200
Message-ID: <482869C7.5010500@trash.net>
References: <fvtjuu$7i1$1@ger.gmane.org> <48235501.4030608@riverviewtech.net>	 <fvvuil$ldh$1@ger.gmane.org> <48245C6B.1090506@riverviewtech.net>	 <48245E7E.8080206@trash.net> <c195ebf70805091904w5b728e5gbe0a57ed16b0516@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c195ebf70805091904w5b728e5gbe0a57ed16b0516@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: sean darcy <seandarcy2@gmail.com>
Cc: Grant Taylor <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@vger.kernel.org>

sean darcy wrote:
> On Fri, May 9, 2008 at 10:23 AM, Patrick McHardy <kaber@trash.net> wrote:
>> Grant Taylor wrote:
>>> On 05/08/08 17:24, sean darcy wrote:
>>>> I tried it both ways. FWIW, it works both ways for iax. I showed it that
>>>> way because the LOG statement were that way. I've run them all both ways.
>>>>
>>>> Yeah, but why is iptables not filtering the packet correctly; it's just a
>>>> port 5060 udp packet. How can it matter that it's 5060 instead of 4569?
>>> With out knowing the full scenario, I can't say for sure.  Are you dealing
>>> with an on going established connection, thus one that is not passing
>>> through the NAT chain again?
>>>
>>> Is it possible that you are dealing with SIP Reinvited traffic that really
>>> has a source of elsewhere?
>>>
>>> More things are starting to come in to play.
>> Some questions that might help answering this:
>>
>> - Which kernel version are you running?
> 
> 2.6.22
>> - What helpers are loaded (both NAT and conntrack)
> 
> ?? How would I find out? If you mean modules:
> 
> lsmod | grep nat
> iptable_nat            11461  1
> nf_nat                 22381  1 iptable_nat
> nf_conntrack_ipv4      21837  5 iptable_nat
> nf_conntrack           64585  4 xt_state,iptable_nat,nf_nat,nf_conntrack_ipv4
> nfnetlink               9945  3 nf_nat,nf_conntrack_ipv4,nf_conntrack
> ip_tables              16517  3 iptable_raw,iptable_nat,iptable_filter
> x_tables               18629  5 xt_state,ipt_LOG,xt_tcpudp,iptable_nat,ip_tables
>> - How does the entry from /proc/net/nf_conntrack for the
>>  SIP connection look like?
>>
> 
> OK. It's sunspots. Just got back to this now, and it's working:
> 
> GATEWAY:   IN=external OUT=
> MAC=00:48:54:8b:ab:29:00:1a:e2:84:bf:3b:08:00 SRC=xxx.yyy.144.110
> DST=yyy.xxx.167.178 LEN=576 TOS=0x04 PREC=0x00 TTL=49 ID=8130
> PROTO=UDP SPT=5060 DPT=5060 LEN=556
> SIP-FWD:    IN=external OUT=lan SRC=xxx.yyy.144.110 DST=10.10.10.180
> LEN=576 TOS=0x04 PREC=0x00 TTL=48 ID=8130 PROTO=UDP SPT=5060 DPT=5060
> LEN=556


That would indicate that a conntrack entry already existed when
the first packet arrived from the outside. I'm guessing that it
arrived before the DNAT rules were set up. Adding:

conntrack -F

to the end of your firewall-script should make sure that it works
reliably.


