From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Reload IPtables
Date: Sun, 27 Jun 2021 19:11:07 +0100
Message-ID: <20210627191107.79ca63b9cf4dfe9028649524@plushkava.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
        <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
        <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
        <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
        <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
        <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        Xx0feDlhQ/Zy3wu+ChppLmqiUIeV3j3M49m3qmoCVVw=; b=Jfd+0MuRPq0IAhep
        KYOK7tuQb94KkAQ5yweTtgF0en16rBEqPupGDf9XcTGVSYjQ1ymsDcGEwKDbez9X
        0mAjKOtauwsnAjKGJY73Mx9/xwgSuvHo/D9BtLeonD4G02l50mF5fRuu45fYNmz3
        2Rc7k7Ucty7qeaD1vdoJfTbxkKE12+91eN9qoUsqlMKnJT7Nqed6CsQXehtb37JH
        eXDmElbehpTwdvHKiavbsXcGRQiSmm76E67UsbE2eH6pw2wbZXDAifEmz0kKrLTY
        DOlzh1oR9nprcf+Xby8tv+J88E1fiXHH3cRqu1JCNPqIqOQcsJAPijpALPsXYcIE
        8AZR9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=Xx0feDlhQ/Zy3wu+ChppLmqiUIeV3j3M49m3qmoCV
        Vw=; b=mZrMO7cs98cyUVf+hVkEez2NRFpgn/YJAAxwniXZYofYSejtQWflkyYPW
        XMgg270ycQKxnQTK+TwZYStoYyaX2TXLXUSc1JcyNDFZw3xs0ATYUylSzvo0XqhW
        kJsi9j8GXHcOtukT+Vq8NBZACCBTE0PciNfYN4l9wGYzI+93qCCyZiw9Ytzp2qWU
        /j89VxCBOwKKs7dSAhbMo/MJS9vkz56KEMgGJiAJtQ/4mNbEch3fzZLiFiJiAYjF
        j2xyuZAyi7+CvFanmt8ctIWSdU3KFBHeZ76wmlI7bUrasIHc305tNdzRrBqvmUyb
        WpAMvJV7CPU68NUCUug2ivFpo8nGw==
In-Reply-To: <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: slow_speed@att.net
Cc: netfilter@vger.kernel.org

On Fri, 25 Jun 2021 19:47:02 -0400
slow_speed@att.net wrote:

> Yes, that was exactly my initial question.=A0 I couldn't agree more.
>=20
> The issue was knowing the correct command to use force the reload. I=20
> remain unclear on that if my files are in either /etc/iptables.up.rules=20
> or /etc/iptables/rules.v4.

Debian offers an iptables-persistent package which, if installed, will prov=
ide a plugin for their netfilter-persistent package. In turn, that implemen=
ts a pseudo-service that is capable of automatically loading iptables rules=
 from "/etc/iptables/rules.v4" upon being started, and saving them there up=
on being stopped. It does so by executing iptables-restore(8) and iptables-=
save(8) behind the scenes and the decision to use this particular location =
is an arbitrary one made by the Debian maintainers. As for "/etc/iptables.u=
p.rules", it has no significance beyond serving as one example of how to ma=
nually deal with ruleset persistence, as far as the author of the https://w=
iki.debian.org/iptables article is concerned.

So, if you needed to manually (re)load an iptables ruleset that had previou=
sly been saved through the use of the iptables-persistent plugin, you might=
 run `iptables-restore /etc/iptables/rules.v4` but it would probably be wis=
er to run `netfilter-persistent start` instead. For further information, re=
fer to the netfilter-persistent(8) man page. On the other hand, should you =
choose not to use iptables-persistent, the decision of where exactly to sav=
e rulesets is yours to make. If in doubt, observe the conventions chosen by=
 your distribution.

--=20
Kerin Millar
