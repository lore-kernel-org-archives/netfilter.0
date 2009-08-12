From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Poor upload speed with NAT
Date: Wed, 12 Aug 2009 09:03:16 -0700
Message-ID: <4A82E7C4.5090205@shorewall.net>
References: <1f4ef0970908101443i28bf4c1hc6b280d4096fd100@mail.gmail.com> <1f4ef0970908120702h76814835rb475a09258efb812@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1f4ef0970908120702h76814835rb475a09258efb812@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Brown <sbrown25@gmail.com>
Cc: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Steve Brown wrote:
>> Is this kind of performance drop to be expected w/ netfilter and
>> iptables?  Any suggestions on things I can do to increase performance?
>
> Am I to assume by the silence of the list that this performance issue
> is not going to be resolved?  Are there any other steps I can take to
> boost upload speeds?

At a root shell prompt, type "ip -s link ls" and look at the error
rates, especially on your LAN interface. I suspect that will point you
in the right direction.

- -Tom
- --
Tom Eastep        \ When I die, I want to go like my Grandfather who
Shoreline,         \ died peacefully in his sleep. Not screaming like
Washington, USA     \ all of the passengers in his car
http://shorewall.net \________________________________________________
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkqC58QACgkQO/MAbZfjDLLtlACdFtnrCwS/Gvx+/TlLmCA/jgru
Z60AnA/cPengcIo+L0P6tezkh4Lh0Cm9
=MRew
-----END PGP SIGNATURE-----
