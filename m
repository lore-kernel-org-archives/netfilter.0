From: Arnt Karlsen <arnt@c2i.net>
Subject: OT: ssh portforwarding, was: trying to get oddball setup to work
Date: Sat, 26 Jul 2003 17:00:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030726170038.7f41c227.arnt@c2i.net>
References: <3F227FBC.6000403@sympatico.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F227FBC.6000403@sympatico.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sat, 26 Jul 2003 09:18:52 -0400, 
"Andrew St. Jean" <ast.000@sympatico.ca> wrote in message 
<3F227FBC.6000403@sympatico.ca>:

> I'm hoping someone can tell me if what I'm trying to do is possible
> and if so, how.
> 
> Here's a picture of my network topology:
> 
> machine x-------internet---------machine y-----private LAN----host
> a/b/c
> 
> Machine x has one interface with a public static IP.
> Machine y has two interfaces, one with a public dynamic IP and the
> other with a private static IP.
> 
> Both machines x and y have iptables installed and running.
> I have an ipsec tunnel (using FreeS/Wan) working between machines x
> and y. With this tunnel I can ping any of the hosts on my private LAN
> from machine x. I can also mount a shared partition from, say, host b
> onto machine x. I include this just to show that the ipsec tunnel is
> working.
> 
> What I want to do is use NAT to forward certain ports on machine x to 
> machines on my private LAN. Right now, if I open a port in iptables on
> machine x, I can connect to machine x from the internet on that port.
> If I try to forward the port to host c, packets seem to disappear on 
> machine x. I can see the packets arrive at machine x using tcpdump but
> nothing goes out again.
> 
> Thanks for any help provided.

..what you ask for is doable as "ssh portforwarding", usually done 
to localhost, but I dont see any reason why not to put those ports 
on hosts y, a, b or c instead of "localhost" in your lan scenario,
as long as you firewall it all.  

..ipsec, well it should'nt hurt, you could pack all ssh tunnels in 
it if your traffic goes thru really crappy hardware, there is some 
_real_ junk out there that will reboot if it sees more than 256 ip 
connections... like yourself reading news.google.com or somesuch.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


