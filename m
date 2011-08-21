From: Pandu Poluan <pandu@poluan.info>
Subject: Re: Can't share ppp internet connection
Date: Sun, 21 Aug 2011 18:40:05 +0700
Message-ID: <CAA2qdGUa=REEFe3861GoNUwY11yxCxYTJkhuuzSfALdu02vh6Q@mail.gmail.com>
References: <CAJ1a921b0HqJmUxTfqmsO+RG56w+DS6tBoWWhPBFQb8t2cHQCQ@mail.gmail.com>
	<CAA2qdGWCeRLwrJBrXujXjf_mk=4DQ6GS+KascfZv9=sDSRw=Rg@mail.gmail.com>
	<CAJ1a920B=sXLdAXZ_Oc9MGT=MdPzV4RaWtQpsvfm1HkeX4oP9g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJ1a920B=sXLdAXZ_Oc9MGT=MdPzV4RaWtQpsvfm1HkeX4oP9g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinicius Massuchetto <viniciusmassuchetto@gmail.com>, Netfilter <netfilter@vger.kernel.org>

(sorry for top posting; Gmail mobile java client sucks)

No, it should be port 68 (got my web access, I can now verify the number).

We want all packets *outgoing* of the box *destined* for port 68 (DHCP
server's listening port) to bypass NAT.

Rgds,


On 2011-08-21, Vinicius Massuchetto <viniciusmassuchetto@gmail.com> wrote:
> 2011/8/21 Pandu Poluan <pandu@poluan.info>:
>> Just a hunch; do this:
>>
>> iptables -t nat -I POSTROUTING -p udp --dport $DHCP_SRV_PORT -j ACCEPT
>>
>> (sorry, for some unknown reason, I can't open any web site;
>> $DHCP_SRV_PORT should be 67 or 68, I forgot which)
>
> According to the logs, the requests come in port 67.
>
>> In effect, the above rule causes DHCP packets going to the DHCP server
>> to bypass the MASQUERADE target.
>
> Running this after the script has no effect in this behavior.
> iptables -t nat -I POSTROUTING -p udp --dport 67 -j ACCEPT
>
> Thanks for the tip.
> --
> Vinicius Massuchetto
>


-- 
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
