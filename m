From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: sync flood and resource utilization .
Date: Sat, 27 Feb 2010 17:40:44 +0530
Message-ID: <cfeab66d1002270410h4d032809necdef990a3a31cad@mail.gmail.com>
References: <cfeab66d1002262135x419e1009w8358c8c7f4def7cf@mail.gmail.com>
	 <1267254540.12006.10.camel@kushiel.sterenborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=hQJgL50UA3GXf0/cfQhVDn4xIQn+OUwIbIt85GzTqYs=;
        b=ZLqI/rjRk3WdhGGFEB8Sm7hOW6+MGv4tkZLYxVEAQwSA2zWzmaU3KYRA3FX74vprIp
         QSaD4BeCqR8sMZDThWX6MjfktKu8gt43xN6/S6Y3STfdxm8/0ThfoNG9/dj7kpohS8JF
         gXmbcQmRGXE25kdJ0mX+WqxKJHkWLTGolI1CE=
In-Reply-To: <1267254540.12006.10.camel@kushiel.sterenborg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: lists@sterenborg.info
Cc: netfilter@vger.kernel.org

since i am dropping all sync packets , there wont be any connection
ins SYNC ACCEPT state ( netstat ) .



On Sat, Feb 27, 2010 at 12:39 PM,  <lists@sterenborg.info> wrote:
> On Sat, 2010-02-27 at 11:05 +0530, ratheesh k wrote:
>> iptables -A INPUT -j =A0DROP .
>> iptables -A OUTPUT -j ACCEPT
>>
>> When i syn flooded my desktop . I can see all pkts are getting
>> rejected by the rule . But system becomes slow beacuse of this . Is
>> there any way to make system fast ? will black listing will help ?
>
> IIRC syn_cookies were meant to deal with that.
>
> echo 1 > /proc/sys/net/ipv4/tcp_syncookies
>
> http://www.securityfocus.com/infocus/1729
> http://www.unixresources.net/linux/lf/57/archive/00/00/09/85/98546.ht=
ml
>
>
> --
> Rob
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
