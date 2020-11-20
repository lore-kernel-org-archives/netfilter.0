From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: Re: [ANNOUNCE] ipset 7.8 released
Date: Fri, 20 Nov 2020 09:07:27 +0100 (CET)
Message-ID: <alpine.DEB.2.23.453.2011200904550.19567@blackhole.kfki.hu>
References: <alpine.DEB.2.23.453.2011192141150.19567@blackhole.kfki.hu> <45rqn0n5-5385-o997-rn9q-os784nqrn9p@vanv.qr> <alpine.DEB.2.23.453.2011192237290.19567@blackhole.kfki.hu> <83oq5412-o0sq-5q31-s7o5-s0q28s12844@vanv.qr>
 <CAMQP0skDvG-vOAGmcx2kn21KYS9UgMfxND7NTi_X75GOnx_izw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMQP0skDvG-vOAGmcx2kn21KYS9UgMfxND7NTi_X75GOnx_izw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neutron Soutmun <neo.neutron@gmail.com>
Cc: Jan Engelhardt <jengelh@inai.de>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

On Fri, 20 Nov 2020, Neutron Soutmun wrote:

> For the ipset 7.9, I found the released download url is 
> http://ipset.netfilter.org/ipset-7.9.tar.bz2, however, it's previous 
> releases are in http://ftp.netfilter.org/pub/ipset/
> 
> The Debian has the tool to detect the new release with package watch [1] 
> file. Could you please consider uploading the new release to the 
> fpt.netfiler.org/pub/ipset also.

It has been fixed. Please note, I switched from md5 to sha512 at 
generating the checksum file, so the filename is changed accordingly to 
<packagename>.sha512sum.txt.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
