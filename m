From: Miguel Ghobangieno <mikeeusa@yahoo.com>
Subject: Re: (DHCP) Ebtables ruleset isn't working, any ideas?
Date: Wed, 20 May 2009 06:21:49 -0700 (PDT)
Message-ID: <938754.69944.qm@web44813.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1242825709; bh=staln3ir+y5lxs4rlEURYxO90Np1yklZF+Nx7dgKIik=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:MIME-Version:Content-Type; b=biMEP0c8rE3CfgWJBKrVTWN2PtHUKVbGjmM9wZ9SsALsIm5Orn5xtM92GEdLdMYa+Zo0s03Sk6VFTyC5z5eioCWq3UQ6wiHWwopYNHAAY1r+L937/aLTKySgSe00zjXBf/xccAR08E06Q3gA2kJsK9OTK1nP/kYDWDSWwCyf7Ng=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


Kernel (newest stable w/grsecurity patch):

2.6.29.3-grsec

title           Debian GNU/Linux, kernel 2.6.29.3-grsec
#lock
root            (hd0,0)
kernel          /boot/vmlinuz-2.6.29.3-grsec root=/dev/sda1 ro quiet
initrd          /boot/initrd-2.6.29.3.img


Ebtables (Debian ancient!)
ebtables v2.0.8-2 (May 2007)

--- On Wed, 5/20/09, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:

> From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
> Subject: Re: (DHCP) Ebtables ruleset isn't working, any ideas?
> To: "Miguel Ghobangieno" <mikeeusa@yahoo.com>
> Cc: netfilter@vger.kernel.org
> Date: Wednesday, May 20, 2009, 12:35 PM
> On Wed, 20 May 2009, Miguel
> Ghobangieno wrote:
> 
> > I can't get DHCP to work through the firewall, I've
> tried everything, even:
> > ebtables -A FORWARD -p IPv4 --ip-sport 67:68 -j
> ACCEPT
> > ebtables -A FORWARD -p IPv4 --ip-dport 67:68 -j
> ACCEPT
> > 
> > Other things I tried:
> > ebtables -A FORWARD -i eth0 -o eth1 -p 0x800 --ip-src
> 192.168.0.1 --ip-proto udp --ip-sport 67:68 -j ACCEPT
> > ebtables -A FORWARD -i eth1 -o eth0 -p 0x800 --ip-dst
> 255.255.255.255/255.255.255.255 --ip-proto udp --ip-dport
> 67:68 -j ACCEPT
> > 
> > and before that:
> > ebtables -A FORWARD -p 0x800 --ip-src 192.168.0.1
> --ip-proto udp --ip-sport 68 -j ACCEPT
> > ebtables -A FORWARD -p 0x800 --ip-dst 192.168.0.1
> --ip-proto udp --ip-dport 67 -j ACCEPT
> 
> What is your kernel version? What is your ebtables
> version?
> 
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu,
> kadlec@mail.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear
> Physics
>           H-1525 Budapest 114,
> POB. 49, Hungary
> 


      

