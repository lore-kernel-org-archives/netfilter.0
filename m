From: Julien VEHENT <julien@linuxwall.info>
Subject: Re: How to block proxing https connection ??
Date: Mon, 02 Mar 2009 18:16:34 +0100
Message-ID: <49AC1472.3050906@linuxwall.info>
References: <52da25120903012110p23d6d3b4l4a568eaf8af6c495@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms050304080009000808020009"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <52da25120903012110p23d6d3b4l4a568eaf8af6c495@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Piyush Joshi <pj.netfilter@gmail.com>
Cc: netfilter@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms050304080009000808020009
Content-Type: multipart/mixed;
 boundary="------------040900040605030100000003"

This is a multi-part message in MIME format.
--------------040900040605030100000003
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Piyush,

Piyush Joshi wrote:
> Dear All Expert,
>                          I am new to this list and have a question
> regarding netfilter. We are successfully running netfilter and now we
> are seeing that some users using malicious tools to go to the internet
> by creating https connection to outside proxy and open banned sites,
> Is there any patch for iptables to prevent this ??
> 

Well, considering you cannot inspect the content of an HTTPS connection,
the *best* way to do that is to allow HTTPS connection only to websites
you know and want to authorize.

Your users must use a proxy you control to go on the Internet. Then, you
can just filter HTTPS website using a white list of authorized ones.

Note that, from the Netfilter point of view, HTTP and HTTPS connections
are only seen as TCP connection, no difference is made between them.

Regards,
Julien

> 
> Thanks Regards
> 
> Piyush Joshi
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--------------040900040605030100000003
Content-Type: text/x-vcard; charset=utf-8;
 name="julien.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="julien.vcf"

begin:vcard
fn:Julien Vehent
n:Vehent;Julien
email;internet:julien@linuxwall.info
tel;cell:+33 6 23 86 58 73
note;quoted-printable:Linuxwall Root Certificate :=0D=0A=
	http://www.linuxwall.info/files/ca-linuxwall.crt=0D=0A=
	=0D=0A=
	Personal Certificate :=0D=0A=
	http://www.linuxwall.info/files/JulienVehent.pem
x-mozilla-html:FALSE
url:http://www.linuxwall.info
version:2.1
end:vcard


--------------040900040605030100000003--

--------------ms050304080009000808020009
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
SAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYF
Kw4DAgcwDQYIKoZIhvcNAwICASgwgbgGCSsGAQQBgjcQBDGBqjCBpzCBoTELMAkGA1UEBhMC
RlIxDzANBgNVBAgTBkZyYW5jZTEOMAwGA1UEBxMFUGFyaXMxEjAQBgNVBAoTCUxpbnV4d2Fs
bDE5MDcGA1UEAxMwTGludXh3YWxsIENlcnRpZmljYXRlIEF1dGhvcml0eSBSb290IENlcnRp
ZmljYXRlMSIwIAYJKoZIhvcNAQkBFhNyb290QGxpbnV4d2FsbC5pbmZvAgECMIG6BgsqhkiG
9w0BCRACCzGBqqCBpzCBoTELMAkGA1UEBhMCRlIxDzANBgNVBAgTBkZyYW5jZTEOMAwGA1UE
BxMFUGFyaXMxEjAQBgNVBAoTCUxpbnV4d2FsbDE5MDcGA1UEAxMwTGludXh3YWxsIENlcnRp
ZmljYXRlIEF1dGhvcml0eSBSb290IENlcnRpZmljYXRlMSIwIAYJKoZIhvcNAQkBFhNyb290
QGxpbnV4d2FsbC5pbmZvAgECMA0GCSqGSIb3DQEBAQUABIIBAHqyZnTzgjPLUusZz49/mrDg
l21DW44GTOR8km37XPK7JYisqkV9GBUuCTNzIBdMNpdcERj9DxllPUx0dr/tNWwnVU2qUMS8
yDfYBv6/8bZHT5Yh5VdQ+ypNoTVbg/IurhjjLLHebON/GxOlqIe4I0ArqWeAGD4sFdH+BZh3
lZKswRsxkl/aE7EfSZMS0CXavwjcq1c/Z08CFLDYDAQGRehlmqq4+rjkRdy6XMK6jenlA4pO
NwyGVJQjwX5+TsNr+GMnw74N9Qifw/slWBYFcBSK+LGtXgw9vJ/0Ppul2Ykj8XYj0ki+D5OE
LBnZPOIqMmCsUFhcsu0hl0rXm83sGAsAAAAAAAA=
--------------ms050304080009000808020009--
