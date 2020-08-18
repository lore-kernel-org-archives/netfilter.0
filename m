From: A L <mail@lechevalier.se>
Subject: Re: Grammar in a bash script
Date: Tue, 18 Aug 2020 12:04:55 +0200 (GMT+02:00)
Message-ID: <fccf67a.867cd46.17401076470@lechevalier.se>
References: <74c7c496-2429-8646-6c1a-9454169498ac@tiscali.it> <20200817085658.GA3677@salvia> <3e973ae0-55aa-eabb-adb2-9af5f2bea500@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lechevalier.se; s=20191106;
        h=content-transfer-encoding:content-type:mime-version:subject:references:
         in-reply-to:message-id:to:from:date:from;
        bh=uqLHkzJt2v0FJCSqZ84F/dF+z8AryjgCGggapk4UdEc=;
        b=TcPyCtU7NxjJ0RqqWAg5gxNA4Y6xn5Sk/oRKooSOkzAu1dW6QFUR1h7blPXNllgFemIPNgYVEiMIY
         AX1icoJ2mEeASJmpG+oxSsVUcumGwVhia5+RlSxLidaEFPtEn12M7y+SBDUI8ZHZzGzLm9+JZjwLTS
         UPan6jLgTjGzhCWEtYA9rpHeRUt1AIp+o0ss7Uh/Y1jq1iQ1vWVpA+oD0xJ9WtY0vLQ4D7575RaQN1
         v0irQ8PRr0uyq+Uwl7twOoiF59Tt/UJ8Rvw8SbN7gn22rL5CS4MLtEYx8Y1SGTHqNBBrEFDfSQZCLP
         oCQVQYBPjxpDneyHJF4EseYn8Wdf/vQ==
In-Reply-To: <3e973ae0-55aa-eabb-adb2-9af5f2bea500@tiscali.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mario V Guenzi <jclark@tiscali.it>, Netfilter list <netfilter@vger.kernel.org>

Hi,

I'm not using nft yet myself, but I do use bash scripting with iptables. Wh=
at I to is that the bash script generates a iptables-save file which it sub=
mits at the end. This way I think it is atomic. Shouldn't it be possible to=
 do the same with nft?=20

Regards

---- From: Mario V Guenzi <jclark@tiscali.it> -- Sent: 2020-08-18 - 07:12 -=
---

> Il 17/08/20 10:56, Pablo Neira Ayuso ha scritto:
>> Hi,
>=20
>> You can set default policy to drop wehn defining the chain (in the
>> same go), no need to call it twice, my suggestion for your ruleset is
>> to place this in ruleset.nft:
>>=20
>> add table inet firewall
>> add table inet nat
>> add table netdev noddos
>>=20
>> add chain inet firewall INPUT { type filter hook input priority 0; polic=
y drop; }
>> add chain inet firewall OUTPUT { type filter hook output priority 0; pol=
icy drop; }
>> add chain inet firewall FORWARD { type filter hook forward priority 0; p=
olicy drop; }
>> ...
>>=20
>> my rules
>> my rules
>> my rules
>>=20
>=20
> At first many thanks.
> another question given your kindness,
> I can use bash only to define my variables eg
> EXTIF =3D "eth0"
> LAN =3D "192.168.2.0/24"
> etc
> use the variables defined in writing the rules.nft file as per your
> example and then write
> nft -f /path/rules.nft in my bash script?
> as usual I apologize for my terrible English.
>=20


