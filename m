From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: RE: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Wed, 8 Jun 2022 15:56:45 +0200 (CEST)
Message-ID: <eef7aaa0-e8f4-2672-956b-47ec49547b33@netfilter.org>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com>  <mail.629a388a.7bba.0e9843742ea45568@storage.wm.amazon.com>  <010201812a6ce183-1a849304-791a-4874-9668-23f871060bac-000000@eu-west-1.amazonses.com>  <mail.629a3f4f.4e0b.2e3e82745c98ed1d@storage.wm.amazon.com>
  <06924b12-8664-1e96-2a0b-d3711bbb67d7@thelounge.net>  <010201812a875150-65c17845-7e32-4eac-8c72-28bf90279b54-000000@eu-west-1.amazonses.com>  <CANGix0CNMH0yhVSxaVqX5DnuZs0oNc6fKMDX=BAm=+PzhFVKSg@mail.gmail.com>  <CANGix0Ddy_BW5wgUbmEmMiJajs_FxEFRcYDPuzNL3aaBxnCtoQ@mail.gmail.com>
  <mail.629a519e.0cd7.3039eb4576cddb5d@storage.wm.amazon.com>  <010201812aced64c-cfcce59b-f83c-4892-b6eb-43b9b0a2fc64-000000@eu-west-1.amazonses.com>  <2ae6f4de-e03c-1fab-c1fa-68915b3837d8@netfilter.org>  <mail.629aff89.73ff.3ae87c7606a48613@storage.wm.amazon.com>
  <010201812d7632b0-1fa6a570-192e-423c-ba87-558c0d650ac9-000000@eu-west-1.amazonses.com>  <4df0f9c3-5617-e798-56d9-d24725250906@thelounge.net>  <efe54ba7-fca1-e95-2ded-d83c5e144987@netfilter.org>  <mail.629b6720.3649.7e2693125cedf4ea@storage.wm.amazon.com>
 <010201812f0adc45-929753b5-ff42-41a8-a922-fdb605cde46f-000000@eu-west-1.amazonses.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <010201812f0adc45-929753b5-ff42-41a8-a922-fdb605cde46f-000000@eu-west-1.amazonses.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Riha <stefan@sriha.net>
Cc: Reindl Harald <h.reindl@thelounge.net>, Alex Buie <alex.buie@datto.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sat, 4 Jun 2022, Stefan Riha wrote:

> >> It seems people can come to wrong conclusions due to the syntax which is used at 
> different systems with different internal meanings. The feature cannot of 
> course be changed, but maybe it'd worth to update the documentation.
> 
> I see, are you thinking of adding something like this to the manpage:
> 
> -s --source address[/mask][,...]

> Source specification. Address can be either a network name, a hostname, 
> a network IP address (with /mask), or a plain IP address. It can also be 
> a plain IP address with /mask, in which case the mask will be applied to 
> the plain IP address to compute the associated network IP address. Note 
> that in the latter case, the plain IP address is automatically 
> reinterpreted (i.e. modified or re-calculated) by the system as a 
> network IP address.

The mask is unconditionally applied to the IP address. Please note, we 
support non-continuous netmasks too. So something like this describes 
better how the input is handled:

-s, --source address[/mask][,...]

Source specification. Address can be either a network name, a hostname, a 
network IP address (with /mask), or a plain IP address. Hostnames will be 
resolved  once  only, before the rule is submitted to the kernel.  Please 
note that specifying any name to be resolved with a remote query such  as 
DNS  is  a  really bad idea.  The mask can be either an ipv4 network mask 
(for iptables) or a plain number, specifying the number  of  1's  at  the 
left  side  of the network mask.  Thus, an iptables mask of 24 is 
equivalent to 255.255.255.0. When specified, the mask always applied to 
the network IP address part before processing the rule. ...

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
