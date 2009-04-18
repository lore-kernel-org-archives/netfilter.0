From: Bruno Moreira Guedes <thbmatrix@gmail.com>
Subject: Re: Learning iptables
Date: Sat, 18 Apr 2009 12:55:11 -0300
Message-ID: <3fdd6ce00904180855o42882e61ubbf424680b543a8e@mail.gmail.com>
References: <49E9C87A.1030509@veltrac.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=xahD83n7KJjjWGrr2pEFiP95ZyOoUi1CSDIsllpJkBw=;
        b=Q1pP8BMkhc4YShEKxvA9GnEbvWZdyZWls2HGd8elNKz4yJKQ0ukpJ2hffRuCg0ldPT
         /nE38iHiybwN3vVA6uAQ2403C1glY4ovsvjUX9XSYPj01J5p03f0uTVhY9/92P98+uwZ
         EerhubL3EC6ZGEmlug/uFt1f8lqih3lUm1Ut8=
In-Reply-To: <49E9C87A.1030509@veltrac.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

2009/4/18 Leonardo Carneiro <lscarneiro@veltrac.com.br>:
> Hi everyone,
>
> I'm have a avarage-to-good linux knowlegde, but i'm quite noob when i=
t comes
> about iptables, so i decided to study about.
> I'm reading a lot of articles and blogs, and testing some rules, so f=
ar it's
> all going well.
> Right now i'm running a server with tons of rules written by the admi=
n that
> worked here before me, and in the policies session of the script i've=
 found
> theses rules:
>
> =A0 $IPTABLES -P INPUT ACCEPT
> =A0 $IPTABLES -P OUTPUT ACCEPT
> =A0 $IPTABLES -P FORWARD ACCEPT
> =A0 $IPTABLES -F
> =A0 $IPTABLES -t nat -F
> =A0 $IPTABLES -t mangle -F
> =A0 $IPTABLES -X
>
> =A0 $IPTABLES -A INPUT -s $LO_IP -j ACCEPT
> =A0 $IPTABLES -A OUTPUT -d $LO_IP -j ACCEPT
> =A0 $IPTABLES -A INPUT -s $LAN_IP -j ACCEPT
> =A0 $IPTABLES -A OUTPUT -d $LAN_IP -j ACCEPT
> =A0 $IPTABLES -A INPUT -s $INET_IP_DIN -j ACCEPT
> =A0 $IPTABLES -A OUTPUT -d $INET_IP_DIN -j ACCEPT
>
> =A0 $IPTABLES -P INPUT DROP
> =A0 $IPTABLES -P OUTPUT ACCEPT
> =A0 $IPTABLES -P FORWARD DROP

The main thing I couldn't understand is why add just three ACCEPT
rules on a chain, and after set this chains default policy to ACCEPT.
And also, why set OUTPUT to ACCEPT twice!! Is the iptables deaf??

>
> Is there any good reason why someone would set an ACCEPT policy for a=
ll
> chains first to withdraw some later? What the benefit of doing this?
>
> Sorry about my poor english.
>
> Tks in advance
> --
>
> *Leonardo de Souza Carneiro*
> *Veltrac - Tecnologia em Log=EDstica.*
> lscarneiro@veltrac.com.br <mailto:lscarneiro@veltrac.com.br>
> http://www.veltrac.com.br <http://www.veltrac.com.br/>
> /Fone Com.: (43)2105-5600/
> /Av. Higien=F3polis 1601 Ed. Eurocenter Sl. 803/
> /Londrina- PR/
> /Cep: 86015-010/
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Anymore, be careful when trusting in the old admins script, get
ensured your firewall is safe by reviewing it.

[]'s
