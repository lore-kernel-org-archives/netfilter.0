From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables seens doesn't understand network address not in class A, B or C
Date: Tue, 9 Jul 2002 08:17:40 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020709071741.ZVHJ4119.mta06-svc.ntlworld.com@there>
References: <001e01c22706$08aae620$0103a8c0@pc21>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001e01c22706$08aae620$0103a8c0@pc21>
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

On Tuesday 09 July 2002 6:03 am, caricand.jean-michel wrote:

> I have a local network with 10.0.2.0 address and 255.255.254.0 netmask.
>
> My firewall have IP 10.0.2.130 on eth0.
> My station have IP 10.0.2.2.
>
> I configure my firewall for drop the ping from the station with 1 rules :
>
> # iptables -A INPUT -i eth0 -s 10.0.2.2 -p icmp -j DROP
>
> When I ping the firewall from my station (ping 10.0.2.130) , I receive an
> response from the serveur
>
> Why ?
>
> What is the problem ? My netmask ?

No; netfilter can handle any netmask you like - even very strange ones.

What is the routing table on:
a) your firewall
b) machine 10.0.2.2

 

Antony

