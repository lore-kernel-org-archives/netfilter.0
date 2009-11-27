From: Patrick McHardy <kaber@trash.net>
Subject: Re: LED trigger in iptables
Date: Fri, 27 Nov 2009 09:59:00 +0100
Message-ID: <4B0F94D4.7020002@trash.net>
References: <5c0c5c050911241359m7c8aeccqad728fe3272cb3e3@mail.gmail.com> <5c0c5c050911261315h2daea812rac027c51fd4df2bd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5c0c5c050911261315h2daea812rac027c51fd4df2bd@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mekabe Ramein <mrmrmrmr@gmail.com>
Cc: netfilter@vger.kernel.org

Mekabe Ramein wrote:
> Hi,
> 
> I'd appreciate any ideas.
> 
> Thanks,
> ilker
> 
> On Tue, Nov 24, 2009 at 11:59 PM, Mekabe Ramein <mrmrmrmr@gmail.com> wrote:
>> Hi,
>>
>> I am trying to use xt_LED module which is included in my kernel.
>> However, "iptables" does not accept the "--led-trigger-id" parameter
>> in the following command (which is an example given in module
>> description):
>>
>> iptables -A OUTPUT -p udp --dport 5060 -j LED --led-trigger-id sip
>> --led-delay 100
>>
>> My iptables version is 1.4.5 but it does not have the extension xt_LED in it.
>> So I searched for this and found a patch which adds this feature. But
>> I don't know where to apply the patch.
>> How can I make use of it ?
>>
>> Should I include it in iptables source or another package ?

The LED extension hasn't been merged yet because of some open problems.
