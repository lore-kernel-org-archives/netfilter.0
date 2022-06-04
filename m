From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: RE: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Sat, 4 Jun 2022 13:34:34 +0200 (CEST)
Message-ID: <84c9ce8b-68d8-86e5-c3be-8158b7175642@netfilter.org>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com>  <010201812a366a81-2f2bc7f3-e142-4807-9742-bfa7b19dd468-000000@eu-west-1.amazonses.com>  <e2ba2738-2eff-3e97-a389-77abd17664dd@thelounge.net>  <mail.629a2dfb.57ab.496a0a414c9495b2@storage.wm.amazon.com>
  <010201812a43a0d9-c4953858-f0e1-48db-a7a3-420d53a11cd7-000000@eu-west-1.amazonses.com>  <df64386a-5daf-6f97-3d37-b0c9b7c25537@thelounge.net>  <mail.629a3289.7fbb.1b2912350cfc7c1b@storage.wm.amazon.com>  <010201812a556c50-7856ee86-1a5a-4135-8acf-869a930d54c8-000000@eu-west-1.amazonses.com>
  <768e4d99-0c50-01af-4434-20378c06a3cf@thelounge.net>  <mail.629a35d7.2a64.4a0b184f3a85fa1c@storage.wm.amazon.com>  <010201812a625427-9b51500d-3126-4b6f-95d0-d71702c349a7-000000@eu-west-1.amazonses.com>  <b6945516-3120-24f0-9990-294f1653c9a4@thelounge.net>
  <mail.629a388a.7bba.0e9843742ea45568@storage.wm.amazon.com>  <010201812a6ce183-1a849304-791a-4874-9668-23f871060bac-000000@eu-west-1.amazonses.com>  <mail.629a3f4f.4e0b.2e3e82745c98ed1d@storage.wm.amazon.com>  <06924b12-8664-1e96-2a0b-d3711bbb67d7@thelounge.net>
  <010201812a875150-65c17845-7e32-4eac-8c72-28bf90279b54-000000@eu-west-1.amazonses.com>  <CANGix0CNMH0yhVSxaVqX5DnuZs0oNc6fKMDX=BAm=+PzhFVKSg@mail.gmail.com>  <CANGix0Ddy_BW5wgUbmEmMiJajs_FxEFRcYDPuzNL3aaBxnCtoQ@mail.gmail.com> 
 <mail.629a519e.0cd7.3039eb4576cddb5d@storage.wm.amazon.com>  <010201812aced64c-cfcce59b-f83c-4892-b6eb-43b9b0a2fc64-000000@eu-west-1.amazonses.com>  <2ae6f4de-e03c-1fab-c1fa-68915b3837d8@netfilter.org>  <mail.629aff89.73ff.3ae87c7606a48613@storage.wm.amazon.com>
 <010201812d7632b0-1fa6a570-192e-423c-ba87-558c0d650ac9-000000@eu-west-1.amazonses.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <010201812d7632b0-1fa6a570-192e-423c-ba87-558c0d650ac9-000000@eu-west-1.amazonses.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Riha <stefan@sriha.net>
Cc: Alex Buie <alex.buie@datto.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, "h.reindl@thelounge.net" <h.reindl@thelounge.net>

On Sat, 4 Jun 2022, Stefan Riha wrote:

> >> Read the manpage: "Address can 
> be either a network name, a network IP address (with /mask), or a plain IP 
> address".
> 
> The manpage states that the input can be either of three:
> 
> 1) a network name
> 2) network IP address (with /mask)  (i.e. 10.0.0.0/24 in the example)
> 3) a plain IP address (i.e. 10.0.0.2 or equivalently 10.0.0.2/32 in the 
> example)
> 
> and the input 10.0.0.2/24 is neither of those three (it's a contextually 
> inappropriate combination of 2 and 3). It therefore should be rejected, 
> but instead it is reinterpreted to be of type 2), i.e. a network IP 
> address (with /mask). What do you think?
> 
> My point is, I think this re-interpretation dangerous. I think the 
> appropriate behaviour would be to error on incorrect/ambiguous input.
> 
> >> The input is interpreted accordingly, therefore 10.0.0.2/24 is 
> equal to 10.0.0.0/24.
> 
> But would you agree that if the input isn't of the 3 three types 
> explicitly allowed in the manpage, it should be rejected? The word 
> "either" in the manpage gives the impression that the three options are 
> mutually exclusive, and not a contextually inappropriate mixture.

The second form is interpreted as a network IP address and mask. The input 
is normalized by default, so if the IP address is not the network IP 
address, that is automatically converted to it.

You may say that it's not appropriate, dangerous, incorrect. But that is 
how the system works for decades. Nothing can be changed about it, because 
it could break configurations which rely on this behaviour.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
