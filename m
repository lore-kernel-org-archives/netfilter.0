From: Alex Buie <alex.buie@datto.com>
Subject: Re: IPTables ISP Open Port Notices
Date: Fri, 3 Jun 2022 17:34:58 -0400
Message-ID: <CANGix0AaeMP=PKnGc3p=nhxXEAxg6WEzAKb3BhYCpGz-JmFUdQ@mail.gmail.com>
References: <eb720ea4-1d97-8eb7-0529-1d0d8ed6473c@steinmetznet.com>
 <CANGix0AkwkKWU6y34BTAQQyPo37E-N+c5Rex8Nc5U-Z0-aD3Mg@mail.gmail.com> <f3e54f04-2ab0-fc01-eb3e-d8fcef2c0c12@steinmetznet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datto.com;
        s=mimecast20190208; t=1654292111;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IdLp4h3VYIS/oVruehWhVYmyXpSsxQKFR7k1uKeKwdY=;
        b=WdTmACKaOPMAJl2gQtrNI/o5MBgJfXX5Uxuhu08zM/jC+Mif+AI2EhInQcvxWc2HTz9QCg
        Bjavk9E2M3oh9T+tCQCzSgg1LnBglqgVnd7GTJSNoWhCRnCOnJqzRLouhITPKjPtFcki+a
        PXQxq4oB5jKa8TJhydobnfUdchDDTJg=
In-Reply-To: <f3e54f04-2ab0-fc01-eb3e-d8fcef2c0c12@steinmetznet.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert Steinmetz,,," <rob@steinmetznet.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

You shouldn't need to add a separate rule for the public IPs - the NAT
rule will get evaluated first, so in the context of the FORWARD chain
(which is where you need to do this processing) the traffic will
already have a post-NAT destination (aka private IP)

https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Netfilter-packet-=
flow.svg/2560px-Netfilter-packet-flow.svg.png

This chart might be helpful - if you look in the middle in the green
by "Routing Decision", you'll see that the NAT table's prerouting
chain gets evaluated just before that point. (so we come in to
"Routing Decision" with the DNAT'd internal IP address, not the public
IP) Then, since these are forwarded, it continues on to the right of
the chart to the mangle (modify) table's FORWARD(ing) chain, and then
finally to the filter table (also the default table when
unspecified)'s FORWARD chain. That is where your DROP rules are
getting inserted, and why they need to be the internal IPs and not the
publics.

On Fri, Jun 3, 2022 at 5:07 PM Robert Steinmetz,,, <rob@steinmetznet.com> w=
rote:
>
>
> On 6/1/2022 11:50 AM, Alex Buie wrote:
>
> Try adding DROPs to the FORWARD chain for the internal (post-DNAT) IP add=
ress (ie, ) [or even REJECT if you wanna send ICMP back]
>
> Since these are routed they will not traverse the INPUT and OUTPUT chains=
, which are only for traffic specifically destined to or generated from the=
 host. Routed traffic will traverse the FORWARD chain.
>
> Thanks.
>
> That's what I needed to understand. I've added:
>
> -A FORWARD -d 192.168.1.2 -p udp -m udp --dport <port> -j DROP
>
> -A FORWARD -d 192.168.1.3 -p udp -m udp --dport <port> -j DROP
>
> My understanding is this will drop packets routed from the Public IP addr=
ess to the Private IP address.  One question I have does this block traffic=
 on that port in both directions, or just the incoming traffic to the priva=
te address? Should there be a similar statement for the corresponding Publi=
c IP address?
>
> I hope this works. I've updated my rule set. My ISP apparently runs these=
 checks every 3 days or so so now I just need to wait and see if it stops s=
ending them. I don't work with iptables very often, once they're set up I t=
end to leave them alone for years.
>
> I'll report back in a few days.
>
> --
> Robert Steinmetz AIA
> Principal
> Steinmetz & Associates
>
> New Orleans & Atlanta



--=20
Alex Buie
Senior Networking Software Engineer
Datto, Inc.
475-288-4550 (o)
585-653-8779 (c)
www.datto.com



Join the conversation!

