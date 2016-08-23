From: =?UTF-8?Q?Mika=c3=abl_Fourrier?= <mikael.fourrier@laposte.net>
Subject: Add element in set when element already present.
Date: Tue, 23 Aug 2016 18:51:32 +0200
Message-ID: <e145e82f-0b0f-50df-c9ce-d1c2446f9543@laposte.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=mail0;
        t=1471971092; bh=zzBDm8NXYDnvfTzpqxW4jIaUr3PgqU2HB44RRDh8Rzs=;
        h=To:From:Subject:Date;
        b=WjBkqir3KxH+wHozC5zDkScwUJmbflJwabHPylo0WckqqxIfSV4XP0qxC/0oBQArD
         6DpViE95seIGRYO34VJ2J0XEZb9fqsciQzlFhHRg1wVyGIBDUhMgz+G/6W+XuBZv1e
         mH2Xa8PNINPASnDMJN3aR9uiHEt6W8l6E+5WbFZAtot6pPzRluzFqCD9uZ67sxWJid
         DoPIWfU6g5KbbsXDqe/iJi4Hxflo3SXUBmwhiyA/uE+CdxJPKv+dxdG/o8VxE9e3pw
         XG+GMhd7HblIk2HfX7yTeed6Y+WCa88EpT9mmc5cFUH3MjQ7elTd4HzkfqbxPFzaUr
         ZkpDrLfaNoqog==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

When I add an element in a set (same with maps) and the set already=20
contains the element, the command fails with an error. Worse: I try to=20
add multiple elements and at least one of these elements is already in=20
the set, the command fails without adding any element. Why do you use=20
this semantic? It would be more ergonomic if you could just add elements=20
in a set without checking its content.

Have a good day,
Mika=C3=ABl



Example:

```
# nft add set inet filter myset '{ type ipv4_addr; }'

# nft add element inet filter myset '{ 0.0.0.0 }'

# nft add element inet filter myset '{ 0.0.0.0 }'
<cmdline>:1:1-41: Error: Could not process rule: File exists
add element inet filter myset { 0.0.0.0 }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

# nft add element inet filter myset '{ 0.0.0.0, 1.1.1.1 }'
<cmdline>:1:1-50: Error: Could not process rule: File exists
add element inet filter myset { 0.0.0.0, 1.1.1.1 }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

# nft list set inet filter myset
     set myset {
         type ipv4_addr
         elements =3D { 0.0.0.0}
     }

```

Expected: no error and the set contains { 0.0.0.0, 1.1.1.1}.
