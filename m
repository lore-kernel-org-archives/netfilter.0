From: Joerg Dorchain <joerg@dorchain.net>
Subject: Re: conntrack_sip messages showing up in 2.6.32
Date: Tue, 15 Dec 2009 12:24:18 +0100
Message-ID: <20091215112418.GB5634@Redstar.dorchain.net>
References: <20091210151923.GT5634@Redstar.dorchain.net>
 <4B261F8F.9090806@trash.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qySB1iFW++5nzUxH"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorchain.net;
	s=redstar; t=1260876259;
	bh=c7mNLwBc/RJq3lRVwEhjZn5cgDGpYHE7WKkoN17Tfw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=GkJJJs5OfzjmLwXap+RSvlzTyPJxmHgz5yQ3TfWFBQkkTaAdxf++245nrGF8k1KNs
	 +Eb+yT4fqY1tTqP0rRRoWm4bSeQ1xJz/GuUGsHgVhMAmnnjewcctxaqJ+FTno6gKoJ
	 X5e0Xs/ZIG0RiOQ7H4YtbszPo9FOmIHCadDcNJBg=
Content-Disposition: inline
In-Reply-To: <4B261F8F.9090806@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org


--qySB1iFW++5nzUxH
Content-Type: multipart/mixed; boundary="bFUYW7mPOLJ+Jd2A"
Content-Disposition: inline


--bFUYW7mPOLJ+Jd2A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2009 at 12:20:47PM +0100, Patrick McHardy wrote:
>=20
> Conntrack logs packets dropped by helpers automatically starting in
> 2.6.32. If you can capture those packets (either using tcpdump or
> the ULOG pcap output plugin) I can have a look at why they are dropped.

Attached. The first 4 packets are ok, I'd say.

The other (dropped) attempts might have something to do with the
fact the the machine in question has several interfaces with
several ip addresses, and the internal DNS resolves to all of
them, as they are reachable from intern.

Bye,

Joerg

--bFUYW7mPOLJ+Jd2A
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename=sipdrop
Content-Transfer-Encoding: quoted-printable

=D4=C3=B2=A1=02=00=04=00=00=00=00=00=00=00=00=00=DC=05=00=00=01=00=00=00]]'=
KZh=06=00=F7=01=00=00=F7=01=00=00=00=0Bj=13)=D9=00=1C%=14=C6=CF=08=00E=00=
=01=E9=00=00@=00@=11=DC=D9=AC=11=02=07=AC=11=02=01=13=C4=13=C4=01=D5=A5=ABR=
EGISTER sip:dorchain.net SIP/2.0=0D
Via: SIP/2.0/UDP 172.17.2.7;rport;branch=3Dz9hG4bKrowvfuqz=0D
Max-Forwards: 70=0D
To: "Joerg" <sip:joerg-intern@dorchain.net>=0D
=46rom: "Joerg" <sip:joerg-intern@dorchain.net>;tag=3Dcdyak=0D
Call-ID: stkvrcjwnjpljph@whisker.dorchain.net=0D
CSeq: 546 REGISTER=0D
Contact: <sip:joerg-intern@172.17.2.7>;expires=3D3600=0D
Allow: INVITE,ACK,BYE,CANCEL,OPTIONS,PRACK,REFER,NOTIFY,SUBSCRIBE,INFO,MESS=
AGE=0D
User-Agent: Twinkle/1.4.2=0D
Content-Length: 0=0D
=0D
]]'K=17k=06=00>=02=00=00>=02=00=00=00=1C%=14=C6=CF=00=0Bj=13)=D9=08=00E`=02=
0=97w=00=00@=11=84=BB=AC=11=02=01=AC=11=02=07=13=C4=13=C4=02=1C=D7-SIP/2.0 =
401 Unauthorized=0D
Via: SIP/2.0/UDP 172.17.2.7;branch=3Dz9hG4bKrowvfuqz;received=3D172.17.2.7;=
rport=3D5060=0D
=46rom: "Joerg" <sip:joerg-intern@dorchain.net>;tag=3Dcdyak=0D
To: "Joerg" <sip:joerg-intern@dorchain.net>;tag=3Das3c9168c7=0D
Call-ID: stkvrcjwnjpljph@whisker.dorchain.net=0D
CSeq: 546 REGISTER=0D
Server: Asterisk PBX 1.6.2.0~rc7-1=0D
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY, INFO=0D
Supported: replaces, timer=0D
WWW-Authenticate: Digest algorithm=3DMD5, realm=3D"dorchain.net", nonce=3D"=
5ddd6bd6"=0D
Content-Length: 0=0D
=0D
]]'K=FCr=06=00=9D=02=00=00=9D=02=00=00=00=0Bj=13)=D9=00=1C%=14=C6=CF=08=00E=
=00=02=8F=00=00@=00@=11=DC3=AC=11=02=07=AC=11=02=01=13=C4=13=C4=02{@=1BREGI=
STER sip:dorchain.net SIP/2.0=0D
Via: SIP/2.0/UDP 172.17.2.7;rport;branch=3Dz9hG4bKhctucsvj=0D
Max-Forwards: 70=0D
To: "Joerg" <sip:joerg-intern@dorchain.net>=0D
=46rom: "Joerg" <sip:joerg-intern@dorchain.net>;tag=3Dcdyak=0D
Call-ID: stkvrcjwnjpljph@whisker.dorchain.net=0D
CSeq: 547 REGISTER=0D
Contact: <sip:joerg-intern@172.17.2.7>;expires=3D3600=0D
Authorization: Digest username=3D"joerg-intern",realm=3D"dorchain.net",nonc=
e=3D"5ddd6bd6",uri=3D"sip:dorchain.net",response=3D"8b65512b41ea901a90575ca=
b8971eb68",algorithm=3DMD5=0D
Allow: INVITE,ACK,BYE,CANCEL,OPTIONS,PRACK,REFER,NOTIFY,SUBSCRIBE,INFO,MESS=
AGE=0D
User-Agent: Twinkle/1.4.2=0D
Content-Length: 0=0D
=0D
]]'K=0D=80=06=00K=02=00=00K=02=00=00=00=1C%=14=C6=CF=00=0Bj=13)=D9=08=00E`=
=02=3D=97x=00=00@=11=84=AD=AC=11=02=01=AC=11=02=07=13=C4=13=C4=02)=0FfSIP/2=
=2E0 200 OK=0D
Via: SIP/2.0/UDP 172.17.2.7;branch=3Dz9hG4bKhctucsvj;received=3D172.17.2.7;=
rport=3D5060=0D
=46rom: "Joerg" <sip:joerg-intern@dorchain.net>;tag=3Dcdyak=0D
To: "Joerg" <sip:joerg-intern@dorchain.net>;tag=3Das3c9168c7=0D
Call-ID: stkvrcjwnjpljph@whisker.dorchain.net=0D
CSeq: 547 REGISTER=0D
Server: Asterisk PBX 1.6.2.0~rc7-1=0D
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY, INFO=0D
Supported: replaces, timer=0D
Expires: 3600=0D
Contact: sip:joerg-intern@172.17.2.7;expires=3D3600=0D
Date: Tue, 15 Dec 2009 09:56:45 GMT=0D
Content-Length: 0=0D
=0D
hk'K=DB.=05=00=F7=01=00=00=F7=01=00=00=00=0Bj=13)=D9=00=1C%=14=C6=CF=08=00E=
=00=01=E9=00=00@=00@=110=FA=AC=11=02=07=D4X=85=99=13=C4=13=C4=01=D5=17=A4RE=
GISTER sip:dorchain.net SIP/2.0=0D
Via: SIP/2.0/UDP 172.17.2.7;rport;branch=3Dz9hG4bKzlguqamq=0D
Max-Forwards: 70=0D
To: "Joerg" <sip:joerg-intern@dorchain.net>=0D
=46rom: "Joerg" <sip:joerg-intern@dorchain.net>;tag=3Duyhuk=0D
Call-ID: stkvrcjwnjpljph@whisker.dorchain.net=0D
CSeq: 548 REGISTER=0D
Contact: <sip:joerg-intern@172.17.2.7>;expires=3D3600=0D
Allow: INVITE,ACK,BYE,CANCEL,OPTIONS,PRACK,REFER,NOTIFY,SUBSCRIBE,INFO,MESS=
AGE=0D
User-Agent: Twinkle/1.4.2=0D
Content-Length: 0=0D
=0D
hk'K=83=D0=0C=00=F7=01=00=00=F7=01=00=00=00=0Bj=13)=D9=00=1C%=14=C6=CF=08=
=00E=00=01=E9=00=00@=00@=110=FA=AC=11=02=07=D4X=85=99=13=C4=13=C4=01=D5=17=
=A4REGISTER sip:dorchain.net SIP/2.0=0D
Via: SIP/2.0/UDP 172.17.2.7;rport;branch=3Dz9hG4bKzlguqamq=0D
Max-Forwards: 70=0D
To: "Joerg" <sip:joerg-intern@dorchain.net>=0D
=46rom: "Joerg" <sip:joerg-intern@dorchain.net>;tag=3Duyhuk=0D
Call-ID: stkvrcjwnjpljph@whisker.dorchain.net=0D
CSeq: 548 REGISTER=0D
Contact: <sip:joerg-intern@172.17.2.7>;expires=3D3600=0D
Allow: INVITE,ACK,BYE,CANCEL,OPTIONS,PRACK,REFER,NOTIFY,SUBSCRIBE,INFO,MESS=
AGE=0D
User-Agent: Twinkle/1.4.2=0D
Content-Length: 0=0D
=0D
ik'KT=D1=0C=00=F7=01=00=00=F7=01=00=00=00=0Bj=13)=D9=00=1C%=14=C6=CF=08=00E=
=00=01=E9=00=00@=00@=110=FA=AC=11=02=07=D4X=85=99=13=C4=13=C4=01=D5=17=A4RE=
GISTER sip:dorchain.net SIP/2.0=0D
Via: SIP/2.0/UDP 172.17.2.7;rport;branch=3Dz9hG4bKzlguqamq=0D
Max-Forwards: 70=0D
To: "Joerg" <sip:joerg-intern@dorchain.net>=0D
=46rom: "Joerg" <sip:joerg-intern@dorchain.net>;tag=3Duyhuk=0D
Call-ID: stkvrcjwnjpljph@whisker.dorchain.net=0D
CSeq: 548 REGISTER=0D
Contact: <sip:joerg-intern@172.17.2.7>;expires=3D3600=0D
Allow: INVITE,ACK,BYE,CANCEL,OPTIONS,PRACK,REFER,NOTIFY,SUBSCRIBE,INFO,MESS=
AGE=0D
User-Agent: Twinkle/1.4.2=0D
Content-Length: 0=0D
=0D
kk'K=85=E9=0C=00=F7=01=00=00=F7=01=00=00=00=0Bj=13)=D9=00=1C%=14=C6=CF=08=
=00E=00=01=E9=00=00@=00@=110=FA=AC=11=02=07=D4X=85=99=13=C4=13=C4=01=D5=17=
=A4REGISTER sip:dorchain.net SIP/2.0=0D
Via: SIP/2.0/UDP 172.17.2.7;rport;branch=3Dz9hG4bKzlguqamq=0D
Max-Forwards: 70=0D
To: "Joerg" <sip:joerg-intern@dorchain.net>=0D
=46rom: "Joerg" <sip:joerg-intern@dorchain.net>;tag=3Duyhuk=0D
Call-ID: stkvrcjwnjpljph@whisker.dorchain.net=0D
CSeq: 548 REGISTER=0D
Contact: <sip:joerg-intern@172.17.2.7>;expires=3D3600=0D
Allow: INVITE,ACK,BYE,CANCEL,OPTIONS,PRACK,REFER,NOTIFY,SUBSCRIBE,INFO,MESS=
AGE=0D
User-Agent: Twinkle/1.4.2=0D
Content-Length: 0=0D
=0D
ok'KP=D2=0C=00=F7=01=00=00=F7=01=00=00=00=0Bj=13)=D9=00=1C%=14=C6=CF=08=00E=
=00=01=E9=00=00@=00@=110=FA=AC=11=02=07=D4X=85=99=13=C4=13=C4=01=D5=17=A4RE=
GISTER sip:dorchain.net SIP/2.0=0D
Via: SIP/2.0/UDP 172.17.2.7;rport;branch=3Dz9hG4bKzlguqamq=0D
Max-Forwards: 70=0D
To: "Joerg" <sip:joerg-intern@dorchain.net>=0D
=46rom: "Joerg" <sip:joerg-intern@dorchain.net>;tag=3Duyhuk=0D
Call-ID: stkvrcjwnjpljph@whisker.dorchain.net=0D
CSeq: 548 REGISTER=0D
Contact: <sip:joerg-intern@172.17.2.7>;expires=3D3600=0D
Allow: INVITE,ACK,BYE,CANCEL,OPTIONS,PRACK,REFER,NOTIFY,SUBSCRIBE,INFO,MESS=
AGE=0D
User-Agent: Twinkle/1.4.2=0D
Content-Length: 0=0D
=0D
ok'K=A6=D4=0C=00>=02=00=00>=02=00=00=00=1C%=14=C6=CF=00=0Bj=13)=D9=08=00E`=
=020W1=00=00@=11=19"=D4X=85=99=AC=11=02=07=13=C4=13=C4=02=1C3=06SIP/2.0 401=
 Unauthorized=0D
Via: SIP/2.0/UDP 172.17.2.7;branch=3Dz9hG4bKzlguqamq;received=3D172.17.2.7;=
rport=3D5060=0D
=46rom: "Joerg" <sip:joerg-intern@dorchain.net>;tag=3Duyhuk=0D
To: "Joerg" <sip:joerg-intern@dorchain.net>;tag=3Das4d9e6bef=0D
Call-ID: stkvrcjwnjpljph@whisker.dorchain.net=0D
CSeq: 548 REGISTER=0D
Server: Asterisk PBX 1.6.2.0~rc7-1=0D
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY, INFO=0D
Supported: replaces, timer=0D
WWW-Authenticate: Digest algorithm=3DMD5, realm=3D"dorchain.net", nonce=3D"=
392b99bd"=0D
Content-Length: 0=0D
=0D
ok'K[=D9=0C=00=9D=02=00=00=9D=02=00=00=00=0Bj=13)=D9=00=1C%=14=C6=CF=08=00E=
=00=02=8F=00=00@=00@=110T=AC=11=02=07=D4X=85=99=13=C4=13=C4=02{=A0=93REGIST=
ER sip:dorchain.net SIP/2.0=0D
Via: SIP/2.0/UDP 172.17.2.7;rport;branch=3Dz9hG4bKrksmokjy=0D
Max-Forwards: 70=0D
To: "Joerg" <sip:joerg-intern@dorchain.net>=0D
=46rom: "Joerg" <sip:joerg-intern@dorchain.net>;tag=3Duyhuk=0D
Call-ID: stkvrcjwnjpljph@whisker.dorchain.net=0D
CSeq: 549 REGISTER=0D
Contact: <sip:joerg-intern@172.17.2.7>;expires=3D3600=0D
Authorization: Digest username=3D"joerg-intern",realm=3D"dorchain.net",nonc=
e=3D"392b99bd",uri=3D"sip:dorchain.net",response=3D"2a7c353d7e0dca7f05c9095=
befb03b58",algorithm=3DMD5=0D
Allow: INVITE,ACK,BYE,CANCEL,OPTIONS,PRACK,REFER,NOTIFY,SUBSCRIBE,INFO,MESS=
AGE=0D
User-Agent: Twinkle/1.4.2=0D
Content-Length: 0=0D
=0D
ok'K=CB=E6=0C=00K=02=00=00K=02=00=00=00=1C%=14=C6=CF=00=0Bj=13)=D9=08=00E`=
=02=3DW2=00=00@=11=19=14=D4X=85=99=AC=11=02=07=13=C4=13=C4=02),=F5SIP/2.0 2=
00 OK=0D
Via: SIP/2.0/UDP 172.17.2.7;branch=3Dz9hG4bKrksmokjy;received=3D172.17.2.7;=
rport=3D5060=0D
=46rom: "Joerg" <sip:joerg-intern@dorchain.net>;tag=3Duyhuk=0D
To: "Joerg" <sip:joerg-intern@dorchain.net>;tag=3Das4d9e6bef=0D
Call-ID: stkvrcjwnjpljph@whisker.dorchain.net=0D
CSeq: 549 REGISTER=0D
Server: Asterisk PBX 1.6.2.0~rc7-1=0D
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY, INFO=0D
Supported: replaces, timer=0D
Expires: 3600=0D
Contact: sip:joerg-intern@172.17.2.7;expires=3D3600=0D
Date: Tue, 15 Dec 2009 10:56:47 GMT=0D
Content-Length: 0=0D
=0D

--bFUYW7mPOLJ+Jd2A--

--qySB1iFW++5nzUxH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iHcEARECADcFAksnceIwFIAAAAAAFQAScGthLWFkZHJlc3NAZ251cGcub3Jnam9l
cmdAZG9yY2hhaW4ubmV0AAoJEI2OPuD3c7zgNSoAnRcAZ6QQQqksXvxX3Ee0SPOW
NZBeAJ9GGcd0Nkn/fuWMFfs3HRtA8nFRmw==
=YAhC
-----END PGP SIGNATURE-----

--qySB1iFW++5nzUxH--
