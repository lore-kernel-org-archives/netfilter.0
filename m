From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: IPSec - IPTables issues
Date: Wed, 05 May 2004 09:47:22 -0500
Sender: linux-net-owner@vger.kernel.org
Message-ID: <4098FE7A.8070707@pbl.ca>
References: <20040502155538.GD515@schottelius.org> <4096317F.8020609@eurodev.net> <20040504211557.GA236@schottelius.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-net-owner@vger.kernel.org>
In-Reply-To: <20040504211557.GA236@schottelius.org>
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nico Schottelius <nico-linux-net@schottelius.org>
Cc: Pablo Neira <pablo@eurodev.net>, netfilter@lists.netfilter.org, gregor-net@paasch.name, linux-net@vger.kernel.org

Nico Schottelius wrote:
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

Haven't worked much with IPSec (at least not over firewall).  Are you 
sure that IPSec packets will go through Netfilter twice (once encrypted, 
and than once again unencrypted)?

Anyhow, if I assume that what you wrote is correct (and it is how Linux 
kernel handles packets), I still don't see need for virtual devices.

If above is what really happens, the proper way to do what you want to 
do is (IMHO):

   - allow hosts/networks on eth0 (in Netfilter part of kernel)
   - setup IPSec policies so that traffic from allowed hosts/networks is 
required to be encrypted (in IPSec part of kernel)

This way, you will get an equivalent configuration (you accept traffic 
only from defined set of hosts/networks, and require that traffic to be 
encrypted).  If you want to limit traffic to say only HTTP, than you 
would allow it if it is: from host/network and (AH or ESP or UDP/500 or 
HTTP).

So you get:

1. Linux requires packets from defined hosts/networks to be encrypted. 
If packets is not encrypted, Linux rejects it because of IPSec policy
2. Packet goes through Netfilter encrypted (accepted since it is AH, 
ESP, or UDP/500 and from allowed src IP)
3. Linux decrypts it
4. Packet goes through Netfilter again (accepted because it is HTTP and 
allowed src IP)

I'm not familiar with kernel internals, so I don't know if steps 1 and 2 
are actually inverted (doesn't change anything).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7
