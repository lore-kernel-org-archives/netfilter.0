From: ajay seshadri <seshajay@gmail.com>
Subject: Query regarding NAPT using iptables
Date: Wed, 9 Mar 2011 09:44:13 -0500
Message-ID: <AANLkTimzU-oTUTyc657SsRpzcTNkA_fnwqGfWmvegxpb@mail.gmail.com>
References: <AANLkTimsWbnXpVn0BCCJmTe7_dM4KPhTK6hxzbMA33P-@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type:content-transfer-encoding;
        bh=BFOEQO/a88E/OP/OzmAc+QsHkYNzapMvQ2akPXr3+xs=;
        b=eXMqB0F8cGeyuP/ZIbH7wi5/Tp0oFulTn1rIGkkxlteVdDITskvqyeEqkHDs6GkHY0
         uNxzOF8siReas7EtBLhvRWS6zoyacrcU7xvaSg2oGmUboo5FiimQuCSso4i9nmzqHT+w
         BsKpi1zyk7e0b3sQm4pgY8S8/Nu//MQj3xu6s=
In-Reply-To: <AANLkTimsWbnXpVn0BCCJmTe7_dM4KPhTK6hxzbMA33P-@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi all,

I was trying to write some iptables rules to perform NAPT. I had the
following doubts:

1. When I specified the following rule:

>sudo iptables -t nat -A POSTROUTING -d 10.20.3.81 -j SNAT --to 10.19.1=
1.1:1-500 I got the following error:-=A0 iptables v1.4.4: Need TCP, UDP=
, SCTP or DCCP with port specification.

Is there anyway to specify a single rule to cover all the protocols? I
got the same error when i specified '-p 0'. Are there any protocols
that don't work with NAPT?

2. Would NAPT work in case of application layer protocols like FTP,
where the application code requires port numbers? I came across ALG
and conntrack modules. I don't really have clarity in this regard to
know if there are any application layer protocols that would fail to
work with NAPT. If yes, is there anyway to get around this?

3. If I am not mistaken the NAT RFC states that NAPT won't work if the
packets are already segmented as the segments don't contain port
information. Is there anyway to get around this? Also, are there any
such scenarios where NAPT would fail?

4. If NAT is done instead of NAPT, by specifying a one - to - one
mapping for each flow using iptables, does that guarantee that port
multiplexing will not be used?=A0 Is NATing more stable that NAPT?


Thanks,
Ajay
