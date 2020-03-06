From: Glen Huang <heyhgl@gmail.com>
Subject: Why inet table doesn't support nat prerouting chain?
Date: Fri, 6 Mar 2020 19:32:49 +0800
Message-ID: <DF324CE0-08D5-4041-9761-D7F740979715@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:content-transfer-encoding:mime-version:subject
         :message-id:date:to;
        bh=r65ehidzkIJnA1yQUxC/vIfLp9lrNOyntlFAbRWWjlk=;
        b=O7fu1dG8+wAnv/851cdB28K0vCIhq24Q9Wto5Le5vEk2WnL4os3c1Cm0K/0aWUIzUK
         24HxjAvHTxR/TLoRvZztHNIpslBoArneVWvD0t/wlKzLk8AndyoJDdfMGDmbCRRvS2NO
         WljNsy0rcg+ZPwic5bf9eKiNh4qr7i7D//gms5/1FlKruQ7S6PQ/rOHBp9QPw7cFV3g/
         5Qj8f13GUhyyZxAA00phJe0fSoiFDokCYdTFH0CTrdvqR9HOYG/GKp0tSEUtOxF3qMzy
         6Q0K0CiJjS09oB5zk+Yf0pTTGOKOtVRLsSTAD9WRyM3XfhnTyBe64A298PZM0aIkrqdJ
         WRew==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,

It seems I can create a nat prerouting chain in either ip or ip6 table, =
but not inet, I wonder if that=E2=80=99s by design?

$ nft list ruleset
<empty output>
$ nft create table inet tbl
<empty output>
$ nft add chain inet tbl prerouting \{ type nat hook prerouting priority =
dstnat \; \}
Error: Could not process rule: No such file or directory
add chain inet tbl prerouting { type nat hook prerouting priority dstnat =
; }
=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^
$ nft list ruleset
table inet tbl {
}

If I replace inet with ip or ip6 then the previous commands work.

I tried them in docker with manually compiled nft 0.9.3, and also in =
debian 10.3 which has nft 0.9.0 (it doesn=E2=80=99t recognize dstnat, =
but replacing it with 0 results in the same error).

Do I have to create such chains separately for ip and ip6 tables?

Regards=
