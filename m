From: Martin Zaharinov <micron10@gmail.com>
Subject: [nft] src: allow for updating devices on existing netdev chain - Test
 result
Date: Fri, 6 Jan 2023 17:17:51 +0200
Message-ID: <DD658C3B-2FB9-451E-893C-EE37ABDC678A@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qL2BhxVV1ZdfqOKMX4Hspp3iBL8W+UuUVwHvZ9bz4EU=;
        b=KHkjNFja+ezKQftN/wV81Q5xig0Atq0GR221LtmMaGRbDbYwOjExgnSEvANL94BSE8
         BDUrb6Dvhxtf379WR2tDuX5Ot+NqMgSTSZ8tkEjwcd8A7lJSZtEPiLhdocUw8bOkYP9u
         43tPtzE2Uctf4F4CFDb4tCYJKAjRVIfwJW8H/XgknaAoAlNq6g/IT7RuPglT+mGVxkhG
         iI4BGdZEXfEH5ZoWRIhpfisyLC/XbxHyHclb8MRCnDXk+VMRO4nHd1X52t0RmUdwHQ1n
         t6/TXYJpb+CzBM6cm+WARBMVe/qiKLbs1hChdliG+EdULD/supg3uENRzmoWfSDWjZuK
         pj9w==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: 20230106010251.27038-1-pablo@netfilter.org, pablo@netfilter.org, netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org

Hi Pablo

Patch look good and work but in my test after try to add ppp0 on over =
chain 1024 receive : Error: Could not process rule: Argument list too =
long


Test is make like this :


create chain :

for i in `seq 2 9999`; do nft create chain netdev x int$i \{ type filter =
hook egress priority -500\; policy accept\; \}; done


after that add device:=20

for i in `seq 2 9999`; do nft add chain netdev qos int$i '{ devices =3D =
{ ppp0 }; }'; done


when reach int1023 all is fine but in next 1024 receive this error .

change device from ppp0 to eth0 add device on int1024.

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94

And one more when run add device line this for 1023 line added for 30 =
sec

Is there options to optimize little more.


Best regards,
Martin=
