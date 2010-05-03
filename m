From: Steve Fink <sphink@gmail.com>
Subject: Re: DNAT issue (with added network diagram)
Date: Mon, 3 May 2010 09:24:42 -0700
Message-ID: <h2y7d7f2e8c1005030924kdb8bb20u9c71b7fa0d3a8ae6@mail.gmail.com>
References: <4BDECE5A.4010808@imaginator.com>
	 <alpine.LSU.2.01.1005031601340.29150@obet.zrqbmnf.qr>
	 <4BDEDBE4.3020803@imaginator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=+mnJpwjK0Ew/sj9+7daVZcCr1vr9I8BQKb2zyBMhBI8=;
        b=udkPW+bBtocdHAcl1ncvkWHJ6Mi+/6dmjfa5Xy1qD+yuE0TIMzNHcsnikEltNu+EwX
         XNXPSdhtcDjvv3zzwcrVhqSeJGdWBGdZgdLSXqFKifYD+GwxbK/IqvOyK5WTt/83YoKh
         jupdNgeTqdN5G2ayotr2y1x8wdygEIzEqd/cM=
In-Reply-To: <4BDEDBE4.3020803@imaginator.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Simon Tennant <simon@imaginator.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

(apologies if you see this twice; I accidentally sent as HTML first.)

Add an /etc/hosts entry on cave that maps maar to 127.0.0.1? Not great
if you want cave to get to maar and you don't have an alternate set of
LAN addresses, I suppose.

If cave is trying to access XMPP on itself, then would it also want to
access HTTPS? If so, then bouncing traffic through maar seems like a
good thing.

=46or the direct answer you're looking for, though, are you saying the
direct approach doesn't work?:

  iptables -t nat -A OUTPUT -p tcp -d maar --dport 443 -j DNAT
--to-destination localhost:5222

If you have all these public IPs, can't you get more than one for cave
and dispense with all of the NATting?

On Mon, May 3, 2010 at 7:21 AM, Simon Tennant <simon@imaginator.com> wr=
ote:
>
> On 03/05/2010 16:01, Jan Engelhardt wrote:
>>>
>>> My question is what DNAT or SNAT rules do we need to add to cave or=
 to maar so
>>> that remote *and local (originating from cave)* clients can make xm=
pp
>>> connecitons on 443 and end up on cave:5222?\
>>>
>>
>> Since they have all public addresses, no NAT is needed.
>>
>
> Just to clarify: both services run on one host. =A0The second host (m=
aar) doesn't host any services and shouldn't. It's role in this is just=
 forwarding maar:443 -> cave:5222. =A0Ordinarily I'd just have a listen=
er for xmpp on cave:443 but that's taken by apache. =A0Hence this packe=
t wangling.
>
> S.
>
> --
> Simon Tennant
>
> +44 20 7043 6756 (UK - office)
> +49 17 8545 0880 (Germany - mobile)
> +49 89 4209 55854 (Germany - office)
> skype: simontennant
> xmpp: simon@buddycloud.com
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
