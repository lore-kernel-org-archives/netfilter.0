From: Jakub Nadolny <jakub.nadolny@carrywater.pl>
Subject: Re: Problem with address forwarding
Date: Mon, 3 Dec 2007 17:35:58 +0100
Message-ID: <20071203163558.GT4452@jnamobiled.ite.pl>
References: <20071203125238.GN4452@jnamobiled.ite.pl> <57523.217.166.60.19.1196689813.squirrel@ma.rtij.nl> <47540EC9.6080303@plouf.fr.eu.org> <20071203144439.GQ4452@jnamobiled.ite.pl> <1196695232.2629.27.camel@localhost.localdomain> <20071203161122.GS4452@jnamobiled.ite.pl> <1196698801.2629.31.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1196698801.2629.31.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ??????????? ?????? <casper@meteor.dp.ua>
Cc: netfilter@vger.kernel.org

On Mon, Dec 03, 2007 at 06:20:01PM +0200, ??????????? ?????? wrote:
> ? ???, 03/12/2007 ? 17:11 +0100, Jakub Nadolny ?????:
> > On Mon, Dec 03, 2007 at 05:20:31PM +0200, ??????????? ?????? wrote:
> > > ? ???, 03/12/2007 ? 15:44 +0100, Jakub Nadolny ?????:
> > > > On Mon, Dec 03, 2007 at 03:12:25PM +0100, Pascal Hambourg wrote:
> > > > >> <citaat van="Jakub Nadolny">
> > > > >>> I try to do simple address:port forwarding and I can not get it
> > > > >>> working. I want to have all traffic send to
> > > > >>> some.internet.address:some_port to be forwarded to 192.168.155.123:80.
> > > > >>>
> > > > >>> So I guess following rule should work fine:
> > > > >>> iptables -t nat -A PREROUTING -p tcp -d some.internet.address --dport 
> > > > >>> 1234
> > > > >>> -j DNAT --to 192.168.155.123:80
> > > > >>>
> > > > >>> But when afterthat I enter some.internet.address:1234 in firefox I can
> > > > >>> not see webpage which is located at 192.168.155.123. It tries to connect
> > > > >>> but there is no result.
> > > > >>>
> > > > >>> What could be the reason of that?
> > > > >> If you are doing this from the same network the webserver is on, this will
> > > > >> not work. The return traffic is going straight back to the client instead
> > > > >> of being 'Natted-back' by the firewall.
> > > > >
> > > > > That's when the DNAT is done on a router and the browser and the server are 
> > > > > on the same side of the router. The workaround is to SNAT the DNAT-ed 
> > > > > connection in the POSTROUTING chain as it is forwarded back to the LAN. 
> > > > > Take care to SNAT only connections from the local network, not those from 
> > > > > the internet because it hides the original source address.
> > > > >
> > > > > If you are not doing the port forwarding on a router but on the box the web 
> > > > > browser is running on, the DNAT must be done in the OUTPUT chain instead of 
> > > > > PREROUTING.
> > > > 
> > > > Unfortunatelly result is the same when I try to connect from outside of
> > > > local network. 
> > > > 
> > > > So my configuration is like that:
> > > > 
> > > > web server      |        | server with NAT  |       |
> > > > 192.168.155.123 |--------| 192.168.155.122  |-------| Internet
> > > >                 |        | some.internet.ip |       |
> > > > 
> > > > Whether I connect from my local network (192.168.155.*) or from outside
> > > > result is the same. 
> > > > In web browser I enter IP address - not domain name. 
> > > > 
> > > > # iptables -t nat -L -n
> > > > Chain PREROUTING (policy ACCEPT)
> > > > target     prot opt source               destination         
> > > > DNAT       tcp  --  0.0.0.0/0            some.internet.ip        tcp dpt:80 to:192.168.155.123:80 
> > > > 
> > > > To be sure I have temporarly turned off all other rules:
> > > > 
> > > > # iptables -L -n
> > > > Chain INPUT (policy ACCEPT)
> > > > target     prot opt source               destination         
> > > > 
> > > > Chain FORWARD (policy ACCEPT)
> > > > target     prot opt source               destination         
> > > > 
> > > > Chain OUTPUT (policy ACCEPT)
> > > > target     prot opt source               destination     
> > > > 
> > > > 
> > > > Do you have some suggestions?
> > > 
> > > First of all make some checks with tcpdump to see the packets. Do you
> > > see them entering www-server? Leaving the router?
> > 
> > It looks like they are leaving the router:
> > Dec  3 15:58:32 pi kernel: IN=eth1 OUT=eth0 SRC=195.22.22.22 DST=192.168.155.123 LEN=60 TOS=0x00 PREC=0x00 TTL=47 ID=28361 DF PROTO=TCP SPT=2584 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
> > Dec  3 15:58:35 pi kernel: IN=eth1 OUT=eth0 SRC=195.22.22.22 DST=192.168.155.123 LEN=60 TOS=0x00 PREC=0x00 TTL=47 ID=28362 DF PROTO=TCP SPT=2584 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
> > Dec  3 15:58:41 pi kernel: IN=eth1 OUT=eth0 SRC=195.22.22.22 DST=192.168.155.123 LEN=60 TOS=0x00 PREC=0x00 TTL=47 ID=28363 DF PROTO=TCP SPT=2584 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 
> > 
> > 195.22.22.22 is a server where I have testing shell account. It is
> > outside my network. 
> > 
> > And I can see them on web server too:
> > 
> > 16:59:07.798762 IP 195.22.22.22.1101 > 192.168.155.123.www: S 194865141:194865141(0) win 5840 <mss
> > 1460,sackOK,timestamp 1951628411 0,nop,wscale 3>
> > 16:59:07.798958 IP 192.168.155.123.www > 195.22.22.22.1101: S 1209596419:1209596419(0) ack
> > 194865142 win 5792 <mss 1460,sackOK,timestamp 4153535261951627661,nop,wscale 7>
> > 
> > But still there is nothing in web browser and nothing in apache logs
> > too.
> > 
> > > Make sure www-server's virtualhosts will accept domain you are
> > > redirecting.
> > 
> > I guess it doesn't metter as I don't use domain, but IP address
> > only. Besides http://192.168.155.123/ works fine from any local machine.
> 
> Instead of trying http://some.internet.address/ in the broswer, try
> this:
> ===================
> # telnet some.internet.address 1234
> GET /
> 
> 
> ===================
> 
> Two newlines required. If something is working you'll get index.html as
> output. Check the logs ones again.

Result is the same :(
I can see in tcpdump that there is communication between client and 
server, but still nothing in apache logs and telnet results are empty:

===========
# telnet 194.50.53.69 80
Trying 194.50.53.69...
GET /



telnet: Unable to connect to remote host: Connection timed out
===========

