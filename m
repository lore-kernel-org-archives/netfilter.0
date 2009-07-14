From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Forwarding packets over the same LAN
Date: Tue, 14 Jul 2009 11:25:18 +0200
Message-ID: <4A5C4EFE.7000700@chello.at>
References: <1247493655.2316.104.camel@TestField.intranet.bem.md>	 <1247494451.25529.52.camel@enterprise.ims-firmen.de> <1247558286.7214.16.camel@TestField.intranet.bem.md>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1247558286.7214.16.camel@TestField.intranet.bem.md>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: simionea@gmail.com

Simion Onea wrote:
> On Mon, 2009-07-13 at 16:14 +0200, Thomas Jacob wrote:
>   
>> You need DNAT+SNAT for this:
>>
>> # Redirect to IP:Port
>> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 10025 \
>> 	 -j DNAT --to-destination 172.20.1.254:25
>>
>> # Ensure that the replies come back to us
>> iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 25 \
>>          -d 172.20.1.254  -j SNAT --to-source 172.20.1.245
>>     
>
> Hi Thomas!
>
> I tried these rules but it seems that packets to not pass the first
> rule. To test this I put two LOG targets before and after the PREROUTING
> rule like this:
>
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 10025 -j LOG
> --log-tcp-options --log-prefix PREROUTING_before:
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 10025 -j DNAT
> --to-destination 172.20.1.254:25
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 25 -j LOG
> --log-tcp-options --log-prefix PREROUTING_after:
> iptables -t nat -A POSTROUTING -o eth0 -p tcp -d 172.20.1.254 --dport 25
> -j SNAT --to-source 172.20.1.245
>
> As a result I received in the log three messages with
> "PREROUTING_before" -- these were SYN packets. And no message with
> "PREROUTING_after" :-(
>
> What could be wrong ?
>
> Regards,
> Simion.
>   
Remember for the POSTROUTING rule, the previously redirected packets 
come from the host:port, NOT go to the host again.
You need `-s xxx.xxx.xxx.xxx --sport xx' -j SNAT ....

Greets

Mart
