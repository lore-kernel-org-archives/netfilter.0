From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: dyn. SNAT based on different source addresses?
Date: Tue, 07 Oct 2014 22:56:58 +0300
Message-ID: <5434458A.2030701@ngtech.co.il>
References: <CAFNHiA83zPCE9KW7U5q7WdPdoJkvkeh0zwF+q6OWD96yWrE8pA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <CAFNHiA83zPCE9KW7U5q7WdPdoJkvkeh0zwF+q6OWD96yWrE8pA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Meike Stone <meike.stone@googlemail.com>, netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I am still unsure why do you need the complications?
A basic masquerade rule should be good enough to work with a fileserver.
Maybe you are having other settings wrong.
You can use a routing rule to use a specific device with specific IP
for a specific src.
iptables do not really supports dynamic NAT rules by default.

Eliezer

On 10/07/2014 09:27 PM, Meike Stone wrote:
> If terminal servers are not located in 192.168.1.0 but in
> different networks connected via router, I have a problem ....
> 
> Does anyone have a clue?
> 
> Thanks Meike

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUNEWKAAoJENxnfXtQ8ZQU8FsIAITvleIR4VJzB4WQZkmZSEcf
f5Yi1LvH+SR8xDdApDmO5VYXVclpWGPO+4WhlqVhVAyFxkSGes8PfwnTBvc8XmPH
mdk6xruSTi0XzfeNm+t5HfMeeTWn1xxfu8CyU9PHpJptXTAeJ0qpVNSoRGbpL+Tm
/+hFh9ufXJzq4dVVOLi/lFHQPr1EJ8weBIeejRu4hOBzEvSv0b+we+aHpc9tYQX0
lFVyqiQyz1C/wF41gwVxUn5AalnHjjqms7Flz5Ut1h3HRmPNXcpEJ8vbGEH1BxIJ
AIO4MsC7J1Y4GwDOlJsJKvyiyB18QjiDeoNkE8IBHCMsOZ30xQKa75/3lT40mBk=
=VFzh
-----END PGP SIGNATURE-----
