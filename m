From: Ajith Adapa <adapa.ajith@gmail.com>
Subject: Regarding iptable rules for SNAT
Date: Tue, 18 Oct 2011 09:12:53 +0530
Message-ID: <CADAe=+Lo46K956EAdtBchVUPkLs-aLoDk7p8HGC5-Bd4PGKy3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=0YlYNQp+3CQZ3BsU7UoUfMwVpficT0+KeqzWQY2O2jc=;
        b=Be7yNrGiP75PZFAyQTmr5UmMa68KRd5h1eCBhNaSJnyN3ZlrfnUucRRTZ6dF3YYjHo
         FdnDdAmiJ8RKxGRCO7fOwD5DyCU0NyRm+9s2fYGJCiXiVW5lxavEFgJ+6cLujz4plkoO
         Gs+/FQlk2CQ3Vg1P0cZePXLnkNvdKrYmwqPow=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

I have a following setup. GW eth1 (private ip) is connected to the ISP
router. For host H1 I have set the DNS server as 10.12.3.10.

H1 (eth0) --- (eth0) GW (eth1) ---
H1 eth0 =3D 192.168.1.2
GW eth0 =3D 192.168.1.1
GW eth1 =3D 10.12.3.12
DNS =3D 10.12.3.10

I have added a rule in GW saying iptables -A POSTROUTING=C2=A0-t nat -o
eth1 -j MASQUERADE

Now when I am trying to access internet from host H1, DNS queries are
being sent to 10.12.3.10 which are masqueraded in GW. Once replies
come back from DNS server then GW is replying back to DNS server with
icmp destination unreachable.

Ideal cases once the reply comes back GW has to send it to the host H1 =
right ?

Sorry if I am wrong or missed any steps down here ?

Regards,
Ajith
