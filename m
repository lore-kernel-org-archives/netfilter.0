From: "Stefan Mueller" <smueller@s-mueller.ch>
Subject: Re: performance troubles
Date: Tue, 5 Nov 2002 08:52:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021105065238.M34683@s-mueller.ch>
References: <20021103120141.M65262@s-mueller.ch>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021103120141.M65262@s-mueller.ch>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I found the problem my self, it wasn't the NAT, it was the 10Mbit Card. This 
card was defect. Now NAT works just great!

-Stefan Mueller

> Hello
> i have a performance problem with my new SNAT (masquerade).
> i have a cable modem with 512kbit/s. downloading a 1MB file takes 
> 30s without NAT. downloading the same file from a pc behind NAT 
> takes 500s! (2.5kbit/s)
> 
> OK, some information:
> the NAT Router:
> -AMD 1800+
> -512MB DDR-Ram
> -10MBit Card to the Cablemodem (the cabelmodem has a 10Mbit 
> connector) -100MBit to the Intranet -Redhat 8.0 (2.4.18-14) -
> iptables v1.2.6a -load average 0.00 0.00 0.00 -no entrys 
in /var/log/messages
> -iptables -L -> nothing,policy ACCEPT in INPUT OUTPUT FORWARD
> -using iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> -interfaces:
>  eth0 217.162.74.155 mask 255.255.254.0 (dhcp)
>  eth1 10.22.0.1      mask 255.255.0.0
> -routing table:
>  217.162.74.0 *              255.255.254.0 U  0 0 0 eth0
>  10.22.0.0    *              255.255.0.0   U  0 0 0 eth1
>  127.0.0.0    *              255.0.0.0     U  0 0 0 lo
>  default      (isp's router) 0.0.0.0       UG 0 0 0 eth0
> 
> the Client
> -AMD 1800+
> -512MB DDR-Ram
> -100MBit to the Intranet
> -Redhat 8.0 (2.4.18-14)
> -load average 0.00 0.00 0.00
> -iptables v1.2.6a
> -no entrys in /var/log/messages
> -iptables entrys
> -interfaces:
>  eth0 10.22.32.1 mask 255.255.0.0
> -routing table:
>  10.22.0.0 *         255.255.0.0 U  0 0 0 eth0
>  127.0.0.0 *         255.0.0.0   U  0 0 0 lo
>  default   10.22.0.1 0.0.0.0     UG 0 0 0 eth0
> 
> transmission between server and client has normal 100Mbit speed.
> ping from the client to the internet is normal at ~100ms
> 
> what did i wrong? i know that NAT can't be as fast as a direct 
> connection but this is terrible slow...
> --
> Open WebMail Project (http://openwebmail.org)


--
Open WebMail Project (http://openwebmail.org)


