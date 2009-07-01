From: Joerg Dorchain <joerg@dorchain.net>
Subject: Re: nf_conntrack_sip problem
Date: Wed, 1 Jul 2009 16:43:21 +0200
Message-ID: <20090701144321.GB9285@Redstar.dorchain.net>
References: <20090701113701.GZ9285@Redstar.dorchain.net> <4A4B509C.3080600@trash.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8DtChEGCcMdSgkU2"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorchain.net;
	s=redstar; t=1246459402;
	bh=8C/XCzphiQgQ7jFYCFwKK+NtPrNDu8L6DJij1IrYJSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=HK4BhfkJnF3y36esryZe4lJTuMVZB0vP0Lm7VcTpKsn9z1QOpJlK9MJzZ3hdwJ16J
	 Hr14Euc62YoMcF7Oyw10qYMcCltkLASWiFjAyX//p5XB8KZYzKJ8erWgfwj66M1NE9
	 B+F7oLMx/PvdRCX89ZYigz4Fs4lqNmZtF/GboLR8=
Content-Disposition: inline
In-Reply-To: <4A4B509C.3080600@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org


--8DtChEGCcMdSgkU2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2009 at 02:03:40PM +0200, Patrick McHardy wrote:
>> I have some problems understanding nf_conntrack_sip. I want to
>> use it avoid having static entries for the rtp stream, as IMHO
>> those should be catched by a RELATED rules when nf_conntrack_sip
>> works properly.
>>
>> I have a machine with a pppoe interface connected to the
>> internet, with asterisk running on it, and a small local network
>> behind it on eth1, where I want to force sip traffic going
>> through the local asterisk.
>>
>> Unfortunately it doesn't work as expected. I use vanilla kernel
>> 2.6.30. My iptable rules that do not work look like this:
>>
>> Maybe I am missing something obvious, but I'd appreciate a hint.
>> (yes, nf_conntrack_sip is loaded)
>
> Depending on how your SIP provider works, you might need to set the
> sip_direct_signalling option to zero (in case signalling connections
> can arrive from different addresses than the one registered with),
> additionally you might need to set the sip_direct_media option to
> 0 in case the RTP streams arrive from different addresses than the
> signalling endpoint.

I tried this. Actually, it makes things worse. Now Asterisk
complains:=20
[Jul  1 16:17:46] WARNING[20516]: chan_sip.c:1787 __sip_xmit:
sip_xmit of 0x86f8de0 (len 384) to 217.10.79.9:5060 returned -1:
Operation not permitted

(Trying to register with sipgate.de; registration in parallel
with tel.lu seems to work)

nf_conntrack_sip without options on a trial incoming call however gives:

# conntrack -E expect
180 proto=3D17 src=3D85.93.219.114 dst=3D212.88.133.153 sport=3D0 dport=3D7=
070
180 proto=3D17 src=3D85.93.219.114 dst=3D212.88.133.153 sport=3D0 dport=3D7=
071

(packet dump from asterisk)
*CLI> sip debug
SIP Debugging enabled
The 'sip debug' command is deprecated and will be removed in a
future release. Please use 'sip set debug' instead.
*CLI>
<--- SIP read from 85.93.219.114:5060 --->
INVITE sip:s@212.88.133.153 SIP/2.0
Record-Route: <sip:85.93.219.114;ftag=3Das73ca530c;lr=3Don>
Via: SIP/2.0/UDP 85.93.219.114;branch=3Dz9hG4bKbcd7.7f0d18e6.0
Via: SIP/2.0/UDP
85.93.219.122:5060;branch=3Dz9hG4bK13c75fc4;rport=3D5060
Max-Forwards: 16
=46rom: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das73ca530c
To: <sip:20400371@tel.lu>
Contact: <sip:Unknown@85.93.219.122>
Call-ID: 6b6bfb5c3eb6137532b36d216e8c9948@85.93.219.122
CSeq: 102 INVITE
User-Agent: Asterisk PBX 1.6.0.6
Date: Wed, 01 Jul 2009 14:23:10 GMT
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE,
NOTIFY
Supported: replaces, timer
Content-Type: application/sdp
Content-Length: 357

v=3D0
o=3Droot 1551730590 1551730590 IN IP4 85.93.219.122
s=3DAsterisk PBX 1.6.0.6
c=3DIN IP4 85.93.219.122
t=3D0 0
m=3Daudio 10316 RTP/AVP 8 0 97 3 101
a=3Drtpmap:8 PCMA/8000
a=3Drtpmap:0 PCMU/8000
a=3Drtpmap:97 iLBC/8000
a=3Dfmtp:97 mode=3D30
a=3Drtpmap:3 GSM/8000
a=3Drtpmap:101 telephone-event/8000
a=3Dfmtp:101 0-16
a=3DsilenceSupp:off - - - -
a=3Dptime:20
a=3Dsendrecv

<------------->
--- (16 headers 16 lines) ---
Sending to 85.93.219.114 : 5060 (no NAT)
Using INVITE request as basis request -
6b6bfb5c3eb6137532b36d216e8c9948@85.93.219.122
Found peer 'tel.lu'
Found RTP audio format 8
Found RTP audio format 0
Found RTP audio format 97
Found RTP audio format 3
Found RTP audio format 101
Peer audio RTP is at port 85.93.219.122:10316
Found audio description format PCMA for ID 8
Found audio description format PCMU for ID 0
Found audio description format iLBC for ID 97
Found audio description format GSM for ID 3
Found audio description format telephone-event for ID 101
Capabilities: us - 0x8000e (gsm|ulaw|alaw|h263), peer -
audio=3D0x40e (gsm|ulaw|alaw|ilbc)/video=3D0x0 (nothing), combined -
0xe (gsm|ulaw|alaw)
Non-codec capabilities (dtmf): us - 0x1 (telephone-event), peer -
0x1 (telephone-event), combined - 0x1 (telephone-event)
Peer audio RTP is at port 85.93.219.122:10316
Looking for s in from-tellu (domain 212.88.133.153)
list_route: hop: <sip:85.93.219.114;ftag=3Das73ca530c;lr=3Don>

<--- Transmitting (no NAT) to 85.93.219.114:5060 --->
SIP/2.0 100 Trying
Via: SIP/2.0/UDP
85.93.219.114;branch=3Dz9hG4bKbcd7.7f0d18e6.0;received=3D85.93.219.114
Via: SIP/2.0/UDP
85.93.219.122:5060;branch=3Dz9hG4bK13c75fc4;rport=3D5060
Record-Route: <sip:85.93.219.114;ftag=3Das73ca530c;lr=3Don>
=46rom: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das73ca530c
To: <sip:20400371@tel.lu>
Call-ID: 6b6bfb5c3eb6137532b36d216e8c9948@85.93.219.122
CSeq: 102 INVITE
User-Agent: Asterisk PBX
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE,
NOTIFY
Supported: replaces
Contact: <sip:s@212.88.133.153>
Content-Length: 0


<--- Reliably Transmitting (no NAT) to 85.93.219.114:5060 --->
SIP/2.0 200 OK
Via: SIP/2.0/UDP
85.93.219.114;branch=3Dz9hG4bKbcd7.7f0d18e6.0;received=3D85.93.219.114
Via: SIP/2.0/UDP
85.93.219.122:5060;branch=3Dz9hG4bK13c75fc4;rport=3D5060
Record-Route: <sip:85.93.219.114;ftag=3Das73ca530c;lr=3Don>
=46rom: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das73ca530c
To: <sip:20400371@tel.lu>;tag=3Das47e79d4b
Call-ID: 6b6bfb5c3eb6137532b36d216e8c9948@85.93.219.122
CSeq: 102 INVITE
User-Agent: Asterisk PBX
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE,
NOTIFY
Supported: replaces
Contact: <sip:s@212.88.133.153>
Content-Type: application/sdp
Content-Length: 234

v=3D0
o=3Droot 20701 20701 IN IP4 212.88.133.153
s=3Dsession
c=3DIN IP4 212.88.133.153
t=3D0 0
m=3Daudio 7070 RTP/AVP 3 0 8
a=3Drtpmap:3 GSM/8000
a=3Drtpmap:0 PCMU/8000
a=3Drtpmap:8 PCMA/8000
a=3DsilenceSupp:off - - - -
a=3Dptime:20
a=3Dsendrecv


At this moment, I have a connection, but no sound.

<--- SIP read from 85.93.219.114:5060 --->
ACK sip:s@212.88.133.153 SIP/2.0
Record-Route: <sip:85.93.219.114;ftag=3Das73ca530c;lr=3Don>
Via: SIP/2.0/UDP 85.93.219.114;branch=3D0
Via: SIP/2.0/UDP
85.93.219.122:5060;branch=3Dz9hG4bK31206d61;rport=3D5060
Max-Forwards: 16
=46rom: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das73ca530c
To: <sip:20400371@tel.lu>;tag=3Das47e79d4b
Contact: <sip:Unknown@85.93.219.122>
Call-ID: 6b6bfb5c3eb6137532b36d216e8c9948@85.93.219.122
CSeq: 102 ACK
User-Agent: Asterisk PBX 1.6.0.6
Content-Length: 0


<--- SIP read from 85.93.219.114:5060 --->
ACK sip:s@212.88.133.153 SIP/2.0
Record-Route: <sip:85.93.219.114;ftag=3Das73ca530c;lr=3Don>
Via: SIP/2.0/UDP 85.93.219.114;branch=3D0
Via: SIP/2.0/UDP
85.93.219.122:5060;branch=3Dz9hG4bK65d8099e;rport=3D5060
Max-Forwards: 16
=46rom: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das73ca530c
To: <sip:20400371@tel.lu>;tag=3Das47e79d4b
Contact: <sip:Unknown@85.93.219.122>
Call-ID: 6b6bfb5c3eb6137532b36d216e8c9948@85.93.219.122
CSeq: 102 ACK
User-Agent: Asterisk PBX 1.6.0.6
Content-Length: 0


Reliably Transmitting (no NAT) to 85.93.219.114:5060:
BYE sip:Unknown@85.93.219.122 SIP/2.0
Via: SIP/2.0/UDP 212.88.133.153:5060;branch=3Dz9hG4bK44ee4aa2;rport
Route: <sip:85.93.219.114;ftag=3Das73ca530c;lr=3Don>
=46rom: <sip:20400371@tel.lu>;tag=3Das47e79d4b
To: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das73ca530c
Call-ID: 6b6bfb5c3eb6137532b36d216e8c9948@85.93.219.122
CSeq: 102 BYE
User-Agent: Asterisk PBX
Max-Forwards: 70
Content-Length: 0


---

<--- SIP read from 85.93.219.114:5060 --->
SIP/2.0 200 OK
Via: SIP/2.0/UDP
212.88.133.153:5060;branch=3Dz9hG4bK44ee4aa2;rport=3D5060
Record-Route: <sip:85.93.219.114;ftag=3Das47e79d4b;lr=3Don>
=46rom: <sip:20400371@tel.lu>;tag=3Das47e79d4b
To: "Unknown" <sip:Unknown@85.93.219.122>;tag=3Das73ca530c
Call-ID: 6b6bfb5c3eb6137532b36d216e8c9948@85.93.219.122
CSeq: 102 BYE
User-Agent: Asterisk PBX 1.6.0.6
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE,
NOTIFY
Supported: replaces, timer
Content-Length: 0


<------------->
--- (11 headers 0 lines) ---

Bye,

Joerg

--8DtChEGCcMdSgkU2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iHcEARECADcFAkpLdgkwFIAAAAAAFQAScGthLWFkZHJlc3NAZ251cGcub3Jnam9l
cmdAZG9yY2hhaW4ubmV0AAoJEI2OPuD3c7zg1lAAnj/eacvrCz4/YJH6nWeDBmE2
7++AAJ0e6OPO3cxQ/x3KTo/rRYJedEGsbw==
=GPTr
-----END PGP SIGNATURE-----

--8DtChEGCcMdSgkU2--
