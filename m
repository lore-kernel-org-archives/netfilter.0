From: "Gergely Buday" <gbuday@gmail.com>
Subject: Re: VPN client from behind a firewall
Date: Tue, 24 Jun 2008 10:36:09 +0200
Message-ID: <90d975d30806240136j5c54032awf4de9aa04598257d@mail.gmail.com>
References: <90d975d30806160444t7c9bbf21if9b0062e2e72ac56@mail.gmail.com>
	 <48565817.2040600@infolibre.net>
	 <alpine.LNX.1.10.0806161720190.6620@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=iC1BYXySHt9aG2Ne3CaOB2w4sksdJcrJrrheF/7LtVA=;
        b=XfqDbSujoicwZWnlvBdli5gAstQ0gtd9c3tX/LsL8hF1IVKIW9mQcMg+SUmoThqjPL
         AWYO76jgHip/8mmCXIlikOiJ+4MeFK2aBvhfDNOZUbMLq2kvDHDQdMp27gQpZYbBdoiR
         p4cgRS9puaMhfa3KKTb/iYJ+98jYpfj/KuOOQ=
In-Reply-To: <alpine.LNX.1.10.0806161720190.6620@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: mathieu <mathieu@infolibre.net>, netfilter@vger.kernel.org

2008/6/16 Jan Engelhardt <jengelh@medozas.de>:
>
> On Monday 2008-06-16 14:09, mathieu wrote:
>
>> Hi,
>>
>>       You need to authorize traffic and masquerade/SNAT connections and allow
>> forwarding.
>>
>> Authorize :
>>
>> iptables -A FORWARD -i eth1 -p udp -d $VPN_SERVER_IP -s $INTERNAL_CLIENT_IP
>> --dport 500 -m state NEW, ESTABLISHED -j ACCEPT
>>
>> iptables -A FORWARD -i eth0 -p udp -s $VPN_SERVER_IP -d $INTERNAL_CLIENT_IP
>> --sport 500 -m state ESTABLISHED -j ACCEPT
>>
>> SNAT (change internal adress by a public one) :
>
> But only if you have a NAT. A firewall is not a NAT, and vice-versa.
>
> As such -p udp 500 and -p esp will be needed for a firewall;
> and only -p udp 4500 for a NAT.

Thanks for your help. I made it work by adding "500" after -p udp in
the first command. Does this make a security risk?

- Gergely
