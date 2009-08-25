From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Re: really need your help about iptables
Date: Tue, 25 Aug 2009 16:09:42 +0200
Message-ID: <33be4bb30908250709i5750f6a6ma86a27dc1f0829fc@mail.gmail.com>
References: <4A93CC1C.3070100@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=LbTn24S2By2/RVAte6/A6oOnFnDQqoP7BrtevzQJYCI=;
        b=iN4ObD/lgschoEuoNUDGIjoUHNSPOO4soEqEx41WDw3MLoYkz7FUK0/U/TGq+bdAnS
         4a56ujP2jhrV5ee0IrJb+JQf41jBw9ecEgq85MZNpPyeeyLp6iA0Vrsv8teyy2wb2A6e
         NV1CCZGY7eHlVf5JSrn3o3FRNJ7+nsMUBffoE=
In-Reply-To: <4A93CC1C.3070100@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

Use a higher limit for SYN packets to those services. IIRC your
ruleset from before.

/Oskar


2009/8/25 J. Bakshi <joydeep@infoservices.in>:
> Dear list,
>
> I really really need your help to configure iptables to cope with
> "connection time out problem" =A0Here what actually the situation is.
>
> I have configured iptables to drop nmap and other port scanning
> techniques ( collected from internet, like XMAS scan, FIN scan etc...=
).
> If I run nmap against the server ( like nmap -P0 <myserver> or nmap -=
P0
> -sT <myserver> ) then the firewall successfully dropping the scan
> packets and =A0make the nmap scan =A0to wait for *looooong* . =A0Good=
=2E =A0But on
> the other hand =A0the =A0http and mail server running on the =A0serve=
r
> providing "time out error" hence it is not possible to connect the ma=
il
> /apache and other services running on that =A0server during port scan=
ning
> against it. Could any one kindly suggest how to cope with this situia=
tion ?
>
> Thanks for your time.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
