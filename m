From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Quick Question
Date: Thu, 30 May 2002 21:31:47 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200205302031.g4UKVnA19194@Networker.rockstone.co.uk>
References: <AIEOIGGABAHAAIOAILIDGEDFCGAA.matlas@vistainnovation.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <AIEOIGGABAHAAIOAILIDGEDFCGAA.matlas@vistainnovation.com>
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

On Thursday 30 May 2002 9:17 pm, Mike Atlas wrote:

> I am setting up a Squid proxy server to run in transparent mode. To do
> this, I need to forward all port 80 and 443 traffic to squids' port, 3128.
> Additionally, I would like all other traffic on all other ports to forward
> on to the router.
>
> I have found a script to forward port 80 to squid (note: eth1 is my
> internal interface, eth0 is external):
>
> iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j
> REDIRECT --to-port 3128

Yes.   REDIRECT is used only when you are not changing the IP address, and 
you are changing the port number (ie the packet remains addressed to the same 
machine).

To change the address of the machine it's going to, you use DNAT:

iptables -A PREROUTING -t nat -i eth1 -d a.b.c.d -j DNAT --to 192.168.0.2

where a.b.c.d is the IP address of eth1 on the firewall.

That rule as I've written it will send *everything* addressed from the 
internal network to the firewall, on to the router on 192.168.0.2 (and it 
will send the replies back again).

No need to specify --dport ! 80; just put this rule after the one you wrote 
above, and the DNAT rule will only get used if the REDIRECT didn't.

You can put a '-p tcp' etc into the rule if you only mean to send TCP packets 
on to the router, or whatever.



Antony.

