From: Andrei Moraru <matagou@gmail.com>
Subject: tc doesn't shape correctly -->> iproute2-latest + iptables 1.4.3.2 
	+linux-kernel 2.6.29.4 + imq support
Date: Thu, 8 Oct 2009 16:49:51 +0300
Message-ID: <2f88d4dd0910080649p21768c82k5a81292bb6013c88@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=j4GQvEbUv7hanA2apRsgrP9EKuGu7cQuqw8XVvbP8n0=;
        b=AxSUERB/Lhst4otOOVS53JJyZtaC45mScxEs6+/Rh05L6bf42NLpaxyh5AtoAucHD/
         UyYazG8IQr/mj9BAPau9TZgphZLLzrgYCIWNmCrbQJGFLk2lMd2l9Nbkg5TRlAMckoTl
         scnFcf9438rtC7cNFzGRHJbILpkffJi0bxH0o=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello
I am running a Linux gateway, with details written in title.
The kernel is patched for imq support.
The gateway has 2 interfaces, eth0 --> ISP, , eth1 -->LAN.
Also there w virtual devices, imq0 atached to eth0 for download from
the world, , imq1 atached to eth1 for upload from the LAN.
I have a problem with traffic shaping:
1) the ceil value for the root class atached to imq0 is not respected;
currently the ceil value is 3200 kbits but the bandwitdh goes near
3700 kbits.
Some details of my system that might be helpful:
CONFIG_HZ=3D1000
net.ipv4.netfilter.ip_conntrack_max =3D 262140
The discipline for queueing is HFSC.
Best regards,
=A0 matagou
