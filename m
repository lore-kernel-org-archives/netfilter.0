From: netfilter@allycomm.com
Subject: Re: Can't override filter section OUTPUT DROP / INPUT DROP Policy
Date: Fri, 25 Aug 2017 09:16:54 -0700
Message-ID: <202e2fe9-12b2-4d6c-934f-02f8f23147b2@wagsky.com>
References: <59A0313C.1020409@embarqmail.com>
 <84281c34-08f4-2979-ad33-78d8bec77c39@wagsky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <84281c34-08f4-2979-ad33-78d8bec77c39@wagsky.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@allycomm.com, gazoxtapod <gazoxtapod@embarqmail.com>, netfilter@vger.kernel.org

Ugh, here are the diagrams again, hopefully "protected" against spacing 
changes this time!

On 8/25/17 9:12 AM, netfilter@allycomm.com wrote:
> . Approach 1 -- Provide staticroute to modem
>
> . Modem ----- Router IF_ext                Router IF_int ----- 
> internal net ----- RPi
> .             203.0.113.123/24 - DHCP 192.168.168.1/24 -- static      
>        192.168.168.200/24 -- DHCP
> .             192.168.0.2/24   - static 192.168.0.4/24   -- static
>
> . Approach 2 -- Bridge to VLAN
>
> . Modem ----- Router IF_ext                Router IF_int ----- 
> internal net ----- RPi
> .             203.0.113.123/24 - DHCP 192.168.168.1/24 - static      
>         192.168.168.200/24 - DHCP
> .             Router IF_ext:1              Router 
> IF_ext.1234                     RPi.1234 (or second adapter)
> .             192.168.0.2/24   - static 192.168.0.3/24   - static 
>              192.168.0.4/24     - static


