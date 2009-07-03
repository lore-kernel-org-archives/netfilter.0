From: Joerg Dorchain <joerg@dorchain.net>
Subject: Re: nf_conntrack_sip problem
Date: Fri, 3 Jul 2009 13:20:45 +0200
Message-ID: <20090703112044.GK9285@Redstar.dorchain.net>
References: <20090701113701.GZ9285@Redstar.dorchain.net> <4A4B509C.3080600@trash.net> <20090701144321.GB9285@Redstar.dorchain.net> <4A4B7B4D.5090900@trash.net> <20090701161029.GC9285@Redstar.dorchain.net> <4A4B8BD5.6060907@trash.net> <20090701205616.GE9285@Redstar.dorchain.net> <20090702081741.GH9285@Redstar.dorchain.net> <20090702090440.GI9285@Redstar.dorchain.net> <4A4DD34F.4050906@trash.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8MA55IEjTDEadc2f"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorchain.net;
	s=redstar; t=1246620045;
	bh=CbaT1IttsPRmH3rPwOgO+aq7FYjfFxstdWTB+exKg6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=zwi8stBIpRPlsL4q9QMUBzVgXKKgk1gAt9SoHwRbvcLgRDqtbWkVgSzP7OnA4a5go
	 2h0yr7eUPGg/CCJpAKf8CIB9UrY97NJl0aDFRrA9ro42n2wHwLyugFsa8vQ353wH4I
	 6/1nLSHSyanTfEYukXrwt8x2ehQQZXeWFeC4SVdY=
Content-Disposition: inline
In-Reply-To: <4A4DD34F.4050906@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org


--8MA55IEjTDEadc2f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2009 at 11:45:51AM +0200, Patrick McHardy wrote:
>=20
> Joerg Dorchain wrote:
>> On Thu, Jul 02, 2009 at 10:17:41AM +0200, Joerg Dorchain wrote:
>>> I works, but somewhat ugly.
>>> # conntrack -E expect
>>> 180 proto=3D17 src=3D0.0.0.0 dst=3D85.93.219.122 sport=3D0 dport=3D11080
>>> 180 proto=3D17 src=3D0.0.0.0 dst=3D85.93.219.122 sport=3D0 dport=3D11081
>>> 180 proto=3D17 src=3D0.0.0.0 dst=3D212.88.133.153 sport=3D0 dport=3D7076
>>> 180 proto=3D17 src=3D0.0.0.0 dst=3D212.88.133.153 sport=3D0 dport=3D7077
>>>
>>> All the places where the ip is 0.0.0.0 or the port is 0 could be
>>> filled more specifically. The necessary information is available
>>> in the same SIP/SDP flow as the used information. Besides the two
>>> RTP stream are unidirectional, so I'd like to have something like
>>> this:
>>> 180 proto=3D17 src=3D212.88.133.153 dst=3D85.93.219.122 sport=3D7076 dp=
ort=3D11080
>>> 180 proto=3D17 src=3D85.93.219.122 dst=3D212.88.133.153 sport=3D11081 d=
port=3D7077
>>
>> Sorry for replying to often to myself, I have another addendum:
>> In case of asterisk reinvites in order to have to RTP stream
>> moved away from the machine, there are still connections expected
>> despite that these invites are explicitly meant to stop rtp
>> streams to the local machine.
>
> Could you send a dump? Last time I tried asterisk reinvites, it didn't
> work at all because asterisk made some (don't recall the details)
> invalid assumptions.

Here is the dump. The most interesting lines for you might be
those with X-asterisk-Info: SIP re-invite (External RTP bridge)
in between.
My own asterisk is version 1:1.4.21.2~dfsg-3 from Debian.

Bye,

Joerg


Here is some part missing for setting up the incoming call. The
dump starts when asterisk tries the second sip call outgoing, and
then directly connect the rtp streams.

<------------->
--- (12 headers 0 lines) ---
Reliably Transmitting (no NAT) to 217.10.79.9:5060:
INVITE sip:10000@sipgate.de SIP/2.0
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK7ae9f331;rport
=46rom: "Unknown" <sip:1738180@sipgate.de>;tag=3Das49b007bc
To: <sip:10000@sipgate.de>
Contact: <sip:1738180@212.88.133.153>
Call-ID: 62d694bd2314bbaa7e4ac9470a0a1dfe@sipgate.de
CSeq: 102 INVITE
User-Agent: Asterisk PBX
Max-Forwards: 70
Date: Fri, 03 Jul 2009 10:55:17 GMT
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY
Supported: replaces
Content-Type: application/sdp
Content-Length: 290

v=3D0
o=3Droot 29312 29312 IN IP4 212.88.133.153
s=3Dsession
c=3DIN IP4 212.88.133.153
t=3D0 0
m=3Daudio 7076 RTP/AVP 8 3 0 101
a=3Drtpmap:8 PCMA/8000
a=3Drtpmap:3 GSM/8000
a=3Drtpmap:0 PCMU/8000
a=3Drtpmap:101 telephone-event/8000
a=3Dfmtp:101 0-16
a=3DsilenceSupp:off - - - -
a=3Dptime:20
a=3Dsendrecv

---
<--- SIP read from 217.10.79.9:5060 --->
SIP/2.0 407 Proxy Authentication Required
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK7ae9f331;rport=3D5060
=46rom: "Unknown" <sip:1738180@sipgate.de>;tag=3Das49b007bc
To: <sip:10000@sipgate.de>;tag=3Dfe1721141f05bd30d4b50c70da3ae228.8296
Call-ID: 62d694bd2314bbaa7e4ac9470a0a1dfe@sipgate.de
CSeq: 102 INVITE
Proxy-Authenticate: Digest realm=3D"sipgate.de", nonce=3D"4a4de4c165713d8cf=
463b184d93833a2d3e9c869"
Content-Length: 0


<------------->
--- (8 headers 0 lines) ---
Transmitting (no NAT) to 217.10.79.9:5060:
ACK sip:10000@sipgate.de SIP/2.0
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK7ae9f331;rport
=46rom: "Unknown" <sip:1738180@sipgate.de>;tag=3Das49b007bc
To: <sip:10000@sipgate.de>;tag=3Dfe1721141f05bd30d4b50c70da3ae228.8296
Contact: <sip:1738180@212.88.133.153>
Call-ID: 62d694bd2314bbaa7e4ac9470a0a1dfe@sipgate.de
CSeq: 102 ACK
User-Agent: Asterisk PBX
Max-Forwards: 70
Content-Length: 0


---
Reliably Transmitting (no NAT) to 217.10.79.9:5060:
INVITE sip:10000@sipgate.de SIP/2.0
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK17f9904c;rport
=46rom: "Unknown" <sip:1738180@sipgate.de>;tag=3Das49b007bc
To: <sip:10000@sipgate.de>
Contact: <sip:1738180@212.88.133.153>
Call-ID: 62d694bd2314bbaa7e4ac9470a0a1dfe@sipgate.de
CSeq: 103 INVITE
User-Agent: Asterisk PBX
Max-Forwards: 70
Proxy-Authorization: Digest username=3D"xxxxxxx", realm=3D"sipgate.de", alg=
orithm=3DMD5, uri=3D"sip:10000@sipgate.de", nonce=3D"xxxxxxxxxxxxx", respon=
se=3D"xxxxxxxxxxxxxx"
Date: Fri, 03 Jul 2009 10:55:17 GMT
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY
Supported: replaces
Content-Type: application/sdp
Content-Length: 290

v=3D0
o=3Droot 29312 29313 IN IP4 212.88.133.153
s=3Dsession
c=3DIN IP4 212.88.133.153
t=3D0 0
m=3Daudio 7076 RTP/AVP 8 3 0 101
a=3Drtpmap:8 PCMA/8000
a=3Drtpmap:3 GSM/8000
a=3Drtpmap:0 PCMU/8000
a=3Drtpmap:101 telephone-event/8000
a=3Dfmtp:101 0-16
a=3DsilenceSupp:off - - - -
a=3Dptime:20
a=3Dsendrecv

---

<--- SIP read from 217.10.79.9:5060 --->
SIP/2.0 100 Giving a try
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK17f9904c;rport=3D5060
=46rom: "Unknown" <sip:1738180@sipgate.de>;tag=3Das49b007bc
To: <sip:10000@sipgate.de>
Call-ID: 62d694bd2314bbaa7e4ac9470a0a1dfe@sipgate.de
CSeq: 103 INVITE
Content-Length: 0


<------------->
--- (7 headers 0 lines) ---

<--- SIP read from 217.10.79.9:5060 --->
SIP/2.0 200 OK
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK17f9904c;rport=3D5060
Record-Route: <sip:172.20.40.3;lr=3Don>
Record-Route: <sip:217.10.79.9;lr=3Don;ftag=3Das49b007bc>
=46rom: "Unknown" <sip:1738180@sipgate.de>;tag=3Das49b007bc
To: <sip:10000@sipgate.de>;tag=3Das069f42dc
Call-ID: 62d694bd2314bbaa7e4ac9470a0a1dfe@sipgate.de
CSeq: 103 INVITE
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY
Supported: replaces
Contact: <sip:10000@217.10.79.30>
Content-Type: application/sdp
Content-Length: 287

v=3D0
o=3Droot 14076 14076 IN IP4 217.10.79.30
s=3Dsession
c=3DIN IP4 217.10.79.30
t=3D0 0
m=3Daudio 16236 RTP/AVP 8 0 3 101
a=3Drtpmap:8 PCMA/8000
a=3Drtpmap:0 PCMU/8000
a=3Drtpmap:3 GSM/8000
a=3Drtpmap:101 telephone-event/8000
a=3Dfmtp:101 0-16
a=3DsilenceSupp:off - - - -
a=3Dptime:20
a=3Dsendrecv

<------------->
--- (13 headers 14 lines) ---
Transmitting (no NAT) to 217.10.79.9:5060:
ACK sip:10000@217.10.79.30 SIP/2.0
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK1cf1588f;rport
Route: <sip:217.10.79.9;lr=3Don;ftag=3Das49b007bc>,<sip:172.20.40.3;lr=3Don>
=46rom: "Unknown" <sip:1738180@sipgate.de>;tag=3Das49b007bc
To: <sip:10000@sipgate.de>;tag=3Das069f42dc
Contact: <sip:1738180@212.88.133.153>
Call-ID: 62d694bd2314bbaa7e4ac9470a0a1dfe@sipgate.de
CSeq: 103 ACK
User-Agent: Asterisk PBX
Max-Forwards: 70
Content-Length: 0


---
Reliably Transmitting (no NAT) to 85.93.219.114:5060:
INVITE sip:Unknown@85.93.219.122 SIP/2.0
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK24a401b3;rport
Route: <sip:85.93.219.114;ftag=3Das271217c9;lr=3Don>
=46rom: <sip:20400371@tel.lu>;tag=3Das67860b84
To: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das271217c9
Contact: <sip:s@212.88.133.153>
Call-ID: 130aaf675f1c3e327fc3860c35001e11@85.93.219.122
CSeq: 102 INVITE
User-Agent: Asterisk PBX
Max-Forwards: 70
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY
Supported: replaces
X-asterisk-Info: SIP re-invite (External RTP bridge)
Content-Type: application/sdp
Content-Length: 287

v=3D0
o=3Droot 29312 29313 IN IP4 217.10.79.30
s=3Dsession
c=3DIN IP4 217.10.79.30
t=3D0 0
m=3Daudio 16236 RTP/AVP 3 0 8 101
a=3Drtpmap:3 GSM/8000
a=3Drtpmap:0 PCMU/8000
a=3Drtpmap:8 PCMA/8000
a=3Drtpmap:101 telephone-event/8000
a=3Dfmtp:101 0-16
a=3DsilenceSupp:off - - - -
a=3Dptime:20
a=3Dsendrecv

---
Reliably Transmitting (no NAT) to 217.10.79.9:5060:
INVITE sip:10000@217.10.79.30 SIP/2.0
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK04dd2986;rport
Route: <sip:217.10.79.9;lr=3Don;ftag=3Das49b007bc>,<sip:172.20.40.3;lr=3Don>
=46rom: "Unknown" <sip:1738180@sipgate.de>;tag=3Das49b007bc
To: <sip:10000@sipgate.de>;tag=3Das069f42dc
Contact: <sip:1738180@212.88.133.153>
Call-ID: 62d694bd2314bbaa7e4ac9470a0a1dfe@sipgate.de
CSeq: 104 INVITE
User-Agent: Asterisk PBX
Max-Forwards: 70
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY
Supported: replaces
X-asterisk-Info: SIP re-invite (External RTP bridge)
Content-Type: application/sdp
Content-Length: 289

v=3D0
o=3Droot 29312 29314 IN IP4 85.93.219.122
s=3Dsession
c=3DIN IP4 85.93.219.122
t=3D0 0
m=3Daudio 13006 RTP/AVP 8 3 0 101
a=3Drtpmap:8 PCMA/8000
a=3Drtpmap:3 GSM/8000
a=3Drtpmap:0 PCMU/8000
a=3Drtpmap:101 telephone-event/8000
a=3Dfmtp:101 0-16
a=3DsilenceSupp:off - - - -
a=3Dptime:20
a=3Dsendrecv

---

<--- SIP read from 85.93.219.114:5060 --->
SIP/2.0 100 trying -- your call is important to us
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK24a401b3;rport=3D5060
=46rom: <sip:20400371@tel.lu>;tag=3Das67860b84
To: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das271217c9
Call-ID: 130aaf675f1c3e327fc3860c35001e11@85.93.219.122
CSeq: 102 INVITE
Server: Sip EXpress router (0.9.6 (x86_64/linux))
Content-Length: 0
Warning: 392 85.93.219.114:5060 "Noisy feedback tells:  pid=3D31420 req_src=
_ip=3D212.88.133.153 req_src_port=3D5060 in_uri=3Dsip:Unknown@85.93.219.122=
 out_uri=3Dsip:Unknown@85.93.219.122 via_cnt=3D=3D1"


<------------->
--- (9 headers 0 lines) ---

<--- SIP read from 85.93.219.114:5060 --->
SIP/2.0 200 OK
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK24a401b3;rport=3D5060
Record-Route: <sip:85.93.219.114;ftag=3Das67860b84;lr=3Don>
=46rom: <sip:20400371@tel.lu>;tag=3Das67860b84
To: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das271217c9
Call-ID: 130aaf675f1c3e327fc3860c35001e11@85.93.219.122
CSeq: 102 INVITE
User-Agent: Asterisk PBX 1.6.0.6
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY
Supported: replaces, timer
Contact: <sip:Unknown@85.93.219.122>
Content-Type: application/sdp
Content-Length: 312

v=3D0
o=3Droot 1491947058 1491947059 IN IP4 85.93.219.122
s=3DAsterisk PBX 1.6.0.6
c=3DIN IP4 85.93.219.122
t=3D0 0
m=3Daudio 13006 RTP/AVP 8 0 3 101
a=3Drtpmap:8 PCMA/8000
a=3Drtpmap:0 PCMU/8000
a=3Drtpmap:3 GSM/8000
a=3Drtpmap:101 telephone-event/8000
a=3Dfmtp:101 0-16
a=3DsilenceSupp:off - - - -
a=3Dptime:20
a=3Dsendrecv

<------------->
--- (13 headers 14 lines) ---
Transmitting (no NAT) to 85.93.219.114:5060:
ACK sip:Unknown@85.93.219.122 SIP/2.0
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK1f7a1716;rport
Route: <sip:85.93.219.114;ftag=3Das271217c9;lr=3Don>
=46rom: <sip:20400371@tel.lu>;tag=3Das67860b84
To: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das271217c9
Contact: <sip:s@212.88.133.153>
Call-ID: 130aaf675f1c3e327fc3860c35001e11@85.93.219.122
CSeq: 102 ACK
User-Agent: Asterisk PBX
Max-Forwards: 70
Content-Length: 0


---

<--- SIP read from 217.10.79.9:5060 --->
SIP/2.0 100 Giving a try
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK04dd2986;rport=3D5060
=46rom: "Unknown" <sip:1738180@sipgate.de>;tag=3Das49b007bc
To: <sip:10000@sipgate.de>;tag=3Das069f42dc
Call-ID: 62d694bd2314bbaa7e4ac9470a0a1dfe@sipgate.de
CSeq: 104 INVITE
Content-Length: 0


<------------->
--- (7 headers 0 lines) ---

<--- SIP read from 217.10.79.9:5060 --->
SIP/2.0 200 OK
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK04dd2986;rport=3D5060
=46rom: "Unknown" <sip:1738180@sipgate.de>;tag=3Das49b007bc
To: <sip:10000@sipgate.de>;tag=3Das069f42dc
Call-ID: 62d694bd2314bbaa7e4ac9470a0a1dfe@sipgate.de
CSeq: 104 INVITE
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY
Supported: replaces
Contact: <sip:10000@217.10.79.30>
Content-Type: application/sdp
Content-Length: 287

v=3D0
o=3Droot 14076 14077 IN IP4 217.10.79.30
s=3Dsession
c=3DIN IP4 217.10.79.30
t=3D0 0
m=3Daudio 16236 RTP/AVP 8 0 3 101
a=3Drtpmap:8 PCMA/8000
a=3Drtpmap:0 PCMU/8000
a=3Drtpmap:3 GSM/8000
a=3Drtpmap:101 telephone-event/8000
a=3Dfmtp:101 0-16
a=3DsilenceSupp:off - - - -
a=3Dptime:20
a=3Dsendrecv

<------------->
--- (11 headers 14 lines) ---
Transmitting (no NAT) to 217.10.79.9:5060:
ACK sip:10000@217.10.79.30 SIP/2.0
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK3e4efa0c;rport
Route: <sip:217.10.79.9;lr=3Don;ftag=3Das49b007bc>,<sip:172.20.40.3;lr=3Don>
=46rom: "Unknown" <sip:1738180@sipgate.de>;tag=3Das49b007bc
To: <sip:10000@sipgate.de>;tag=3Das069f42dc
Contact: <sip:1738180@212.88.133.153>
Call-ID: 62d694bd2314bbaa7e4ac9470a0a1dfe@sipgate.de
CSeq: 104 ACK
User-Agent: Asterisk PBX
Max-Forwards: 70
Content-Length: 0


---
<--- SIP read from 217.10.79.9:5060 --->
BYE sip:1738180@212.88.133.153 SIP/2.0
Via: SIP/2.0/UDP 217.10.79.9:5060;branch=3Dz9hG4bKf4e9.3b548123.0
Via: SIP/2.0/UDP 172.20.40.3;branch=3Dz9hG4bKf4e9.3b548123.0
Via: SIP/2.0/UDP 217.10.79.30:5060;branch=3Dz9hG4bK15d17460;rport=3D5060
=46rom: <sip:10000@sipgate.de>;tag=3Das069f42dc
To: "Unknown" <sip:1738180@sipgate.de>;tag=3Das49b007bc
Call-ID: 62d694bd2314bbaa7e4ac9470a0a1dfe@sipgate.de
CSeq: 102 BYE
Max-Forwards: 68
Content-Length: 0
X-hint: rr-enforced


<------------->
--- (11 headers 0 lines) ---
Sending to 217.10.79.9 : 5060 (no NAT)

<--- Transmitting (no NAT) to 217.10.79.9:5060 --->
SIP/2.0 200 OK
Via: SIP/2.0/UDP 217.10.79.9:5060;branch=3Dz9hG4bKf4e9.3b548123.0;received=
=3D217.10.79.9
Via: SIP/2.0/UDP 172.20.40.3;branch=3Dz9hG4bKf4e9.3b548123.0
Via: SIP/2.0/UDP 217.10.79.30:5060;branch=3Dz9hG4bK15d17460;rport=3D5060
=46rom: <sip:10000@sipgate.de>;tag=3Das069f42dc
To: "Unknown" <sip:1738180@sipgate.de>;tag=3Das49b007bc
Call-ID: 62d694bd2314bbaa7e4ac9470a0a1dfe@sipgate.de
CSeq: 102 BYE
User-Agent: Asterisk PBX
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY
Supported: replaces
Contact: <sip:1738180@212.88.133.153>
Content-Length: 0


<------------>
Reliably Transmitting (no NAT) to 85.93.219.114:5060:
INVITE sip:Unknown@85.93.219.122 SIP/2.0
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK273424fd;rport
Route: <sip:85.93.219.114;ftag=3Das271217c9;lr=3Don>
=46rom: <sip:20400371@tel.lu>;tag=3Das67860b84
To: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das271217c9
Contact: <sip:s@212.88.133.153>
Call-ID: 130aaf675f1c3e327fc3860c35001e11@85.93.219.122
CSeq: 103 INVITE
User-Agent: Asterisk PBX
Max-Forwards: 70
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY
Supported: replaces
X-asterisk-Info: SIP re-invite (External RTP bridge)
Content-Type: application/sdp
Content-Length: 290

v=3D0
o=3Droot 29312 29314 IN IP4 212.88.133.153
s=3Dsession
c=3DIN IP4 212.88.133.153
t=3D0 0
m=3Daudio 7074 RTP/AVP 3 0 8 101
a=3Drtpmap:3 GSM/8000
a=3Drtpmap:0 PCMU/8000
a=3Drtpmap:8 PCMA/8000
a=3Drtpmap:101 telephone-event/8000
a=3Dfmtp:101 0-16
a=3DsilenceSupp:off - - - -
a=3Dptime:20
a=3Dsendrecv

---
<--- SIP read from 85.93.219.114:5060 --->
SIP/2.0 100 trying -- your call is important to us
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK273424fd;rport=3D5060
=46rom: <sip:20400371@tel.lu>;tag=3Das67860b84
To: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das271217c9
Call-ID: 130aaf675f1c3e327fc3860c35001e11@85.93.219.122
CSeq: 103 INVITE
Server: Sip EXpress router (0.9.6 (x86_64/linux))
Content-Length: 0
Warning: 392 85.93.219.114:5060 "Noisy feedback tells:  pid=3D31389 req_src=
_ip=3D212.88.133.153 req_src_port=3D5060 in_uri=3Dsip:Unknown@85.93.219.122=
 out_uri=3Dsip:Unknown@85.93.219.122 via_cnt=3D=3D1"


<------------->
--- (9 headers 0 lines) ---
<--- SIP read from 85.93.219.114:5060 --->
SIP/2.0 200 OK
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK273424fd;rport=3D5060
Record-Route: <sip:85.93.219.114;ftag=3Das67860b84;lr=3Don>
=46rom: <sip:20400371@tel.lu>;tag=3Das67860b84
To: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das271217c9
Call-ID: 130aaf675f1c3e327fc3860c35001e11@85.93.219.122
CSeq: 103 INVITE
User-Agent: Asterisk PBX 1.6.0.6
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY
Supported: replaces, timer
Contact: <sip:Unknown@85.93.219.122>
Content-Type: application/sdp
Content-Length: 312

v=3D0
o=3Droot 1491947058 1491947060 IN IP4 85.93.219.122
s=3DAsterisk PBX 1.6.0.6
c=3DIN IP4 85.93.219.122
t=3D0 0
m=3Daudio 13006 RTP/AVP 8 0 3 101
a=3Drtpmap:8 PCMA/8000
a=3Drtpmap:0 PCMU/8000
a=3Drtpmap:3 GSM/8000
a=3Drtpmap:101 telephone-event/8000
a=3Dfmtp:101 0-16
a=3DsilenceSupp:off - - - -
a=3Dptime:20
a=3Dsendrecv

<------------->
--- (13 headers 14 lines) ---
Transmitting (no NAT) to 85.93.219.114:5060:
ACK sip:Unknown@85.93.219.122 SIP/2.0
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK688e4031;rport
Route: <sip:85.93.219.114;ftag=3Das271217c9;lr=3Don>
=46rom: <sip:20400371@tel.lu>;tag=3Das67860b84
To: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das271217c9
Contact: <sip:s@212.88.133.153>
Call-ID: 130aaf675f1c3e327fc3860c35001e11@85.93.219.122
CSeq: 103 ACK
User-Agent: Asterisk PBX
Max-Forwards: 70
Content-Length: 0


---
Reliably Transmitting (no NAT) to 85.93.219.114:5060:
BYE sip:Unknown@85.93.219.122 SIP/2.0
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK352dc0dd;rport
Route: <sip:85.93.219.114;ftag=3Das271217c9;lr=3Don>
=46rom: <sip:20400371@tel.lu>;tag=3Das67860b84
To: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das271217c9
Call-ID: 130aaf675f1c3e327fc3860c35001e11@85.93.219.122
CSeq: 104 BYE
User-Agent: Asterisk PBX
Max-Forwards: 70
Content-Length: 0


---
<--- SIP read from 85.93.219.114:5060 --->
SIP/2.0 200 OK
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK352dc0dd;rport=3D5060
Record-Route: <sip:85.93.219.114;ftag=3Das67860b84;lr=3Don>
=46rom: <sip:20400371@tel.lu>;tag=3Das67860b84
To: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das271217c9
Call-ID: 130aaf675f1c3e327fc3860c35001e11@85.93.219.122
CSeq: 104 BYE
User-Agent: Asterisk PBX 1.6.0.6
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY
Supported: replaces, timer
Content-Length: 0


<------------->
--- (11 headers 0 lines) ---


--8MA55IEjTDEadc2f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iHcEARECADcFAkpN6YwwFIAAAAAAFQAScGthLWFkZHJlc3NAZ251cGcub3Jnam9l
cmdAZG9yY2hhaW4ubmV0AAoJEI2OPuD3c7zgDAsAn2Rt9/lycBJKal5AcSQ1+/80
SUb5AJ9sDWqm+ULhb5F6bJ+bu0Q9ioRtwA==
=+nB/
-----END PGP SIGNATURE-----

--8MA55IEjTDEadc2f--
