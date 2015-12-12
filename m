From: =?UTF-8?Q?Remzi_AKY=c3=9cZ?= <linuxliste@gmail.com>
Subject: Re: Linux 4.3.1 regression: -m state returns "Protocol wrong type for
 socket"
Date: Sat, 12 Dec 2015 13:50:13 +0200
Message-ID: <566C09F5.6080606@gmail.com>
References: <n4g4s8$4pr$1@ger.gmane.org> <566BEF33.7090501@gmail.com>
 <alpine.DEB.2.10.1512121116390.13421@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=sz0FN22/8aK3tdxivpwq0Rc18E/AeN95P23JYlu4gjs=;
        b=R24tWh96w7mbgt34eJpaBkmi2p80xVhyDy+rSjn26396dJNr3k+yxnq2LvuoVe2uC4
         HOLYNq3B7dlXFhfwt+D8LR8/Xv/rr7xBmnH5wQJy04r1ss9ZtBR7OfzFAdYsL+8oS493
         sOcc/WDqejVLfHg0gN8eSgeSobhX9eoMQQm4q/y8KFs0p/qXWh2KyufD46ojWsQJhvNh
         DKvyTQFEE3XThdo0eWfjufbkKLbNWhB8eoI64Hh9Lx+MDBmkjsNyjz3cBs89msocRi7J
         XFX7GXWk0HuvltGulKU/XtDIuEsdNuIBp3KO9PkiBuKrnFTD6ZHnH3Zr6YvDxl8XxD2T
         yrhA==
In-Reply-To: <alpine.DEB.2.10.1512121116390.13421@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: =?UTF-8?Q?D=c3=a2niel_Fraga?= <fragabr@gmail.com>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

"-m state " could not use without protocol. Therefore we must use witch
-p tcp.

If we have alot of rule we can use additional parameter like as;

iptables -A INPUT -p tcp --dport 22 -s 1.2.3.4 -m state --state
ESTABLISHED,RELATED -j ACCEPT

maybe this is better;

iptables -A INPUT -p tcp --dport 22 -s 1.2.3.4 -m conntrack --ctstate
RELATED,ESTABLISHED -j ACCEPT

What you need, iptables give it to you. :-)

12-12-2015 12:18 tarihinde Jozsef Kadlecsik yazd=C4=B1:
> On Sat, 12 Dec 2015, Remzi AKY=C3=9CZ wrote:
>
>> Please use with -p tcp
>>
>> iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACC=
EPT
> That's not a solution at all, this can break a huge number of=20
> configurations.
>
> Best regards,
> Jozsef=20
>
>> 12-12-2015 05:38 tarihinde D=C3=A2niel Fraga yazd?:
>>> 	After upgrading the kernel from 4.3.0 to 4.3.1 (with the same
>>> configuration), -m state doesn't work anymore.
>>>
>>> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>>>
>>> 	returns:
>>>
>>> iptables: Protocol wrong type for socket.
>>>
>>> 	I'm using iptables v1.4.21.
>>>
>>> 	Any hints?
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sc=
iences
>           H-1525 Budapest 114, POB. 49, Hungary

