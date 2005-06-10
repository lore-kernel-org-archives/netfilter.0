From: Tib <tib@tigerknight.org>
Subject: Re: ip_conntrack_ftp issues
Date: Fri, 10 Jun 2005 15:02:27 -0500 (CDT)
Message-ID: <Pine.LNX.4.53.0506101458140.9775@altaica>
References: <Pine.LNX.4.53.0506092001190.29097@altaica>
	<BAY0-SMTP08C3BF299D10BD22A53542BCFF0@phx.gbl>
	<Pine.LNX.4.53.0506100633390.9775@altaica>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0506100633390.9775@altaica>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Did some more tinkering around with it but had no luck. Any way for me to
specificly test the insmod commands at a granular level to see where
things are going and what is or is not being triggered?

<EOL>
Tib


On Fri, 10 Jun 2005, Tib wrote:
> I pulled off both modules and then did the following:
>
> altaica:~/iptables-boot# insmod ip_conntrack_ftp ports=21,42
> Using
> /lib/modules/2.4.20-1-686/kernel/net/ipv4/netfilter/ip_conntrack_ftp.o
> altaica:~/iptables-boot# insmod ip_nat_ftp ports=21,42
> Using /lib/modules/2.4.20-1-686/kernel/net/ipv4/netfilter/ip_nat_ftp.o
>
> And then tested by going to a remote host and logging in to the service
> and trying 'ls':
>
> 220---------- Welcome to Pure-FTPd [privsep] [TLS] ----------
> 220-You are user number 1 of 3 allowed.
> 220-Local time is now 06:33. Server port: 42.
> 220-Only anonymous FTP is allowed here
> 220 You will be disconnected after 15 minutes of inactivity.
> Name (tigerknight.org:tib): anonymous
> 230-Your bandwidth usage is restricted
> 230 Anonymous user logged in
> Remote system type is UNIX.
> Using binary mode to transfer files.
> ftp> ls
> 200 PORT command successful
> 425 Could not open data connection to port 48136: Connection refused
> ftp>
>
>
> Considering I got no error messages on the insmod commands, is there just
> something else I'm missing? I have the following rules setup in my
> iptables config:
>
> iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --destination-port 42 -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --destination-port 42 -j ACCEPT
>
>
> *--edit for various other similar ports that are accepted--*
> *--and then down at the end is this--*
> iptables -A INPUT -i eth0 -p tcp -j DROP
> iptables -A INPUT -i eth0 -p udp -j DROP
>
>
> Pretty much it's setup to specificly allow only certain traffic, and
> refuse the rest - but the ip_conntrack_ftp module should be able to use
> the related/established flags to pick this up, right?

