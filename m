From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: Re: Https website is not accessible once transparent proxy is set 
     up
Date: Tue, 16 Sep 2008 13:03:07 +0200 (CEST)
Message-ID: <18b30431bfdfb986412e296c4bc9aad1.squirrel@www.arcoscom.com>
References: <A42989E6EE1BCE4C9C1FF7DE428FF3C6630F@mos-exchange.mosmsg.com.sg>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <A42989E6EE1BCE4C9C1FF7DE428FF3C6630F@mos-exchange.mosmsg.com.sg>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Read about HTTP transparent proxy.

The HTTPS can't be transparently proxied (as I now) for yet.

Regards

El Mar, 16 de Septiembre de 2008, 8:49, Sam Chan escribi=F3:
> Hi,
>
> I have just set up a transparent proxy (Squid 3.0 on Debian etch).
>
> Http redirect to port 3128 is ok and I can see http traffic in
> access.log.
>
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> REDIRECT   tcp  --  anywhere             anywhere            tcp dpt:=
www
> redir ports 3128
>
>
> But I cannot access https website even though I have enable port 443 =
to
> be forwarded.
>
> Chain FORWARD (policy DROP)
> target     prot opt source               destination
> LOG        0    --  anywhere             anywhere            state
> INVALID LOG level warning tcp-options ip-options prefix `DROP INVALID
> FORWARD'
> DROP       0    --  anywhere             anywhere            state
> INVALID
> ACCEPT     0    --  anywhere             anywhere            state
> RELATED,ESTABLISHED
> ACCEPT     tcp  --  localnet/24          anywhere            tcp
> dpt:https flags:FIN,SYN,RST,ACK/SYN state NEW
> LOG        0    --  anywhere             anywhere            LOG leve=
l
> warning tcp-options ip-options prefix `DROP '
>
> Base on what I see on my syslog, whenever I browse any https site, th=
e
> packet falls under INVALID and hence drop base on my second rule abov=
e.
>
> Can anybody help me?
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


