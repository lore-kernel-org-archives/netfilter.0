From: Juan Hernandez <alucard@kanux.com>
Subject: RE: port forwarding in a web server
Date: 24 Nov 2003 13:47:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069696078.1083.25.camel@webmail.aeropostal.com.ve>
References: <20031124171108.6D4DC8047@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031124171108.6D4DC8047@sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: 'Lista de netfilter' <netfilter@lists.netfilter.org>

No, the webserver (the one that has the internet address 1.1.1.1 and the
internal in another NIC 192.168.0.1) is the one that is forwarding
everything that comes to port 25 to the mailserver 192.168.0.2 

Thanx

Juan

On Mon, 2003-11-24 at 13:11, Rob Sterenborg wrote:
> > simple. Here's my scenario: I have a static IP address routed 
> > (1.1.1.1)
> > to one server using a 192.168.0.* address. Is a cisco router and
> > everything works fine. This server has 192.168.0.1 as it's address and
> 
> So I can assume that *ALL* traffic is routed from 1.1.1.1 to 192.168.0.1,
> which has Netfilter running ?
> 
> > functions as a web server, everything works fine but, I have another
> > server that works as our mail server that is using 192.168.0.2. I've
> > been trying to redirect everything coming from port 25 to my 
> > mail server
> > but it doesn't get any answer. These are the rules I've been using: 
> 
> echo 0 > /proc/sys/net/ipv4/ip_forward
> iptables -P FORWARD DROP
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 25 -j ACCEPT
> iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp --dport 25 \
>     -j DNAT --to-destination 192.168.0.2:25
> echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> If you're forwarding anything else than just smtp, you have to add rules to
> allow it : these rules DROP all traffic to be forwarded except smtp which is
> DNAT-ed to the MTA and RELATED/ESTABLISHED traffic.
> 
> 
> Gr,
> Rob
> 
> 


