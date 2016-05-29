From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: No sign of INVALID packet , LOGS DROP but not reason
Date: Sun, 29 May 2016 19:52:02 +0200
Message-ID: <7ab10402-26d3-62de-4cd5-f4b4c2809c50@familie-kuntze.de>
References: <1464518566817.52562@evry.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="c2SUExqQ2CXrIU0urivMCkUVp1A9SfIO4"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1464518566817.52562@evry.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?UTF-8?Q?Andr=c3=a9_Paulsberg-Csibi_=28IBM_Consultant=29?= <Andre.Paulsberg-Csibi@evry.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--c2SUExqQ2CXrIU0urivMCkUVp1A9SfIO4
Content-Type: multipart/mixed; boundary="2t2HJqCsrsOtr2kHQepFHq2QK0KgJX42r"
From: Noel Kuntze <noel@familie-kuntze.de>
To: =?UTF-8?Q?Andr=c3=a9_Paulsberg-Csibi_=28IBM_Consultant=29?=
 <Andre.Paulsberg-Csibi@evry.com>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-ID: <7ab10402-26d3-62de-4cd5-f4b4c2809c50@familie-kuntze.de>
Subject: Re: No sign of INVALID packet , LOGS DROP but not reason
References: <1464518566817.52562@evry.com>
In-Reply-To: <1464518566817.52562@evry.com>

--2t2HJqCsrsOtr2kHQepFHq2QK0KgJX42r
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 29.05.2016 12:42, Andr=C3=A9 Paulsberg-Csibi (IBM Consultant) wrote:
> Hi ,
>
> =20
> I have come across something that I am starting to think is a bug ,
>
> but before I start upgrading and other works lets see if I missed somet=
hing !
>
>
> I have log entries like these
>
> May 28 10:47:13 zotac kernel: INVALID-STATE IN=3Dvlan0 OUT=3D MAC=3D# S=
RC=3D189.222.120.167 DST=3D# LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D116 ID=
=3D5745 PROTO=3DTCP SPT=3D21735 DPT=3D56715 WINDOW=3D0 RES=3D0x00 ACK RST=
 URGP=3D0
>
>
> I have used
>
> conntrack -E -o timestamp
>
> and added logging with
>
> echo 255 > /proc/sys/net/netfilter/nf_conntrack_log_invalid
>
>
>  from what I can see there is no "kernel: nf_ct_tcp: " entries at the m=
oment of the DROP of ACK RST
>
> and there is an entry in conntrack for this session that should allow A=
CK RST to terminate that session .
>
>
> when I do :
>
> zotac:~ # journalctl | grep nf_ct | grep " ACK RST " | grep -v " ACK RS=
T FIN "
> May 26 22:35:31 zotac kernel: nf_ct_tcp: invalid RST IN=3D OUT=3D SRC=3D=
# DST=3D81.233.185.232 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D148=
41 PROTO=3DTCP SPT=3D7905 DPT=3D56206 SEQ=3D2244837322 ACK=3D835716258 WI=
NDOW=3D0 RES=3D0x00 ACK RST URGP=3D0
>
> I only find ONE result , but when I do :
>
> zotac:~ # journalctl | grep INVALID | grep " ACK RST " | grep -v " ACK =
RST FIN " | grep "May 2[678]" | wc
>    1590   38480  412611
>
>
> I should have atleast 1000 + more nf_ct log entries to match all my INV=
ALID ACK RST log entries .
>
>
> I have tried to spot some issues with TCPDUMPs , but all packets seems =
like normal ACK RST when I try to get same result "manually" by sending S=
YN packets "I just used "telnet IP PORT" to a port I found in my log ...
>
> I see the ACK RST telling me the port is blocked and I can't seem to fi=
nd any issues with the packet !
>
>
>
> Best regards
> Andr=C3=A9 Paulsberg-Csibi
> Senior Network Engineer
> Fault Handling
> IBM Services AS
> andre.paulsberg-csibi@evry.com
Hello Andr=C3=A9,

The TCP flag combination "ACK RST URGP=3D0" is invalid, I think. The RFC =
(RFC 6093) about the urgent pointer
is pretty clear about that.

--=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--2t2HJqCsrsOtr2kHQepFHq2QK0KgJX42r--

--c2SUExqQ2CXrIU0urivMCkUVp1A9SfIO4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXSyxGAAoJEDg5KY9j7GZY5OcP/3Wf9zn3HphUI3nF2Qxl9ard
tUHlEGCtd9hIsuGtN8PKVXPcgz/AoIzA/sAPe+/kl03Y5pJKPGGBKfuzfla5kv15
tjAPTfQND+ro3EbsUWvLjhZ2kzc56lD1VVCtubMpyoiq4DoCnyC6vYAEwmZ2FEQj
jl9fidTPCcv6s0WeT4h2hFFgAJxNqq7ZI+rLzkgq5VSLdiCjLr9e6fPVsRiM1tjs
FwIfak33rq1rGuO+6RUpATXTd1UIyecsQtenL0SDse/D110FfmGWhPrURSxx8ICc
WdlRMzghizEy8uJ4nKNxCI3i9gktylazKW0I4PbLZv/ish+n53bTbYW7P4bypLra
eXY/GwAveEkANmpGzZBBVPa556P5Pyi+5nmE/l8p/jGAZffaWTI2aY7y1rzfZkI0
KojLN+WxVx11u1OM0IDKFmhiB08k21acJOz4YFdBQfwJ++1ggFAuqz6PiM4PWQau
6mYigp+PfN29vWloq4ZvCjZdzOq5fNnivNObOhntl+iDzzlB9VmzNR7lEKP8A2IK
/DL8XhOEQu06NeBothh8v8iqYCxfmwyXVhOhHP//742ejBIyf3796OwmHjRG4fSu
3XhL00MpQxC+JMG6mYTgzx/VNzgZWETiNU7fRI/Kq+k7UQ5/Kw36syYhO/tGnPSN
FCrozojVL7ScisPoKBET
=jy56
-----END PGP SIGNATURE-----

--c2SUExqQ2CXrIU0urivMCkUVp1A9SfIO4--
