From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: mixing static and dynamic mappings
Date: Sat, 8 Jun 2002 10:39:43 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206080939.g589djA32218@Networker.rockstone.co.uk>
References: <a7d60cd.60cda7d@wechsler.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <a7d60cd.60cda7d@wechsler.com>
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

On Saturday 08 June 2002 2:38 am, Patrick Conlin wrote:

> i have a /29 range of public ips from my isp. all but one of the ip
> addresses are taken up by static mappings (servers of various
> functions/domains) to addresses on my 10.1.1.0/24 internal network.

> what i'd like to do with the remaining public ip address is use it as a sort
> of MASQUERADE ip address for all remaining non-server machines on the
> network

> I'm wondering if i could do something like:
>
> iptables -t nat -A POSTROUTING -s 10.1.1.200-10.1.1.240 -j SNAT
> --to-source 207.224.76.205
>
> and combine it with state ESTABLISHED
>
> somehow so that just that range of ips gets a pnat-style translation for
> basic browsing, etc.
>
> unfortunately the basic iptables command above just gives an error, as
> it should. i'm pretty sure i'm going about this the wrong way, so would
> greatly appreciate anyone's suggestions!

Netfiler won't accept an arbitrary "from-to" IP address range - the only way 
you can specify a range is with "base IP/masklength", so you'd have to be 
able to specify the range you want as 10.1.1.200/27 (or something - I haven't 
checked to see if this is a sensible specification, so it almost certainly 
isn't).

However, you may not know that you might not need to bother specifying a 
range.

Netfilter can quite happily deal with:

a) masqerading machines behind an already-used address for some other service 
(it automagically makes sure that masquerade port numbers are chosen not to 
conflict with anything else already mapped onto that address)

b) multiple SNAT rules, where you specify your servers by source address 
first, and then anything which hasn't already been matched (and had its 
source address changed) matches on the last rule

eg:

iptables -A POSTROUTING -t nat -s server1 -j SNAT --to ext1
iptables -A POSTROUTING -t nat -s server2 -j SNAT --to ext2
iptables -A POSTROUTING -t nat -s server3 -j SNAT --to ext3
iptables -A POSTROUTING -t nat -j SNAT ext4

will map anything which isn't server1, server2 or server3 onto ext4

Therefore you can do what you want without actually having to specify the 
address range :-)


Antony.

