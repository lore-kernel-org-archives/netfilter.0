From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: portforwarding-HOWTO
Date: Tue, 7 Jan 2003 22:59:25 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301072259.25845.netfilter@newkirk.us>
References: <2132.192.168.0.1.1041835837.squirrel@mail.intermediacorp.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2132.192.168.0.1.1041835837.squirrel@mail.intermediacorp.com>
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
To: oarojo@intermediacorp.com, netfilter@lists.netfilter.org

On Monday 06 January 2003 01:50 am, oarojo@intermediacorp.com wrote:
> Hello people!!!
>
> I have set-up a linux box firewall with two ethernet cards; eth0
> facing the internet and eth1 facing the internal network. Inside my
> network is my mail server with an IP of 192.168.0.5. Now since my ISP
> had only given me one valid IP address for my network, I wish to do
> port-forwarding for ports 25 and 110. I did something like:
>
> # iptables -t nat -A PREROUTING -p tcp -i eth0 -d xxx.xxx.xxx.xxx
> --dport 25 -j DNAT --to 192.168.0.5:25
>
> # iptables -t nat -A PREROUTING -p tcp -i eth0 -d xxx.xxx.xxx.xxx
> --dport 110 -j DNAT --to 192.168.0.5:110
>
> # iptables -A FORWARD -p tcp -i eth0 -d 192.168.0.5 --dport 25=20
> -j ACCEPT=20
> # iptables -A FORWARD -p tcp -i eth0 -d 192.168.0.5 --dport 110
> -j ACCEPT
>
> # iptables-save > /etc/sysconfig/iptables
>
> When i used nmap to determine if ports 25 and 110 are open, it says:
>
> 25/tcp     filtered    smtp
> 110/tcp    filtered    pop-3
>
> and when i try telnetting its valid ip
>
> #telnet xxx.xxx.xxx.xxx 25
>
>
> it says "trying...." and can't connect at all...
>
> How's this? Did I missed something here? Please Help!!!

Do you have a FORWARD rule to allow return traffic back out?  You don't=20
mention one, so I have to ask.  Something like this would work, if no=20
other more general rule allows it:

iptables -A FORWARD -p tcp -o eth0 -s 192.168.0.5 -m multiport  \
--sport 25,110 -j ACCEPT

Are you trying to telnet from outside the network?  If you are trying to=20
do it from the firewall box or from anywhere on the 192.168 network it=20
will fail unless you have other rules to help 'guide' the traffic back=20
through the firewall.  (of course the rules you list are presumably for=20
traffice from outside...)  See Oskar's tutorial's DNAT info at:
http://iptables-tutorial.frozentux.net/chunkyhtml/targets.html#DNATTARGET
where he explains the problem and the solution, if you need to allow=20
access from the local network or firewall.

j


