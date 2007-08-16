From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: not [!] rule is not working
Date: Thu, 16 Aug 2007 09:39:17 -0500
Message-ID: <46C46195.9070500@riverviewtech.net>
References: <d41814cf0708132345t45ec0be0vee36c6c88cc5088a@mail.gmail.com>	<46C1BE08.6070409@riverviewtech.net>
	<d41814cf0708152256w2e5e146cs7306e9e40e3b6872@mail.gmail.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d41814cf0708152256w2e5e146cs7306e9e40e3b6872@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 08/16/07 00:56, pankaj jain wrote:
> I have a machine with 3 interfaces
> eth0: 10.19.0.102 mask (255.255.255.0)
> eth1: 10.19.1.102 mask (255.255.255.0)
> eth2: 10.29.51.102 mask (255.255.255.0)

Ok,

> all three are connected in a same switch (no vlans configured).  I 
> want arp requests to be responded by the associated interface only, 
> and not by other interfaces.

Ok,

> I have added following rules.
> arptables -A INPUT -i eth0 --opcode Request -d 10.19.0.102 -j ACCEPT
> arptables -A INPUT -i eth1 --opcode Request -d 10.19.1.102 -j ACCEPT
> arptables -A INPUT -i eth2 --opcode Request -d 10.19.51.102 -j ACCEPT
> arptables -A INPUT -i !eth0 --opcode Request -d 10.19.0.102 -j DROP
> arptables -A INPUT -i !eth1 --opcode Request -d 10.19.1.102 -j DROP
> arptables -A INPUT -i !eth2 --opcode Request -d 10.19.51.102 -j DROP
> 
> DROP rules with [!] are not working.

Hum.  I would not think that you even needed the ARPTables rules to
prevent the wrong interface from responding to an ARP request for
another IP.  Are you seeing this happen?  Or is the purely preventative?

> but if I remove the interface part it works fine
> arptables -A INPUT -i eth0 --opcode Request -d 10.19.0.102 -j ACCEPT
> arptables -A INPUT -i eth1 --opcode Request -d 10.19.1.102 -j ACCEPT
> arptables -A INPUT -i eth2 --opcode Request -d 10.19.51.102 -j ACCEPT
> arptables -A INPUT  --opcode Request -d 10.19.0.102 -j DROP
> arptables -A INPUT  --opcode Request -d 10.19.1.102 -j DROP
> arptables -A INPUT  --opcode Request -d 10.19.51.102 -j DROP

In short, you are allowing the ARP request for the specific interface /
IP pair and then dropping any other ARP requests.  You really could
re-write the above as such:

arptables -A INPUT -i eth0 --opcode Request -d 10.19.0.102 -j ACCEPT
arptables -A INPUT -i eth1 --opcode Request -d 10.19.1.102 -j ACCEPT
arptables -A INPUT -i eth2 --opcode Request -d 10.19.51.102 -j ACCEPT
arptables -A INPUT --opcode Request -j DROP

Rather I think this will work, but I can not guarantee that you will not
have to take some precautions to make sure that you don't effect other
possible interfaces (loop back / dummy / etc).



Grant. . . .

