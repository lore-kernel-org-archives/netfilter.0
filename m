From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: [Fwd: Anyone with vpn and iptable strange error message??]
Date: Fri, 31 May 2002 22:31:29 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200205312131.g4VLVVA06481@Networker.rockstone.co.uk>
References: <2522.192.168.1.27.1022875807.squirrel@mail.vistawiz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <2522.192.168.1.27.1022875807.squirrel@mail.vistawiz.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Friday 31 May 2002 9:10 pm, Shazad Malik wrote:

> Hi all,
>
> I have iptables and freeswan VPN working in my lab but a very interesting
> thing is happening and not sure if someone else has seen this:
>
> When I start my ipsec client from my windows2000 to my iptables servers
> which is running NAT too works perfectly fine.  It's when i logoff my
> ipsec connection then I get this error message on my iptables logs which
> start to drop all packets in  both directions! This is the message I get:
>
> ip_conntack: table full, dropping packets

Is this perhaps something to do with the routing table changes which happen 
when FreeS/Wan comes up and down ?

Do your netfilter rules tend to specify interfaces, or do you just use IP 
addresses ?   I'm thinking perhaps if you use interface names in the rules, 
they're going to be different depending on whether FreeS/Wan is up or down, 
so they're not going to route packets in the same way ?

I think your connection tracking table is filling up because you're building 
up a whole set of half-open TCP connections which are not getting repled to 
because the link is down ?


Hope this helps,


Antony.

