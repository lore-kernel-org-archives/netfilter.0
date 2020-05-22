From: Ede Wolf <listac@nebelschwaden.de>
Subject: Re: nftables: defining variables containing ipv6 adresses
Date: Fri, 22 May 2020 06:35:48 +0200
Message-ID: <ca5da6be-335e-c45c-2b4b-8c9c7524e7bb@nebelschwaden.de>
References: <20200521122720.3a6c264a@kaperfahrt.nebelschwaden.de>
 <CAMOPTEz6tBM2gNat+GAwf=eweyf7czWigYL83W==PD4sbtZyag@mail.gmail.com>
Reply-To: listac@nebelschwaden.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMOPTEz6tBM2gNat+GAwf=eweyf7czWigYL83W==PD4sbtZyag@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: netfilter@vger.kernel.org

Thanks very much. Works now. I would not have expected nftables to do a 
semantical check, I believed, I'd had a syntax error somewhere and had 
put the cidr in the rule, not the variable definition

Ede


Am 21.05.20 um 19:29 schrieb Oliver O'Boyle:
> You need to use a valid ipv6 address. E.g.:
> 
> define IP6ADDR = 2607:f8b0:400b:80f::2004    <-- a single address with no CIDR
> define IP6PREFIX = 2607:f8b0:400b:80f::/64       <-- prefix with CIDR
> 
> If you're referencing the IP6PREFIX variable in a set, then you need
> to set the interval flag in the set. E.g.:
> 
> set IP6PREFIX_SET {
>      type ipv6_addr
>      flags interval
>      elements = {
>          $IP6PREFIX
>      }
> }
> 
> otherwise you do not need the interval flag for single addresses:
> 
> set IP6ADDR_SET {
>      type ipv6_addr
>      elements = {
>          $IP6ADDR
>      }
> }
> 
> Oliver
> 
> 
> On Thu, May 21, 2020 at 6:38 AM Thomas Weberstaedt
> <thomas.weberstaedt@nebelschwaden.de> wrote:
>>
>> Hi,
>>
>> I am wondering, how may I define IPv6 variables?
>>
>> The obvious idea:
>>
>> define IP6PREFIX = fdaa:bbbb:cccc:dddd
>>
>> produces an error:
>>
>> /etc/nftables/setup.conf:7:29-29: Error: syntax error,
>> unexpected colon, expecting newline or semicolon
>>
>> define IP6PREFIX = fdaa:bbbb:cccc:dddd
>>                              ^
>>
>> What would be the proper way to do so? Any documentation on this?
>>
>> Thanks
>>
>> Ede
> 
> 
> 

