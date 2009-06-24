From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Re: Question about nat filtering with FORWARD
Date: Wed, 24 Jun 2009 12:22:09 +0200
Message-ID: <33be4bb30906240322x1934b045g5e74e16f012ffcd7@mail.gmail.com>
References: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=dFqUG3jJtJ7eUuavGpM24HyVgDmCoXzH3bcoBQY+g6c=;
        b=N2RI9uImERI+PRm93MFcK21q6tDbR4V41z5zLUa/00ELdTdEkAHJoDaBM8ak/x7Y9P
         31tPM/LvWZsUkuO0C7KHcF3xPvR94B4KUQdF4GDqKh0P0ngPlc9q0qk2ADodvX0cLGNQ
         zXVTurhb2WHbCPdaIajvIOKeRZdQFo9Ccc8Ls=
In-Reply-To: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: netfilter@vger.kernel.org

You need to allow the return traffic also. This can be done with
connection tracking and the state match.

/Oskar


2009/6/24 Jorge Bastos <mysql.jorge@decimal.pt>:
> Hi there,
> I use to do nat filtering with the PREROUTE chain, but in the latest
> version i see that is no longer possible.
> After trying to ajust my scripts i did:
>
>
> #allow TCP PORT 22
> iptables -t filter -A FORWARD -p tcp --dport 22 -j ACCEPT # ssh
> #block everything else
> iptables -t filter -A FORWARD -j DROP
>
>
> Am i doing it in the correct way?
> The problem is, i cannot access the 22 port to the outside world when=
 the
> DROP rule is applied.
>
> Jorge,
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
