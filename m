From: sean darcy <seandarcy2@gmail.com>
Subject: Re: why can't I DNAT SIP?
Date: Thu, 08 May 2008 21:18:20 -0400
Message-ID: <g008p1$g2c$1@ger.gmane.org>
References: <fvtjuu$7i1$1@ger.gmane.org> <48235501.4030608@riverviewtech.net> <fvvuil$ldh$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fvvuil$ldh$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

sean darcy wrote:
> Grant Taylor wrote:
>> On 05/07/08 20:10, sean darcy wrote:
>>> On my outside box I trying to route sip ( port 5060 ) and iax ( 4659 
>>> ) packets to an internal asterisk server. I use DNAT, which works 
>>> fine for iax, but doesn't for SIP. I'm using identical DNAT statments.
>>
>> No you are not.
>>
>>> $IPT -t nat -A PREROUTING -i external -p udp --dport 4569 -j DNAT 
>>> --to 10.10.10.180:4569
>>
>> (verses)
>>
>>> $IPT -t nat -A PREROUTING -s ext-box  -p udp --dport 5060 -j DNAT 
>>> --to 10.10.10.180:5060
>>
>> Note that you have "-i external" on the first (IAX) rule and "-s 
>> ext-box" on the second (SIP) rule.
>>
> I tried it both ways. FWIW, it works both ways for iax. I showed it that 
> way because the LOG statement were that way. I've run them all both ways.
> 
>> I don't know if you have taken this in to account or not, but remember 
>> that SIP is not really NAT friendly.
>>
> 
> Yeah, but why is iptables not filtering the packet correctly; it's just 
> a port 5060 udp packet. How can it matter that it's 5060 instead of 4569?
> 
> Here it comes in -t raw -A PREROUTING:
> 
> GATEWAY:   IN=external OUT= 
> MAC=00:48:54:8b:ab:29:00:1a:e2:84:bf:3b:08:00 SRC=xxx.yyy.148.160 
> DST=yyy.xxx.167.178 LEN=527 TOS=0x04 PREC=0x00 TTL=48 ID=32417 PROTO=UDP 
> SPT=5060 DPT=5060 LEN=507
> 
> either:
> $IPT -t nat -A PREROUTING -s ext-box  -p udp --dport 5060 -j DNAT --to
> 10.10.10.180:5060
> 
> or:
> 
> $IPT -t nat -A PREROUTING -i external -p udp --dport 5060 -j DNAT --to 
> 10.10.10.180:5060
> 
> should send the packet to the FORWARD chain, but instead it shows up in 
> INPUT:
> 
> SIP-INPUT:    IN=external OUT= 
> MAC=00:48:54:8b:ab:29:00:1a:e2:84:bf:3b:08:00 SRC=xxx.yyy.148.160 
> DST=yyyy.xxx.167.178 LEN=527 TOS=0x04 PREC=0x00 TTL=48 ID=32417 
> PROTO=UDP SPT=5060 DPT=5060 LEN=507
> 
> 
> ?????
> 
AFAICS, ports 4569 and 5060 should both be FORWARD'ed:

+ /sbin/iptables -v -t nat -A PREROUTING -i external -p udp --dport 4569 
-j DNAT --to 10.10.10.180:4569
DNAT  udp opt -- in external out *  0.0.0.0/0  -> 0.0.0.0/0  udp 
dpt:4569 to:10.10.10.180:4569
+ /sbin/iptables -v -A FORWARD -p udp -m state --state NEW -d 
10.10.10.180 --dport 4569 -j ACCEPT
ACCEPT  udp opt -- in * out *  0.0.0.0/0  -> 10.10.10.180  state NEW udp 
dpt:4569
+ /sbin/iptables -v -t nat -A PREROUTING -i external -p udp --dport 5060 
-j DNAT --to 10.10.10.180:5060
DNAT  udp opt -- in external out *  0.0.0.0/0  -> 0.0.0.0/0  udp 
dpt:5060 to:10.10.10.180:5060
+ /sbin/iptables -v -A FORWARD -p udp --dport 5060 -m state --state NEW 
-d 10.10.10.180 -j ACCEPT
ACCEPT  udp opt -- in * out *  0.0.0.0/0  -> 10.10.10.180  udp dpt:5060 
state NEW

sean

