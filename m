From: "Antonio Augusto (Mancha)" <mkhaos7@gmail.com>
Subject: Re: Filtering by Mac Address
Date: Wed, 13 Feb 2008 23:32:21 -0300
Message-ID: <4c6e034d0802131832m5ca3e130j65ef5a3c2cfb37c9@mail.gmail.com>
References: <63D06BD7-145A-4A49-8E64-D91C813B987F@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=yY96IgWtIbac7QfGEV01T1qZ6fRaiujFBQwIi+pOzwI=;
        b=bRFr4zbJFCLgrBPpaHPpfYBdedBwcBxhfWEIdeu0VSQmodxceR8yXQzSChlKRzuna/aWX+jYibNCZmzFZk/T14Y3W7car+Qvaelh1r9LpKQ25hXLokZFERmnBTiA80hkwYDRWY/J4EOIgeqqsmLEezaoTao13eLkB9lHkbiCU/8=
In-Reply-To: <63D06BD7-145A-4A49-8E64-D91C813B987F@gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Cupertino Miranda <philfine@gmail.com>
Cc: netfilter@vger.kernel.org

You probably can use the mac target, passing a --mac-source option to
filter the macs you want to have access to the net.
All other connections should be treated by another rule that will do
some NATing to redirect all the traffic to your web server.
The second part of the solution probably was already discussed
hundreds of times here already, and there are a lot of very good
tutorial on the net on how to to this.

Cheers,
KM

On Wed, Feb 13, 2008 at 2:54 PM, Cupertino Miranda <philfine@gmail.com>=
 wrote:
> Hello everyone,
>
>  For one of my current hackings I need to construct the following
>  network rules.
>
>  I need to disable internet access to all the local network hosts by
>  redirecting them the my webserver (allowing to show some web page in
>  case of http connection).
>  Enable internet access by mac address to some of this hosts.
>
>  I have currently general NAT rules in gateway machine.
>
>  Can someone provide me some details how can I do it.
>
>  Thanks a lot
>  -
>  To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>  the body of a message to majordomo@vger.kernel.org
>  More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



--=20
Informa=E7=E3o & Seguran=E7a - Informa=E7=F5es para sua seguran=E7a na =
rede.
http://info-seg.blogspot.com
