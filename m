From: Pyry Kontio <pyry.kontio@drasa.eu>
Subject: Is the concept of BROUTING deprecated and what is the modern alternative?
Date: Mon, 14 Sep 2020 19:07:20 +0900
Message-ID: <CACS8yHK7=_Xvjy9J30CLjGrLN__xu7mezpyQVQEikbqTLOtaNw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=drasa-eu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=xjfhtb+4ghTT8EatPv3ztsJGAl5hPgng6zBViICbSZo=;
        b=Q6bBwMsg+usyeY8qG83MtPVy6UYPRFU58yJJT1FSf6rDomH5JDydcmWEFKqMtA/oya
         wIJP5Z6RcZF39lcQO3ymUS6PN0G/cgTff+G1Q8ebO8u6nE3izwAKy2Og+Iqfg810wzUi
         Pv5cDkGJD7QJb2QuZbHf5VfcM2BqapzhoiUlP7RUd/TuMk9Ymw2LhaPYRMzjDqJrq/WW
         5/Nt+9U1HylLooNqDan35HF/F2Mw8+bWHSgKoQmsTJXavHRUkJ7mwajli6gnhlUa4xVp
         EkNhhhNiIYNjdgY9d7TG8Bza9LDh923PE54haqR+Etat00JoFVh4r41psdj/3JH966jo
         x+Iw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I set up a software bridge, and according to the Arch wiki[1] and the old
ebtables website[2], I could set up BROUTING settings for speeding up
traffic to the bridge itself. However, my experience made me doubt if
I'm supposed to do that:

# ebtables -V
ebtables 1.8.4 (nf_tables)

# ebtables -t broute -L
ebtables v1.8.4 (nf_tables): table `broute' is incompatible, use 'nft' tool.

# ebtables-legacy -V # (I think this is a NixOS package for the pre
nftable tools)
ebtables v2.0.11 (legacy) (December 2011)

# ebtables-legacy -t broute -L
Bridge table: broute

Bridge chain: BROUTING, entries: 0, policy: ACCEPT

So, with the legacy version seemingly working:

# ebtables-legacy -t broute -A BROUTING -d 92:12:1f:09:e4:a5 -j
redirect --redirect-target DROP

But this made me lose all my connectivity, which fortunately returned
immediately after deleting the rule.

I also couldn't find any mentions about "brouting" in the nftables wiki,
or on this mailing list, after the year 2007.

So, is brouting a thing anymore? Am I not supposed to do it? Is there
a modern alternative?

[1]: https://wiki.archlinux.org/index.php/Network_bridge#Speeding_up_traffic_destinated_to_the_bridge_itself
[2]: http://ebtables.netfilter.org/examples/basic.html#ex_speed

With kind regards,
Pyry Kontio
