From: =?UTF-8?Q?Mika=c3=abl_Fourrier?= <mikael.fourrier@laposte.net>
Subject: Add element in set when element already present.
Date: Wed, 6 Apr 2016 13:22:09 +0200
Message-ID: <704aee2d-ebe7-6a77-0848-b2d3ae614805@laposte.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=mail1;
	t=1459941731; bh=hlg/f8lDmUedV8ij1YLhzB6e2qR3qZBNsVe2mKGBCFQ=;
	h=To:From:Subject:Date;
	b=Un8/rba/1hpYeRXknhUnAmr8Zh2xjGqF3Apnsobv/snrnc02mjNdaljxFt1TAsS5o
	 ylqIpNHOzSWqqKivufzH63DK5Erv7yTlV2amksO+6952uyxZk+bsCSP+O1j6xh6/zC
	 koEKA8uJt0Wm6VN8fRFdhCx+NLkIlzLp1NQBoy7xvoMdVln3Qn0fwb6sklAg/Pfn/3
	 xmlIezCP94zmNT+G3HeCnBhLEhMacdrNe5r1M7fVYJ8bdBcU4Voc43tJAZ7crq7X/4
	 kbGH8bq0UFIHQwzyAVPfKAA9nX0Aq0+cGjcxlzRUYfRpSKVEE30y8NnuKnBG1mrQ6c
	 S0+Ab53GiUm/g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

When I add an element in a set and the set already contains the element=
,=20
the command fails with an error. Worse: I try to add multiple elements=20
and at least one of these elements is already in the set, the command=20
fails without adding any element. Why do you use this semantic? It woul=
d=20
be more ergonomic if you could just add elements in a set without=20
checking its content.

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
