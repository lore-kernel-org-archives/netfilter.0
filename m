From: Joerg Dorchain <joerg@dorchain.net>
Subject: Re: nf_conntrack_sip problem
Date: Wed, 1 Jul 2009 22:56:16 +0200
Message-ID: <20090701205616.GE9285@Redstar.dorchain.net>
References: <20090701113701.GZ9285@Redstar.dorchain.net> <4A4B509C.3080600@trash.net> <20090701144321.GB9285@Redstar.dorchain.net> <4A4B7B4D.5090900@trash.net> <20090701161029.GC9285@Redstar.dorchain.net> <4A4B8BD5.6060907@trash.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kSOhxpxUsM1s2qz/"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorchain.net;
	s=redstar; t=1246481777;
	bh=zxkvC43Mz+MusNGRdWGERzXmMm/IyCmP7tJe2Sb865E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=pFd7OTuJaK+AWPwwLG2D65hF1T2Mf+jR62l4asN22UNXN8DlK8jZ+YoGI2TcV78s9
	 TMm8SPSTZSMPjLhznYcdv09lf/nuZAzmQQLBJLNVLPxCG90I3QVPVaqXqlJ3UpONeD
	 HMgR4nuWVvplJAmLTch3bLcvmEFpqundQnHIlj9s=
Content-Disposition: inline
In-Reply-To: <4A4B8BD5.6060907@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org


--kSOhxpxUsM1s2qz/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2009 at 06:16:21PM +0200, Patrick McHardy wrote:
> Joerg Dorchain wrote:
>> On Wed, Jul 01, 2009 at 05:05:49PM +0200, Patrick McHardy wrote:
>>>> I tried this. Actually, it makes things worse. Now Asterisk
>>>> complains: [Jul  1 16:17:46] WARNING[20516]: chan_sip.c:1787 =20
>>>> __sip_xmit:
>>>> sip_xmit of 0x86f8de0 (len 384) to 217.10.79.9:5060 returned -1:
>>>> Operation not permitted
>>>>
>>>> (Trying to register with sipgate.de; registration in parallel
>>>> with tel.lu seems to work)
>>> sipgate needs sip_direct_media=3D0 since the RTP streams originate from
>>> a seperate cluster.
>>
>> I loaded the module with sip_direct_signalling=3D0 and
>> sip_direct_media=3D0 to get these messages.
>
> That should be fine. Possibly related to NAT without the helper,
> see below.
>
>>> Did you load the NAT module before the conntrack module?
>>
>> I did not load the nat modules at all. As said, I am only
>> interested in dynamically accepting the rtp streams.
>>>> nf_conntrack_sip without options on a trial incoming call however give=
s:
>>>>
>>>> # conntrack -E expect
>>>> 180 proto=3D17 src=3D85.93.219.114 dst=3D212.88.133.153 sport=3D0 dpor=
t=3D7070
>>>> 180 proto=3D17 src=3D85.93.219.114 dst=3D212.88.133.153 sport=3D0 dpor=
t=3D7071
>>
>> Also for tel.lu the expected IP should be 85.93.219.122.
>
> It takes the addresses from the SDP payload. The gateway seems to be
> handling RTP stream with a different server as well.

Aehm, 85.93.219.122 is the address from the SDP payload for the
RTP stream as attached. 85.93.219.114 is is address of where the SIP REGIST=
ER
is sent to.

I will try again with only sip_direct_media=3D0.
>
>> *nat
>> :PREROUTING ACCEPT [1385:93589]
>> :POSTROUTING ACCEPT [319:26979]
>> :OUTPUT ACCEPT [5114:401834]
>> -A PREROUTING ! -i ppp0 -p udp -m udp --dport 5060 -j REDIRECT=3D20
>> -A POSTROUTING -o ppp0 -j MASQUERADE=3D20
>> COMMIT
>
> So you are using NAT? You *need* the NAT helper in that case for
> remapping clashing ports.

I intend to to so. Currently I am only talking about packet send
and received from the host in question by local sockets, not
about forwarded packets. I.e. the asterisks runs on the host
intended to play SIP gateway, but also masqerading router for
e.g. http and other protocols.

Bye,

Joerg

--kSOhxpxUsM1s2qz/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iHcEARECADcFAkpLzXAwFIAAAAAAFQAScGthLWFkZHJlc3NAZ251cGcub3Jnam9l
cmdAZG9yY2hhaW4ubmV0AAoJEI2OPuD3c7zg9QwAn1WhSLu6SfEul7ZQnrsd+qSy
AyPhAJ9GpewdNw9FziPxabdW6p4pizQxiw==
=xEFK
-----END PGP SIGNATURE-----

--kSOhxpxUsM1s2qz/--
