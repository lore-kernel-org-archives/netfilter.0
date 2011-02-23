From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset -R
Date: Wed, 23 Feb 2011 20:20:11 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1102232009001.16917@blackhole.kfki.hu>
References: <4D645BC7.7030306@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D645BC7.7030306@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

On Wed, 23 Feb 2011, Mr Dash Four wrote:

> When I execute 'ipset -R < some_file' ipset ignores lines with the '-D' option
> specified. Is that intentional?

Deletion is not ignored in restore mode. The commands which are not 
allowed in restore mode are restore, help and version.

> I am trying to execute a script file creating 'pinholes' in (previously built)
> ipsets, but, as it stands, I have to execute a shell script containing 'ipset
> -D' for every pinhole/range I am interested in, which isn't very convenient.
> Ideally I'd like for ipset to honour the '-D' option in a restore file.
> 
> The reason I need this is because I am defining ipset ranges coming from the
> geoip database and later, with the '-D' option in a script, I am trying to
> create the pinholes - more convenient since ipset has a very nice feature to
> re-adjust the ipset ranges automatically after delete, instead of me using
> endless '-A' statements adding the resulting ipset sub-ranges.

The iptreemap type of ipset 4.x had the feature you are referring here.

The iptree and iptreemap types are not implemented in ipset 5.x. However 
you can achieve the same effect by using two sets, the first one for the 
pinholes and the second one for the networks.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
