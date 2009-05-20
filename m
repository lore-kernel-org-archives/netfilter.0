From: Miguel Ghobangieno <mikeeusa@yahoo.com>
Subject: Re: (DHCP) Ebtables ruleset isn't working, any ideas?
Date: Wed, 20 May 2009 05:32:32 -0700 (PDT)
Message-ID: <545248.94047.qm@web44810.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1242822752; bh=smIyQ/YKSV0CCqG4v0M+9hEqu48jr4aHNOOqvYzHnyg=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:MIME-Version:Content-Type; b=tZU7E7WXHL5YbCmfnv9DYsxfi0yZHQoMRG1KWS9U3CVx3h++oY5VL5A+1jTIPzOAdxC6q1N7rUyq+caUX7VrEWfC8Oz0n5og/qLx3jqgUyHeAPOjbDTFe5KKWbfrlVCxo/n4WsUwVWVVzmgJiFoBaSKcrK3Ou0Qp9iEmHRQlULs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


I can't get DHCP to work through the firewall, I've tried everything, even:
ebtables -A FORWARD -p IPv4 --ip-sport 67:68 -j ACCEPT
ebtables -A FORWARD -p IPv4 --ip-dport 67:68 -j ACCEPT

Other things I tried:
ebtables -A FORWARD -i eth0 -o eth1 -p 0x800 --ip-src 192.168.0.1 --ip-proto udp --ip-sport 67:68 -j ACCEPT
ebtables -A FORWARD -i eth1 -o eth0 -p 0x800 --ip-dst 255.255.255.255/255.255.255.255 --ip-proto udp --ip-dport 67:68 -j ACCEPT

and before that:
ebtables -A FORWARD -p 0x800 --ip-src 192.168.0.1 --ip-proto udp --ip-sport 68 -j ACCEPT
ebtables -A FORWARD -p 0x800 --ip-dst 192.168.0.1 --ip-proto udp --ip-dport 67 -j ACCEPT


--- On Wed, 5/20/09, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:

> From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
> Subject: Re: Ebtables ruleset isn't working, any ideas?
> To: "Miguel Ghobangieno" <mikeeusa@yahoo.com>
> Cc: netfilter@vger.kernel.org
> Date: Wednesday, May 20, 2009, 7:24 AM
> On Tue, 19 May 2009, Miguel
> Ghobangieno wrote:
> 
> > Ok I broke the rules up, and I used the hex value for
> the protocals 
> > rather than the ascii "IP" etc; it workes now. This is
> a debian stable 
> > box, I guess the ebtables that comes in apt is too
> ancient. I would like 
> > to log everyone who attepts to access port 22 tcp on
> eth2 though (allow 
> > them through but log). 
> 
> If `ebtables -h log` does not produce the help text of the
> log watcher, 
> then you have to install ebtables manually, to get the
> required logging 
> functionality.
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


      

