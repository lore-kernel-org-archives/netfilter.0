From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problems Config IPTables
Date: Mon, 3 Jun 2002 18:14:40 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206031714.g53HEgA08682@Networker.rockstone.co.uk>
References: <005001c20b20$923374e0$6801a8c0@shp.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <005001c20b20$923374e0$6801a8c0@shp.com.br>
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
To: netfilter <netfilter@lists.samba.org>

On Monday 03 June 2002 6:03 pm, Mauro Cesar Piva wrote:

> I have a LInux server with two network  boards  A board has a valid
> address for internet and another one with local address. How can I configure
> the valid address to the linux route for a internal address at my network
> which is installed my web server, when someone access from any browser?.
> When I configure the valid address at browse, appears the initial page from
> my Linux/Apache server. On this machine is installed Apache and Squid.
> eth1 - External
> eth0 - Internal
>
> Follows, my tentantive with iptabless without sucess
>
> My File rc.local :
>
> #Masquerade
> Echo 1 >/proc/sys/net/ipv4/ip_forward
> Modprobe iptable_nat
> Iptables-t nat - A POSTROUTING -o eth1 -j MASQUERADE
>
> #DNAT
> Iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 80 -j DNAT --to
> 192.XXX.XXX.XXX

Do you have a FORWARDing rule to send these packets to port 80 on the real 
webserver ?

Something like:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp --dport 80 -d 192.xxx.xxx.xxx -j ACCEPT

What is the routing table on your firewall ?

I hope you are trying to access the external address from a machine which is 
*outside* your firewall.


Antony.

