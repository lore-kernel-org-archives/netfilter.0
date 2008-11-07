From: "Henrique Netfilter" <henrique.netfilter@gmail.com>
Subject: Re: Redirect back to internal network
Date: Fri, 7 Nov 2008 18:02:00 -0200
Message-ID: <ebccda510811071202n32907e65r296ad9a281aa3b3d@mail.gmail.com>
References: <ebccda510811070906s62a2619di8a8d54dc4b3b9f9e@mail.gmail.com>
	 <491490E0.7080701@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Ms6axR0HolaDqqfzNNHtznIqZFp/ivesCdnRh1uZa3w=;
        b=EGxi1t4ntc9LXKDi2dp8kaSNcciW2FWl1v6rhwV52F4ZQcQWvi/ICZtXe82MN4QwED
         sdaBcLdUD2v8OYpfn8/tEqLzr4QXf+nQQo222sAbI+jhYIL8xbDF8FFkAwaRIF3DT8d4
         WVYLSU5hwIR7pG7MxSduElB/jvmzbnnIZzB54=
In-Reply-To: <491490E0.7080701@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Thanks Grant.

It actually worked, but only when I also added my PREROUTING DNAT rule.
So the final solution is like this:

iptables -t nat -I PREROUTING -i <internal_network_interface> -d
<Internet_Address> -j DNAT --to <Internal_Server_Address>

iptables -t nat -I POSTROUTING -o <internal_network_interface> -s
<LAN_address> -d <Internal_Server_Address> -j SNAT --to
<internal_network_IP>

Thanks once again.

2008/11/7 Grant Taylor <gtaylor@riverviewtech.net>:
> On 11/07/08 11:06, Henrique Netfilter wrote:
>>
>> I=B4m trying to redirect connections to an external address back to =
an
>> internal address, like this:
>
> (With out having read the rest of your message...)
>
> Look for the reply I just made to Simon's message with the subject "A=
ltering
> firewall rules to enable NAT Reflection".  I think that will help you=
=2E
>
>
>
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
