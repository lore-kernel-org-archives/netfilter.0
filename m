From: Michael Deegan <michael@deegan.id.au>
Subject: Re: wiki documentation error (derp, false alarm...)
Date: Mon, 26 Jun 2023 08:51:02 +0800
Message-ID: <ZJjg9hFCfLe07dDc@deegan.id.au>
References: <ZJfigQmqgt3X5pnW@deegan.id.au>
 <20230625220427.2d024d2c37d2b5a266f9ceb6@plushkava.net>
 <om-be6P8E-nyvhRJhp7MDC0HyKHBqwlh1Ln3q4CJCTnJSXPdwyfOlF9LjVEq42Dl6jNSX7Otwlu329rv1cudQcWn4AOUWXTF2RjMkRf9eto=@proton.me>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <om-be6P8E-nyvhRJhp7MDC0HyKHBqwlh1Ln3q4CJCTnJSXPdwyfOlF9LjVEq42Dl6jNSX7Otwlu329rv1cudQcWn4AOUWXTF2RjMkRf9eto=@proton.me>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Eric <evil.function@proton.me>
Cc: Kerin Millar <kfm@plushkava.net>, netfilter@vger.kernel.org

Morning,

On Sun, Jun 25, 2023 at 09:50:44PM +0000, Eric <evil.function@proton.me> wr=
ote:
> >=20
> >=20
> > The syntax of the ruleset is valid. Please ensure that you have not ina=
dvertently introduced a linefeed character anywhere within a given set elem=
ent (immediately before or after a comma is fine). Also, please convey the =
error message that you are encountering.
>=20
> Yup, like Kerin says, works for me (I picked the 'input' chain just becau=
se it's easy).

Okay, I worked it out. I had originally cut and pasted rules from elinks
running in a screen session on my router PC (because of course my local
browser had no networking...). The resulting error message that probably
would have gone away had I found every nonbreaking space:

    homerouter.nft-rules:33:48-48: Error: syntax error, unexpected junk, ex=
pecting colon
             ip protocol . th dport vmap { tcp . 22=C2=A0: accept, udp . 53=
=C2=A0: accept, tcp . 53=C2=A0: accept, udp . 67=C2=A0: accept}
                                                   ^

"expecting colon" suggested to me that whitespace was invalid at that
location, hence my original (misguided) complaint.

Hexdump of the line in question:

    00000000  20 20 20 20 20 20 20 20  20 69 70 20 70 72 6f 74  |         i=
p prot|
    00000010  6f 63 6f 6c 20 2e 20 74  68 20 64 70 6f 72 74 20  |ocol . th =
dport |
    00000020  76 6d 61 70 20 7b 20 74  63 70 20 2e 20 32 32 c2  |vmap { tcp=
 . 22.|
    00000030  a0 3a 20 61 63 63 65 70  74 2c 20 75 64 70 20 2e  |.: accept,=
 udp .|
    00000040  20 35 33 c2 a0 3a 20 61  63 63 65 70 74 2c 20 74  | 53..: acc=
ept, t|
    00000050  63 70 20 2e 20 35 33 c2  a0 3a 20 61 63 63 65 70  |cp . 53..:=
 accep|
    00000060  74 2c 20 75 64 70 20 2e  20 36 37 c2 a0 3a 20 61  |t, udp . 6=
7..: a|
    00000070  63 63 65 70 74 7d 0a                              |ccept}.|

Hmm, C2 A0 is...nonbreaking space! Let's look at the wiki HTML source
(wordwrapping is mine)...

    ip protocol .  th dport vmap <span class=3D"o">{</span> tcp .  <span
    class=3D"m">22</span>&#160;: accept, udp .  <span
    class=3D"m">53</span>&#160;: accept, tcp .  <span
    class=3D"m">53</span>&#160;: accept, udp .  <span
    class=3D"m">67</span>&#160;: accept<span class=3D"o">}</span> <span
    class=3D"o">}</span>

Oh, there you go, it's mediawiki's fault for randomly replacing spaces with
nonbreaking spaces. I guess some browsers (elinks) preserve whitespace when
copying text, whereas others don't (chromium).

> To decipher the parts of the match expression, this might help (scan for =
"transport header").
>=20
> https://wiki.nftables.org/wiki-nftables/index.php/Matching_packet_headers

Ta, I'll (re)read this in the hope of getting better understanding of the
grammar, which I'll need to do if I'm to work out why changing my table from
"ip" to "inet" at the top of my ruleset breaks everything even though the
ruleset loads fine. =F0=9F=98=85

Thanks for humouring me,

-MD

--=20
---------------------------------------------------------------------------=
--
Michael Deegan               Hugaholic              https://www.deegan.id.a=
u/
------------------------  Jung, zr jbeel?  --------------------------------=
--
