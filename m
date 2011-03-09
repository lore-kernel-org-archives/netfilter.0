From: ajay seshadri <seshajay@gmail.com>
Subject: Query regarding NAPT using iptables
Date: Tue, 8 Mar 2011 21:38:59 -0500
Message-ID: <AANLkTimsWbnXpVn0BCCJmTe7_dM4KPhTK6hxzbMA33P-@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=BFOEQO/a88E/OP/OzmAc+QsHkYNzapMvQ2akPXr3+xs=;
        b=x7N1RJhkewPSc8fsiMX/XJsyxNZ/IKLv2mm98N4Ax+f7d3C5iS6vSY5Q7cjG/t+s6S
         lbtv5xhnqk+5s4QqZvG2wNacwJ+W0Zka9Ut/APvLwyWtOA5jVpiAFDgEpB0Z/Tj9vRXb
         Be2atvjcVaIWnSEl5AXY5OzhNdHMDVlinL2tA=
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
