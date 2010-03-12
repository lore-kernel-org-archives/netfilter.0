From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: Update delay when using nat table?
Date: Fri, 12 Mar 2010 14:57:53 +0530
Message-ID: <cfeab66d1003120127t72a86f09kc79ed17a27e5d799@mail.gmail.com>
References: <09084388150B46A2B74F745A8E1272DA@main>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=tA1nZjrmSxfVzE4xqhIyY1VhPq7ILfN0jDWMt8UZzjI=;
        b=HTa/PB0OCQMZ1xnUaq+gpUEkBSMr1YPloUx/8zBIb9AxS1HEEQYicgAWrxMCh6iPVA
         LINz/Uaa06MpDHHgCwiaNV7aFkm44arMRmDfskCh/4DJl26NMrfHHfOn7RAYP5yglPLH
         L3yh/mRnC9TTLO6oLRqrvhE1zp/INLhqqw6Mg=
In-Reply-To: <09084388150B46A2B74F745A8E1272DA@main>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sheepa <sheepa@sheepa.org>
Cc: netfilter@vger.kernel.org

On Thu, Mar 11, 2010 at 6:12 AM, Sheepa <sheepa@sheepa.org> wrote:
> Hello, im trying to redirect a port based in source ip like this:
> iptables -t nat -A PREROUTING -p udp --dport 777 -j REDIRECT --to-por=
t 888
> -s x.x.x.x
>
> Notice that i will have services listening on both ports. Allthough t=
his
> works it takes several minutes for it to take effect. And it doesn't =
seem to
> take effect at all if i keep sending packages to port 777 here in the
> example. How can i make it take effect instantly? Or is thier any oth=
er way
> of doing this (redirecting a port locally) on a debian squeeze machin=
e?
>
> Thanks,
> Sheepa --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

I had similar problem . I was syn-flooding one interface and  there is
an iptable rule to  reject all  syn-flood . But while flooding
,eventhough i opened port , ( in my case ) packets are not flowing
=2E...it is still getting dropped . I thought ,it could be a problem du=
e
to resource constrain in my box ( small ram , little processor speed )
=2E


Even if packets are dropped , will there be conntrack entry for those p=
ackets ?
