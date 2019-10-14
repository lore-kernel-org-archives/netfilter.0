From: Daniel Huhardeaux <tech@tootai.net>
Subject: Re: nft and defined variables
Date: Mon, 14 Oct 2019 13:26:54 +0200
Message-ID: <e2344c13-db1b-634c-ed3c-80f8fff0a13a@tootai.net>
References: <7e6d4739-1877-c195-dc7b-95a111dd1cbc@tootai.net>
 <20191014100605.d3lnyran2ygeroh3@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1571052415; bh=OiDcPCLEp1sPQtNYjxIkQqClDvudrTD2dBi33QpPEKA=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=k3ZdknRlh75W6cle+wNdquF5gQtcq7afAobNlaGIU5PcNxQh7/DwoWJFcQryfsB7U
         In+4VfrDKTLdO8xU5LGfiQPZ1yakgvxS/Wa5K+1g21+9RuUr08KvGI0TqjfcTBdp+b
         33vdnU1qFzWKiypo2vzInt2zuymH5BAYb0kVaLLM=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1571052415; bh=OiDcPCLEp1sPQtNYjxIkQqClDvudrTD2dBi33QpPEKA=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=k3ZdknRlh75W6cle+wNdquF5gQtcq7afAobNlaGIU5PcNxQh7/DwoWJFcQryfsB7U
         In+4VfrDKTLdO8xU5LGfiQPZ1yakgvxS/Wa5K+1g21+9RuUr08KvGI0TqjfcTBdp+b
         33vdnU1qFzWKiypo2vzInt2zuymH5BAYb0kVaLLM=
In-Reply-To: <20191014100605.d3lnyran2ygeroh3@salvia>
Content-Language: fr
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Le 14/10/2019 à 12:06, Pablo Neira Ayuso a écrit :
> On Sat, Oct 12, 2019 at 09:52:20PM +0200, Daniel Huhardeaux wrote:
>> Hello,
>>
>> I want to script nft rules using sh + nft. The sh script contains variables
>> set for the host and passed to nft using include like eg include
>> "/etc/nftables/local.conf"
>>
>> It's OK for definition of IPs or port but not for alaphanumerical variables.
>> For instance, I want to pass as variable icmp_limit (number) and
>> icmp_measure (alpha) to include them in nft rule like blabla ... limit rate
>> over $icmp_limit/$icmp_measure ...
>>
>> define icmp_limit = { 20 }
>> define icmp_measure = minute
>>
>> but the result gives
>>
>> In file included from ./ip4fw.nft:3:1-35:
>> /etc/nftables/local.conf:10:23-28: Error: syntax error, unexpected minute
>> define icmp_measure = minute
>>                        ^^^^^^
> 
> Quotes are missing.
With

define icmp_limit = { 20 } 
 

define icmp_measure = "minute"

I get
./ip4fw.nft:36:110-110: Error: syntax error, unexpected '$', expecting 
number
add rule ip filter input iif $IFACE meta l4proto icmp icmp type { 
echo-reply, echo-request } limit rate over $icmp_limit/$icmp_measure 
counter drop
^

$icmp_limit is not recognized as number

> 
>> ./ip4fw.nft:36:110-110: Error: syntax error, unexpected '$', expecting
>> number
>> add rule ip filter input iif $IFACE meta l4proto icmp icmp type {
>> echo-reply, echo-request } limit rate over $icmp_limit/$icmp_measure counter
>> drop
>>
>> Same for KEEPSTATE variable but IFACE one is OK
>>
>> define IFACE = ens3
>> define KEEPSTATE = "state related, established"
>>
>> ./ip4fw.nft:49:40-40: Error: syntax error, unexpected '$'
>> add rule ip filter input iif $IFACE ct $KEEPSTATE counter accept
> 
> KEEPSTATE is not a variable here,

Why ? Because of space ?

  what you describe works like a
> macro. There is no macro support for nft yet. At this stage, you can
> only define values through variable definitions.
> 
>> What is the way to define alphanumerical variables ? I tried to escape
>> quotes with \ to remove them, to escape slash with \, no way to achieve my
>> goal :(
> 
> Always quote values in your variable definitions.
> 

I get no errors on defines, only when rules are applied containing thos 
3 variables. My complete define include loks like

# 
 

# Local variables 
 

# 
 

define nets = { 192.168.10.0/24, 192.168.12.0/24, 10.0.70.0/24, 
10.1.58.0/24, 10.2.70.0/24 } 

define nettcpports = { 22 } 
 

define netudpports = { 65500 } 
 

define worldtcpports = { 4569, 5060, 5061, 36022 } 
 

define worldudpports = { 4569, 5060, 5061, 26000-26999 } 
 

define icmp_limit = { 20 } 
 

define icmp_measure = "minute" 
 

define IFACE = ens3 
 

define addripv4 = 192.168.10.241 
 

define KEEPSTATE = "state related, established"

and I have no errors with other rules using those others variables.
-- 
Daniel
