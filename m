From: =?ISO-8859-1?Q?Jorge_D=E1vila?= <jorgedavilalopez@gmail.com>
Subject: Re: Correct Chains to Apply Rules
Date: Tue, 17 May 2011 16:06:32 -0600
Message-ID: <BANLkTi=HLSfceXiVuEc45QHQOPd0ebFCPg@mail.gmail.com>
References: <1305666891.6262.1453014301@webmail.messagingengine.com>
	<4DD2E89F.30801@plouf.fr.eu.org>
	<1305669045.20717.1453045045@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type:content-transfer-encoding;
        bh=6lJKnVgTI8TTzBMb5MqTg3Nzo2M+eMbvPl5BV6vl+As=;
        b=Gd1kgwNBX0CoIQ3qp9zkQyvHbaj5ZtlrAWb2bJ7w50Se+I4T4lVQfNojwF1HjwN3ok
         +VfWTp0QgO4SCH8tULa9nHAsUdgTlc1AJRknxXqirg3ra7NiwzXx+EqEFC+n7o1V5VCK
         eCg2Y+qHUVwX5xbAyLmJUT+V6fye74HHBFE5A=
In-Reply-To: <1305669045.20717.1453045045@webmail.messagingengine.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Incoming traffic to eth0 or eth1 can be directed to the box itself or
must be FORWARDed in the case of:

1) Incoming traffic on eth0 directed to the internal network
2) Incoming traffic on eth1 directed to Internet

Jorge.

On Tue, May 17, 2011 at 3:50 PM,  <netfilter@buglecreek.com> wrote:
> OK. =A0Thanks. =A0So to block/allow traffic from network A to/from ne=
twork B
> I would apply my rules to the FORWARD chain using a source/destinatio=
n.
> The INPUT and OUTPUT chains on eth0 and eth1 are only for traffic bou=
nd
> for the firewall/router box itself?
>
> On Tue, 17 May 2011 23:29 +0200, "Pascal Hambourg"
> <pascal.mail@plouf.fr.eu.org> wrote:
>> Hello,
>>
>> netfilter@buglecreek.com a =E9crit :
>> >
>> > In the following scenario. =A0Someone makes a new HTTP request fro=
m the
>> > Internet that is allowed inbound on eth0 and goes out of the eth1
>> > interface to the HTTP server in the server network.
>> > The HTTP server in the server network sends the response to the or=
iginal
>> > requester.
>> >
>> > Does the response ever hit the INPUT chain of ETH1?
>>
>> No.
>>
>> > Or does it immediately go to the FORWARD chain
>>
>> Yes.
>>
>> > and out the OUTPUT chain of eth0.
>>
>> No.
>> The three filter chains are mutually exclusive : a packet can only g=
o
>> through one of them. Forwarded packets only go through the FORWARD c=
hain.
>>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Jorge Isaac D=E1vila L=F3pez
+505 8430 5462
jorgedavilalopez@gmail.com
---
