From: vishesh kumar <linuxtovishesh@gmail.com>
Subject: Re: About lxc and libnetfilter_queue
Date: Tue, 19 Oct 2010 17:43:12 +0530
Message-ID: <AANLkTinwzuUOq2W19Nu=QUuBnRAtUATFx7kZBQEHxsxU@mail.gmail.com>
References: <AANLkTikytEZUNH9DRT-tAmuNy2-XwNZVgz6u4LggdR5Z@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=y9fjjFIJA0NUs41c/+RipJ7eh1BVGkyvEOCHgygLqm8=;
        b=urWuEaGFjSppeT9RG+5bS+ItdS+iSaPIJ1Izw/tuZ6jH2zQj2FeyY+3nZ9FIac9OAC
         BRzZOX2f/P1E72zkI4C9F7HOM9xGBHAxeq1sQ2lnzUnd5NhL6l2NC9t3TJVTc9YZ8Tt3
         73hJshyolAL/GwZPKAt35Vi6j4n3Z5uJ470VM=
In-Reply-To: <AANLkTikytEZUNH9DRT-tAmuNy2-XwNZVgz6u4LggdR5Z@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?5ZGo5aiB5bu3?= <richard925215@gmail.com>
Cc: netfilter@vger.kernel.org

dear richard,
 i also need same but unable to achieve. Please share with me if you
got any solution.

Thanks


On 10/11/10, =E5=91=A8=E5=A8=81=E5=BB=B7 <richard925215@gmail.com> wrot=
e:
> Hi every body,
>
> I'm a newbie to netfilter_queue use.
>
> I set up a VM by lxc and installed the libnetfilter_queue on it tryin=
g
> to forward the packets to the guest userspace, but it didn't work.
> Do anyone else has been try this way before or had a similar experien=
ce?
>
> I followed the website below to set up my container.
>
> http://en.opensuse.org/LXC
>
> All libnetfilter_queue related libraries installed by zypper, as
> the following commands.
>
> $ zypper in libnfnetlink-devel libnfnetlink0
> $ zypper in libnetfilter_queue-devel libnetfilter_queue1
>
> I really appreciate for someone who can help me to deal with this pro=
blem.
>
> thanks,
> Richard
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--=20
http://linuxinterviews.blogspot.com
