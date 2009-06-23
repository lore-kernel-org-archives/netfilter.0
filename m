From: =?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?= 
	<javier.galvez@entel.upc.edu>
Subject: Re: Trying to add RTP proxy extension
Date: Tue, 23 Jun 2009 14:27:37 +0200
Message-ID: <145d4e1a0906230527w42aec1b1mcbb0362195f36b54@mail.gmail.com>
References: <145d4e1a0906230403td01d6d8s2541d99ca07e9c6@mail.gmail.com>
	 <4A40C7DE.4090309@msm.ru>
Reply-To: javier.galvez@entel.upc.edu
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:reply-to:received
         :in-reply-to:references:date:x-google-sender-auth:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=8f0T1juoLhhkVqf6JW7lZYViXiBo7HdYWvYpAUYifvk=;
        b=wUKrGq66egBHMFVFF8ErnktSHbgRter6lenj7u2WoG3jBtbHm5bKvyDUsgbEUuKMKv
         3J/BXmLoZQg7DotW1pVxJjJcPCKEKS5hlOf9ijy+oDt4Njj8UwnU+WO4F8bTeOi9CsAi
         NqubN0jjgsUh+AmUyVoiaTnzc6WoRATXf2jOY=
In-Reply-To: <4A40C7DE.4090309@msm.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?KOI8-R?B?88HN1dPFzsvPIOHOxNLFyg==?= <samusenko@msm.ru>
Cc: netfilter@vger.kernel.org

Hi,

2009/6/23 =A7=B3=A7=D1=A7=DE=A7=E5=A7=E3=A7=D6=A7=DF=A7=DC=A7=E0 =A7=A1=
=A7=DF=A7=D5=A7=E2=A7=D6=A7=DB <samusenko@msm.ru>:
> Hi.
> For ./runme need Makefile in iptables directory. But anyone pom not w=
orking.
> Better way to use kernel source.
>

Could you please elaborate a little more on this? What do you mean?
What do I need to do?

> Why you not use nf_conntrack_sip / nf_nat_sip?
> I am not understand why need xt_RTPPROXY.
>

I'm not using nf_conntrack_sip / nf_nat_sip because I don't know them
=3D). I'll take a look at them. Anyway, do you know where can I get som=
e
info/tutorial about these extensions?


Thanks a lot,
Javi
> Javier G=A8=A2lvez Guerrero wrote:
>>
>> Hi all,
>>
>> I'm trying to add the Netfilter RTP proxy extension provided here:
>> http://www.2p.cz/en/netfilter_rtp_proxy. As install notes say, it mu=
st
>> be done with p-o-m, but I have a problem when running ./runme: the
>> iptables source directory is not accepted. I've seen many questions =
on
>> the web regarding this issue but I got no solution at all.
>>
>> However, AFAIK, p-o-m is 'deprecated' and Xtables-addons should be
>> used instead of it. Anyway, I don't know how to 'port' the
>> installation from p-o-m to xtables-addons as the files included in t=
he
>> RTP proxy extension package seem to be organized for p-o-m.
>>
>> I'm using Debian Lenny 2.6.18 with iptables 1.4.2 and I'm trying to
>> install Netfilter RTP proxy extension 0.4. Can anybody help me to ge=
t
>> it installed?
>>
>> BTW, is there any other iptables-based solution to mangle
>> SIP/NAT/SDP/RTP sessions issues in multimedia streaming applications
>> such as VoIP?
>>
>>
>> Hope you can help me. Thanks a lot for your time.
>>
>>
>> Regards,
>> Javi
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
