From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: ebtables & VLAN redirect
Date: Sun, 27 Jun 2010 09:04:15 +0300
Message-ID: <AANLkTikWc-CNXMieyxv2lB69UphqQRsjjJATJYrpjkMK@mail.gmail.com>
References: <AANLkTilVkFmW0SL3t6ESUN72On5y52OvxYBUz2ZZdAWc@mail.gmail.com>
	<4C262DA2.1040103@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=yFfRu8G82B597R9bbdf9ZHodVF03rXbaMOZ1aE3WNuo=;
        b=mn5PXJfoUVAeOGx3Xg8AedhnrH1aDjj9sPdRTFC7sFw5I/VTX5YDtBcm5FZDPpn5fM
         +eJjsTD081RF9uO7eIIlytq7dx8IfxUU+JnixvIlw00lsGJyBK1XIdNk7RpcKG+S3be7
         Sa9exrt3WjE7FlGtn26Qu4yZcwcg8A6eNP4ys=
In-Reply-To: <4C262DA2.1040103@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

2010/6/26 Grant Taylor <gtaylor@riverviewtech.net>:
> Anatoly Muliarski wrote:
>>
>> I have a lot of VLANs( eth1.100-eth1.200) and I need to redirect
>> specific IP frames arrived on them to VLAN eth1.9 on L2 level( as I
>> cannot use routing for them ). The simple way is to create a bridge
>> from all VLANs and filter out redirections to
>> unwanted(eth1.100-eth1.200) VLANs.
>
> That will work.
>
> Do you need to do so for all your VLANs, or just some of them?

Thank you for your response.

Unfortunately, I need to redirect the traffic from all VLANs. In other
words, the task comes to selective redirecting of the traffic from all
VLANs to a specified one. The redirecting must be unidirected, only
for the traffic that comes from all VLANs.

>
>> But this may cause preformance issues. Is there a finer solution?
>
> Could you get proxy ARP to work?

Yes, it works now, but for the other purpose.

>
> In other words, why selectively extend your broadcast domains in to t=
he
> other when you might be able to extend individual systems in to multi=
ple
> broadcast domains (in a manner of speaking).

That would work but I need to redirect traffic that is not destined to
VLAN 9 and ARP-proxy trick does not work for this case.

>
> If you aren't modifying frames as they pass through your bridge, and =
the
> only real thing that takes time to look through is your EBTables rule=
s, I
> don't think you will have a problem. =A0- =A0I've run multiple older =
slower
> systems (P-II 233) doing similar things (and bi-directional NATing of=
 source
> and destination MAC addresses) for a multi-megabit DSL connection wit=
h out
> any problems. =A0- =A0If you are worried about speed, pick up a curre=
nt low end
> workstation computer with with a decent network card.
>
> I'd say try it and see if the problem you are thinking about will eve=
n have
> any impact on the equipment you are using.
>
> Depending on the amount of traffic you are working with, I'd suggest =
gigabit
> connections to the switch. =A0If it's really a lot of traffic, multip=
le
> connections to segregate the traffic.

Thanks for the ideas. I'll try it. The main problem is to avoid
unnecessary bridging attempts for all VLANs( as it would waste CPU
time for try to transmit a packet to a hundred VLAN ).
Another way is to write a target extension to ebtables to replace a
vlan tag to a desired one, but as I need to do it selectively I need
ebtables' capabilities to analyze vlan-tagged packets and there are no
ones ...
Or to write something like a udp-broadcast-relay daemon...

--=20
Best regards
Anatoly Muliarski
