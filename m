From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Fri, 28 Jun 2002 20:11:16 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020628191117.BBBQ295.mta03-svc.ntlworld.com@there>
References: <000801c10004$8a44abf0$4d2848c7@shaggy>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000801c10004$8a44abf0$4d2848c7@shaggy>
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

On Thursday 28 June 2001 8:00 pm, Forrest Beck wrote:

> I don't have any rules set.  I don't really care about what comes
> through... I guess I should say, all I need is the linux box to act as a
> bridge with NAT and DHCP.

Ugh !   Not the way I'd choose to run it, but still.....

Just out of interest, if you're running the Linux box as a bridge with DHCP, 
why are you doing NAT ?

> The reason I can't use DHCP to filter by MAC address, is anyone could
> find out the IP of the machine and then use whatever IP address they
> want.....

If they can find out the IP address of your router they can find the MAC 
address of a client, and then forge that MAC address from their own machine 
(if they connect using a different Access Point, they can probably even get 
this to work whilst the 'real' client is still connected somewhere else on 
your wireless network !)

> I also know that netfilter will add rules by MAC address (although I say
> I haven't quite learned that rule set yet :) ) but I have about 150 MAC
> Addr's to load.

You think netfilter can *learn* MAC addresses and then make up rules 
automatically for them ?   It's a new one on me if it can.....

 

Antony.

> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org] On Behalf Of Antony Stone
> Sent: Friday, June 28, 2002 2:36 PM
> To: netfilter@lists.samba.org
> Subject: Re: (no subject)
>
> On Thursday 28 June 2001 7:26 pm, Forrest Beck wrote:
> > I have a question that I hope someone can help me with...
> >
> > I am running a RH7.3 installed machine as a IP Masquerade firewall
> > between my LAN and my wireless LAN.  I have my switch with all of my
> > wireless Access Points on eth1, and my LAN connection on eth0.
> >
> > With this set I have made a bash script that executes the following:
> >
> > iptables -F
> > iptables -t nat -F
> > iptables -t mangle -F
> > iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 192.168.252.251
>
> #(Ip
>
> >       of eth0)
> > echo 1 > /proc/sys/net/ipv4/ip_forward
> > iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> > iptables -A INPUT -m state --state NEW -i ! eth0 -j ACCPET iptables -p
> > INPUT DROP
>
> Where are your FORWARDing rules ?   Are you restricting anything going
> to/from the wireless clients ???
>
> > Now after all that it works great!  A wireless client connects to the
> > Access Point, gets a correct ip from DHCP (the linux firewall), and
> > then browses the web.  Web pages, mounting drives, everything works
> > great....
>
> > My problem is this...
> >
> > I want to know if it is possible to create a list of MAC addresses
> > that
> > netfilter(iptables) can verify against to decide if it should allow a
> > client to be routed.  So when the clients starts there computer up,
> > they
> > get an ip, begin browsing, and the server looks at the packet and
> > verifies if the packet should be dropped or accepted according to MAC
> > address.
> >
> > If anyone has a idea, I'd love to hear from them...  Or even a better
> > solution to reach my goal.  either- or.
>
> There is a mac address match in netfilter, yes, but why not just do it
> in your DHCP server (which is on the same machine anyway) ?
>
> You can put a list of MAC/IP addresses in your dhcpd.conf file and run
> it in a similar way to a bootp server.
>
>
>
> Antony.

