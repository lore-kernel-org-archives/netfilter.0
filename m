From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Forwarding packets over the same LAN
Date: Tue, 14 Jul 2009 14:40:59 +0200
Message-ID: <4A5C7CDB.7000405@chello.at>
References: <1247493655.2316.104.camel@TestField.intranet.bem.md>	 <1247494451.25529.52.camel@enterprise.ims-firmen.de>	 <1247558286.7214.16.camel@TestField.intranet.bem.md>	 <4A5C4EFE.7000700@chello.at> <1247574025.7214.36.camel@TestField.intranet.bem.md>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1247574025.7214.36.camel@TestField.intranet.bem.md>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Simion Onea wrote:
> On Tue, 2009-07-14 at 11:25 +0200, Mart Frauenlob wrote:
>   
>> Remember for the POSTROUTING rule, the previously redirected packets 
>> come from the host:port, NOT go to the host again.
>> You need `-s xxx.xxx.xxx.xxx --sport xx' -j SNAT ....
>>     
>
> Hi Mart!
>
> But this rule is for the packets leaving host 172.20.1.245 not for the
> packets coming back from 172.20.1.254.
> The first rule changes packets' destination address and port (DNAT) so
> that they go to the other host. And the second rule changes packets'
> source address (SNAT) so that the other host returns the packets back to
> this host (172.20.1.245) not to the originating host from the LAN
> (172.20.1.xxx).
> When the packets return back from 172.20.1.254 to 172.20.1.245 the
> kernel it is supposed to recognize that these packets were previously
> DNAT-ed and SNAT-ed and to reverse back their source and destination
> addresses and send them back to the originating host from the LAN
> (172.20.1.xxx).
> This is the way I understand the process.
>
> Regards,
> Simion.
>   
oops, sorry my bad :/
