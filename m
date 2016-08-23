From: Yamakaky <yamakaky@yamaworld.fr>
Subject: Add element in set when element already present.
Date: Tue, 23 Aug 2016 18:53:32 +0200
Message-ID: <cd5537f9-20fa-67ff-fd33-d4d8c6b55b9f@yamaworld.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
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
