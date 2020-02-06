From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables v0.9.2 | kernel 4.19.93] does redirect accept daddr?
Date: Thu, 6 Feb 2020 02:01:39 +0000
Message-ID: <d7f31893-feaa-e138-ad80-95a37d275e7b@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1580954499;
        bh=4FurrcyuNxRvov4oLWx5gQi/qcFt6Zf2JiF4RdknneU=;
        h=X-UI-Sender-Class:Reply-To:From:Subject:To:Date;
        b=bbaeXw5H/bDCvdAPC6SeWtzSL9tUCJp28svKvS8Hu9h451wPYbqkwUFECdTzTT2M4
         HbFUNZgW7EnwaG66ArefqzMClpRG/4PUciWoTDw1fzarQtzahO1+uYwGCVD0slWID3
         Hq++A43rWvEw4OjB49drGO2keoPrB/zH6Q4ojS38=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

The aim is to prevent DNS query hijacking (e.g. as Android tries)

table nat {
 =C2=A0=C2=A0=C2=A0 chain prerouting=C2=A0=C2=A0=C2=A0 { oif br-lan ip da=
ddr !=3D 192.168.112.12 udp=20
dport 53 redirect to ip daddr 192.168.112.12;=C2=A0 }
}

hooks/prio is otherwise defined but it prints this ominous error:

Error: syntax error, unexpected semicolon

Removing the offending semicolon it then prints:

Error: syntax error, unexpected newline

It is a bit difficult to understand what the issue really is.

----

Alternatively, this

table nat {
 =C2=A0=C2=A0=C2=A0 chain prerouting=C2=A0=C2=A0=C2=A0 {=C2=A0 oif br-lan=
 ip daddr !=3D 192.168.112.12 udp=20
dport 53 ip daddr set 192.168.112.12; }
}

or a bit shorter even

table nat {
 =C2=A0=C2=A0=C2=A0 chain prerouting=C2=A0=C2=A0=C2=A0 {=C2=A0 oif br-lan=
 ip daddr !=3D 192.168.112.12 udp=20
dport 53 ip daddr 192.168.112.12; }
}

does not throw an error but I am not sure whether that achieves the in=20
the context of the table?

