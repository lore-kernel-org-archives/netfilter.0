From: Kjetil Kjernsmo <kjetil@kjernsmo.net>
Subject: Re: Too scared....
Date: Wed, 12 Jun 2002 17:05:05 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <E17I9hG-0001O9-00@pooh.kjernsmo.net>
References: <E17HVTU-00062d-00@pooh.kjernsmo.net> <1023788396.2050.21.camel@billy.demon.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1023788396.2050.21.camel@billy.demon.nl>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

On Tuesday 11 June 2002 11:39, you wrote:
> man, 2002-06-10 kl. 22:07 skrev Kjetil Kjernsmo:
> > I hope someone can take my paw and help me through the iptables
> > setup, because I'm a bit scared of the possibility of locking
> > myself out of my box...
>
> Den som intet v=E5ger, intet vinner :c)

Helt sant!

Thanks to everybody!

I've been trying to get it to work, and thanks to Mike Benson, who gave=20
me a snippet of code that flushes the rules after a delay, I'm not that=20
anxious anymore. Though my first test failed miserably, I was locked=20
out and those two minutes _was_ scary... :-)

I've done some cut'n'pasting from various sources, trying things I=20
think I understand. But apparently, it doesn't do quite what I thought=20
it would, so...

I start my script with=20
 #! /bin/sh=20
IPTABLES=3D"/sbin/iptables"
$IPTABLES -F        =20
$IPTABLES -P INPUT DROP
$IPTABLES -P FORWARD DROP
This should flush and then drop everything. For simplicity, I then have:
$IPTABLES -P OUTPUT ACCEPT
I guess drop output makes life harder for someone who may have gained=20
access to a user account, but... Then, I grabbed most of my stuff from
 http://www.linuxhelp.net/guides/davion/iptables-script
To start with:
$IPTABLES -A INPUT -i lo -j ACCEPT
They also list this as working for ssh:
$IPTABLES -A INPUT -i eth0 -d 0/0 -p tcp --dport 22 -j ACCEPT=20
Apparently it does. So, I just copied it for the rest of my ports...:
$IPTABLES -A INPUT -i eth0 -d 0/0 -p tcp --dport 21 -j ACCEPT=20
$IPTABLES -A INPUT -i eth0 -d 0/0 -p tcp --dport 80 -j ACCEPT=20
$IPTABLES -A INPUT -i eth0 -d 0/0 -p tcp --dport 110 -j ACCEPT=20
$IPTABLES -A INPUT -i eth0 -d 0/0 -p tcp --dport 25 -j ACCEPT=20
$IPTABLES -A INPUT -i eth0 -d 0/0 -p tcp --sport 25 -j ACCEPT=20
It seems to work too....=20

Then, there's DNS. I've inserted
$IPTABLES -A INPUT -p udp --sport 53 -j ACCEPT -s 217.77.32.0/24
I guess I could restrict the IP range more. The point is, however, that=20
my workstation is outside of this range, so I thought it would mean=20
that it would be closed for my workstation...? However, if I do
owl:~# nmap -g 53 -p 53 -sU pooh

Starting nmap V. 2.54BETA31 ( www.insecure.org/nmap/ )
Interesting ports on pooh.kjernsmo.net (217.77.32.186):
Port       State       Service
53/udp     open        domain

So, it looks like I didn't understand this stuff....=20

Finally, I have
$IPTABLES -A INPUT -p icmp --icmp-type 0 -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type 3 -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type 11 -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type 8 -m limit --limit 1/second -j=20
ACCEPT
It responds to ping... :-)

I've tried quite a few other things than this too. So, the question is:=20
Have I done something silly? How do I close off DNS for everything=20
except the subnet my box is in?

Thanks again for your help!

Best,

Kjetil
--=20
Kjetil Kjernsmo
Astrophysicist/IT Consultant/Skeptic/Ski-orienteer/Orienteer/Mountaineer
kjetil@kjernsmo.net  webmaster@skepsis.no  editor@learn-orienteering.org
Homepage: http://www.kjetil.kjernsmo.net/

