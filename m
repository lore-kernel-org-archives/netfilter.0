From: Aidas Kasparas <a.kasparas@gmc.lt>
Subject: Re: IPSec - IPTables issues
Date: Wed, 05 May 2004 08:28:03 +0300
Sender: linux-net-owner@vger.kernel.org
Message-ID: <40987B63.5020601@gmc.lt>
References: <20040502155538.GD515@schottelius.org> <4096317F.8020609@eurodev.net> <20040504211557.GA236@schottelius.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-net-owner@vger.kernel.org>
In-Reply-To: <20040504211557.GA236@schottelius.org>
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nico Schottelius <nico-linux-net@schottelius.org>
Cc: Pablo Neira <pablo@eurodev.net>, netfilter@lists.netfilter.org, gregor-net@paasch.name, linux-net@vger.kernel.org

Nico,

	If you have SPD rule (sorry for racoon/setkey speak)
0.0.0.0/0 Your.IP/32 any -P in esp/.../require (or unique)
then any packet coming to your box which is not esp encapsulated will be 
thrown away by ipsec code in kernel (if I remember correctly, it will 
not even reach FORWARD chain). Therefore you could safely skip check for 
esp, ah, udp/500 in iptables rules.

	P.S. you may need to add SPD rule allowing udp/500 before enforcing esp 
traffic. I never required to ipsec all the traffic and therefore I'm not 
sure on this detail.

Nico Schottelius wrote:
> Hello Pablo,
> (netfilter guys, please read 
> http://www.uwsg.iu.edu/hypermail/linux/net/0405.0/0002.html before)
> 
> Pablo Neira [Mon, May 03, 2004 at 01:48:15PM +0200]:
> 
>>Hi Nico,
>>
>>since this stuff is netfilter-related and netfilter/iptables geeks are 
>>mostly in netfilter's maillist, I think you could redirect this request 
>>there, someone could help you out.
> 
> 
> Thank you for the hint. I first thought this is a netfilter problem, but
> currently I don't think so.
> 
> The problem is IMHO the design of the Linux IPSec implementation.
> 
> I'll compare what freeswan did with what Linux 2.6 does now:
> 
> Freeswan has virtual devices (ipsec*), through which the unencrypted
> packets come into the system. So you can add these firewall lines:
> 
> - allow AH, ESP, UDP/500, deny rest on eth0
> - allow IPs/networks, etc. on ipsec0
> 
> With Linux 2.6 I don't have virtual devices. This means that my IPSec
> packets enter the physical device twice:
> 
> 1. esp encrypted packet enters
> 2. Linux decrypts it
> 3. Linux sends the unencrypted packets through the same device again
> 
> The problem with that is, that
> 
> - allow AH, ESP, UDP/500, deny rest on eth0
> 
> will deny the _content_ of my encrypted packages (step three is broken).
> 
> Wouldn't this work fine, if we have the virtual device like freeswan had
> or is netfilter broken with this?
> 
> I mean I cannot practicly setup an IPSec only access point with the current
> netfilter and ipsec in Linux 2.6, or am I deadly wrong?
> 
> Greetings,
> 
> Nico
> 
> 

-- 
Aidas Kasparas
IT administrator
GM Consult Group, UAB
