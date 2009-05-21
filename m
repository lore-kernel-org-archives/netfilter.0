From: Miguel Ghobangieno <mikeeusa@yahoo.com>
Subject: Re:(ebtables log) (DHCP) Ebtables ruleset isn't working, any ideas?
Date: Thu, 21 May 2009 10:19:46 -0700 (PDT)
Message-ID: <559852.1656.qm@web44806.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1242926386; bh=itHIQ8z86RD6Qzc6nMRsVtnFBzUnFAyuQeEjvdnFFvA=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=tr8zVjr4R8Eag4KnVstVyWtzw7CHmq5nwf727vMDdbHEsOebreg8qQ4fD+BI9jXTe42vFXFXeteP8B9a5HocKw42NvjeSwvA4TsqOp5Ajp9urv4VTPNMTarBPDgumF/1bcf1aJz0TIYNNBXzpy3hAGQaryaqCjIv2tWbfMGSxko=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>


I can't fix it. I don't know how.

Here is the config

[laptop]--->[eth1](firewall)(br0 (bridge interface)[eth0]---router
******************(firewall)[eth2 (management interface)]-----A

Eth2 has an IP address.
Eth1 and Eth0 are just for the bridge.
Eth2 is ment to be connected to whatever segment the admin wants it on: it's so he can ssh into the firewall and configure things: that is supposed to be it's only use.

--- On Thu, 5/21/09, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:

> From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
> Subject: Re:(ebtables log) (DHCP) Ebtables ruleset isn't working, any ideas?
> To: "Miguel Ghobangieno" <mikeeusa@yahoo.com>
> Cc: netfilter@vger.kernel.org
> Date: Thursday, May 21, 2009, 5:08 PM
> On Thu, 21 May 2009, Miguel
> Ghobangieno wrote:
> 
> > Eth2 is the management interface. The box should be
> sending whatever 
> > comes in via eth1 to eth2.
> 
> Your network setup makes no sense to me. Good luck in
> fixing your 
> configuration.
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
> --
> To unsubscribe from this list: send the line "unsubscribe
> netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


      

