From: Mario Vittorio Guenzi <jclark@tiscali.it>
Subject: Re: Grammar in a bash script
Date: Tue, 18 Aug 2020 12:28:04 +0200
Message-ID: <cbfbba54-0bc0-5076-6009-e6b8c4f0da9d@tiscali.it>
References: <74c7c496-2429-8646-6c1a-9454169498ac@tiscali.it>
 <20200817085658.GA3677@salvia>
 <3e973ae0-55aa-eabb-adb2-9af5f2bea500@tiscali.it>
 <20200818101125.GA10691@salvia>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="9Sr1uC05J7dTZsNAjtLFDbOa5oFmLtfN9"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200818101125.GA10691@salvia>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tiscali.it; s=smtp;
        t=1597746491; bh=KR1GHKeoMPtVexkhlT0zW6MgX0p+nHSzgRBMXIqV1r8=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=PWhIkvvgf9YT8Gm+TzoZ3KhaOwi1L9ZoFgbOUvSvi3MGnZNgutYQxhSQEtNCy5VRy
         V7coKH2WCuaTf7lLBdu07ILSRdSCLo/BFoI8b9Jo5N/mQBX9weZTE7Kp/G4wyY1slR
         W1G3Xlnr0j3LeaQd92laABpmwUU1z6+Y4MINdTwM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Netfilter list <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9Sr1uC05J7dTZsNAjtLFDbOa5oFmLtfN9
Content-Type: multipart/mixed; boundary="0Hjw3Re9RZEdpveVgdnTMnH6pswL5cNaR"

--0Hjw3Re9RZEdpveVgdnTMnH6pswL5cNaR
Content-Type: text/plain; charset=utf-8
Content-Language: it
Content-Transfer-Encoding: quoted-printable



Il 18/08/20 12:11, Pablo Neira Ayuso ha scritto:
> On Tue, Aug 18, 2020 at 07:12:38AM +0200, Mario V Guenzi wrote:
>> Il 17/08/20 10:56, Pablo Neira Ayuso ha scritto:
>>> Hi,
>>
>>> You can set default policy to drop wehn defining the chain (in the
>>> same go), no need to call it twice, my suggestion for your ruleset is=

>>> to place this in ruleset.nft:
>>>
>>> add table inet firewall
>>> add table inet nat
>>> add table netdev noddos
>>>
>>> add chain inet firewall INPUT { type filter hook input priority 0; po=
licy drop; }
>>> add chain inet firewall OUTPUT { type filter hook output priority 0; =
policy drop; }
>>> add chain inet firewall FORWARD { type filter hook forward priority 0=
; policy drop; }
>>> ...
>>>
>>> my rules
>>> my rules
>>> my rules
>>>
>>
>> At first many thanks.
>> another question given your kindness,
>> I can use bash only to define my variables eg
>> EXTIF =3D "eth0"
>> LAN =3D "192.168.2.0/24"
>> etc
>> use the variables defined in writing the rules.nft file as per your
>> example and then write
>> nft -f /path/rules.nft in my bash script?
>=20
> You can define variables in nftables, e.g.
>=20
>   define EXTIF =3D "eth0"
>=20
>   add rule inet firewall INPUT iifname $EXTIF accept
>=20
Again Thank You.
Yes I have read about, but for my convenience I do take the IPs with
command and do not believe that nft can execute it.
This are my variables You can see how take IP from eth

NFT=3D"`whereis -b nft | cut -d \" \" -f 2`"
EXTIF=3D"eth0"  ## word interface
INTIF=3D"eth1" ## lan interface
VPNIF=3D"eth0:0"
LO=3D"lo"
LO_IP=3D"127.0.0.1"
LAN=3D"192.168.2.0/23" #our lan
BCAST=3D"192.168.3.255"
EXTIP=3D`ifconfig $EXTIF | awk '$1 =3D=3D "inet" { print $2 }'`
INTIP=3D`ifconfig $INTIF | awk '$1 =3D=3D "inet" { print $2 }'`
VPNIP=3D`ifconfig $VPNIF | awk '$1 =3D=3D "inet" { print $2 }'`
CHIMERA=3D"192.168.2.224"
GRECALE=3D"192.168.2.251"
PERSEO=3D"192.168.2.240"
STROMBOLI=3D"192.168.2.232"
RESERVED_NET=3D"0.0.0.0/8, 1.0.0.0/8, 2.0.0.0/8, 10.0.0.0/8,
100.64.0.0/10, 127.0.0.0/16, 169.254.0.0/16, 172.16.0.0/12, \
192.0.0.0/24, 192.0.2.0/24, 192.168.0.0/16, 198.18.0.0/15,
198.51.100.0/24, 203.0.113.0/24, 224.0.0.0/4, 240.0.0.0/5"
GOOD_BOYS=3D"2.233.119.3, 88.149.179.177, 81.208.25.146, 82.85.80.100"



--=20

Mario Vittorio Guenzi
E-mail jclark@tiscali.it
Si vis pacem, para bellum


--0Hjw3Re9RZEdpveVgdnTMnH6pswL5cNaR--

--9Sr1uC05J7dTZsNAjtLFDbOa5oFmLtfN9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTq04Bmf6EVqIWOKVubqqzVmQ2sigUCXzutNAAKCRCbqqzVmQ2s
iul7AJ9e8V/mBuirse3pbXClIkqSm2miPgCfY67S+dQZi/Rj9PYGBT+ttBzLKWk=
=fV/S
-----END PGP SIGNATURE-----

--9Sr1uC05J7dTZsNAjtLFDbOa5oFmLtfN9--
