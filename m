From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Fri, 28 Jun 2002 19:36:01 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020628183604.VJLE16050.mta01-svc.ntlworld.com@there>
References: <000101c0ffff$e9127c20$4d2848c7@shaggy>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000101c0ffff$e9127c20$4d2848c7@shaggy>
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

On Thursday 28 June 2001 7:26 pm, Forrest Beck wrote:

> I have a question that I hope someone can help me with...
>
> I am running a RH7.3 installed machine as a IP Masquerade firewall
> between my LAN and my wireless LAN.  I have my switch with all of my
> wireless Access Points on eth1, and my LAN connection on eth0.
>
> With this set I have made a bash script that executes the following:
>
> iptables -F
> iptables -t nat -F
> iptables -t mangle -F
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 192.168.252.251 #(Ip
>       of eth0)
> echo 1 > /proc/sys/net/ipv4/ip_forward
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -m state --state NEW -i ! eth0 -j ACCPET iptables -p
> INPUT DROP

Where are your FORWARDing rules ?   Are you restricting anything going 
to/from the wireless clients ???

> Now after all that it works great!  A wireless client connects to the
> Access Point, gets a correct ip from DHCP (the linux firewall), and then
> browses the web.  Web pages, mounting drives, everything works great....
>
> My problem is this...
>
> I want to know if it is possible to create a list of MAC addresses that
> netfilter(iptables) can verify against to decide if it should allow a
> client to be routed.  So when the clients starts there computer up, they
> get an ip, begin browsing, and the server looks at the packet and
> verifies if the packet should be dropped or accepted according to MAC
> address.
>
> If anyone has a idea, I'd love to hear from them...  Or even a better
> solution to reach my goal.  either- or.

There is a mac address match in netfilter, yes, but why not just do it in 
your DHCP server (which is on the same machine anyway) ?

You can put a list of MAC/IP addresses in your dhcpd.conf file and run it in 
a similar way to a bootp server.

 

Antony.

