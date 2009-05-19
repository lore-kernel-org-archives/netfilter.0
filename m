From: Miguel Ghobangieno <mikeeusa@yahoo.com>
Subject: Re: Ebtables ruleset isn't working, any ideas?
Date: Tue, 19 May 2009 13:12:31 -0700 (PDT)
Message-ID: <557700.63037.qm@web44807.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1242763951; bh=AOWd201bLfRvxyWam9uxcb3xeTFNY78kJwkf6MwABcU=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=wx59LGgjaCzXPv+8LOk2qqOJkB8Gf3piP8/s66mU0V66c20NlcURVhvCuQZ7uwRvpy63GeH0GAmF3H9XT4MqB9nwbKw8XYLES3iJxA9v97175ZgbNlF8OIVD8ABIuW7H8SK6/ef0R8scBIzUR2pfpdPfg0cB9LlbHZQknnSrMQU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


Ok I broke the rules up, and I used the hex value for the protocals rather than the ascii "IP" etc; it workes now. This is a debian stable box, I guess the ebtables that comes in apt is too ancient. I would like to log everyone who attepts to access port 22 tcp on eth2 though (allow them through but log). Eth2 is the management interface for the box, (this is for a school network), students shouldn't try to access it, if they do I'd like to have the IP recorded, then we can look up who was using what computer at that time (putting webcameras on the public terminals has been discussed to make sure), and then give that person detention or an in school suspention for accessing ssh on the management port. We can then talk to their parents about how serious the matter is etc, and all that will 
 be all seriously believed, the student will feel as if they did something very wrong... also jokingly the idea of stamping "psudo-hacker" on their ID card was floated:
 the psudo will show that they failed and thus are not a cool "hacker".

Here's the working ruleset:

/usr/sbin/brctl addbr br0
/usr/sbin/brctl addif br0 eth0
/usr/sbin/brctl addif br0 eth1
/sbin/ip link set br0 up
/sbin/ip link set eth0 up # don't ask me why
/sbin/ip link set eth1 up # don't ask me why
#/sbin/ip addr add 192.168.0.6 brd + dev br0
#/sbin/route add default gw 192.168.0.1 dev br0 ##Only needed if eth2 hasn't allready set default gateway

# ebtables...
# example rule: block all ICMP
ebtables -F FORWARD
ebtables -P FORWARD DROP
ebtables -A FORWARD -p ip --ip-proto icmp -j DROP ## block all ICMP

## Arp for all
ebtables -A FORWARD -p 0x806 -j ACCEPT ##Allow ARP
##Squid Server
ebtables -A FORWARD -p ip --ip-src 192.168.0.21 -s ! 00:08:0D:54:13:C9 -j DROP #Drop any naively IP spoofed packet "from" the squid server.
ebtables -A FORWARD -i eth0 -o eth1 -p 0x800 --ip-dst 192.168.0.21 --ip-proto tcp --ip-sport 80 -j ACCEPT #Allow squid server to interact with HTTP
ebtables -A FORWARD -i eth1 -o eth0 -p 0x800 --ip-src 192.168.0.21 --ip-proto tcp --ip-dport 80 -j ACCEPT #Allow squid server to interact with HTTP
ebtables -A FORWARD -i eth0 -o eth1 -p 0x800 --ip-dst 192.168.0.21 --ip-proto tcp --ip-sport 443 -j ACCEPT #Allow squid server to interact with HTTPS
ebtables -A FORWARD -i eth1 -o eth0 -p 0x800 --ip-src 192.168.0.21 --ip-proto tcp --ip-dport 443 -j ACCEPT #Allow squid server to interact with HTTPS
ebtables -A FORWARD -p 0x800 --ip-src 192.168.0.21 --ip-dst 167.206.3.137 --ip-proto udp --ip-dport 53 -j ACCEPT #Allow DNS access through bridge from squid $
ebtables -A FORWARD -p 0x800 --ip-src 167.206.3.137 --ip-dst 192.168.0.21 --ip-proto udp --ip-sport 53 -j ACCEPT #Allow DNS access through bridge from squid $
##SSH Server
ebtables -A FORWARD -p ip --ip-src 192.168.0.21 -s ! 00:08:0D:54:13:C9 -j DROP #Drop any naively IP spoofed packet "from" the SSH server.
ebtables -A FORWARD -p 0x800 --ip-dst 192.168.0.21 --ip-proto tcp --ip-dport 22 -j ACCEPT #Allow SSH from internet to ssh server
ebtables -A FORWARD -p 0x800 --ip-src 192.168.0.21 --ip-proto tcp --ip-sport 22 -j ACCEPT #Allow SSH from internet to ssh server
## Everyone (If you want everyone to beable to do something :P
ebtables -A FORWARD -p 0x800 --ip-dst 167.206.3.137 --ip-proto udp --ip-dport 53 -j ACCEPT #Allow DNS access through bridge from Everyone
ebtables -A FORWARD -p 0x800 --ip-src 167.206.3.137 --ip-proto udp --ip-sport 53 -j ACCEPT #Allow DNS access through bridge from Everyone



--- On Tue, 5/19/09, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:

> From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
> Subject: Re: Ebtables ruleset isn't working, any ideas?
> To: "Christoph Paasch" <christoph.paasch@student.uclouvain.be>
> Cc: netfilter@vger.kernel.org, "Miguel Ghobangieno" <mikeeusa@yahoo.com>
> Date: Tuesday, May 19, 2009, 7:46 PM
> On Tue, 19 May 2009, Christoph Paasch
> wrote:
> 
> > Hmmm... His rules won't match as the packets are
> dropped due to the default 
> > policy of the chain.
> 
> The default policy will be used if no rule matches. The
> question is, do 
> any of the rules match?
>  
> > Just add at the end of your rules a log target for all
> who passed the 
> > "ACCEPT" rules.
> 
> There's no log target in ebtables. But there's a log
> "watcher" which is 
> like an always true matching with logging as side effect.
> That should be 
> added to the rules.
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


      

