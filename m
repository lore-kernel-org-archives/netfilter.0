From: =?UTF-8?Q?Lars_Nood=c3=a9n?= <lars.nooden@gmx.com>
Subject: Resetting the timeout counter for a named set element?
Date: Wed, 7 Jun 2023 18:10:25 +0300
Message-ID: <0ed31677-f634-1494-ccf1-1dd60a31a518@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
 s=s31663417; t=1686150626; x=1686755426; i=lars.nooden@gmx.com;
 bh=DOQXFcpFuicJu+koGVjFYKXvUereo/005T/zA4+Ie7M=;
 h=X-UI-Sender-Class:Date:To:From:Subject;
 b=kN06mMP9ZgBB1ggfSdkBijgqhz0/oHuS7dyCHPB4+DsxVhxnjYPTqRUhCpzEYemT00Udkw8
 xHN1ztCQ7ObY7pm1EgXhZZGh6KKGhh3CQa5SfN/nMNc42DUp4Bm1T+wDH725eTycTV3n+SDkR
 GvaKOy79OhzOPsxH1NFKNN6KGnjl4dXtvxnJns67rAg3RbAVp/B7nNeu3i3/EHgqkGjSYUq6E
 a+/iQRItjCJmTcOZiuPhr9hnIr+PWMh9Haxudx3baLnb0nwT/bTxWCMXOxbTxxjJ7mC3snrb0
 XN7415tlJc9OqLzqP027e9TZvd8YkRNIWd2GVCliv2A7Fd783Rng==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

Hello,

I am looking for some clarification to what is already in the wiki
regarding the timeout=C2=B9 of elements in named sets.

1) Is there a way to reset time timeout counter so that the set can be
told to extend the lifetime of a particular element?   If so would
attempting to re-add the same element to the named set do that?

2) Also, how does timeout fit in with gc-interval?

Thanks,
/Lars

=C2=B9
https://wiki.nftables.org/wiki-nftables/index.php/Sets#Named_sets_specific=
ations
