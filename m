From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: ftp again
Date: Tue, 15 Jun 2004 11:35:18 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <169101c452e5$fb31a660$49caa8c0@caris.priv>
References: <BAY15-F34STM4fkm908000a429c@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: azeem ahmad <azeem484@hotmail.com>, netfilter@lists.netfilter.org

when I try to run the ip_conntrack_ftp module using the command
"modeprobe ip_conntrack_ftp" or
"/sbin/modeprobe ip_conntrack_ftp" it says module not found.

I searched for the module on my system and it does exist in
"/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/"

Any suggestions ?

I am running rh9

Peter

----- Original Message ----- 
From: "azeem ahmad" <azeem484@hotmail.com>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, May 22, 2004 7:28 PM
Subject: Re: ftp again


i issued the commands
#modprobe ip_nat_ftp
#modprobe ip_conntrack_ftp
and now it works well
but what are these modules and what is the connection tracking. can u tell
me about any usefull link

Regards
Azeem


>From: Antony Stone <Antony@Soft-Solutions.co.uk>
>Reply-To: netfilter@lists.netfilter.org
>To: netfilter@lists.netfilter.org
>Subject: Re: ftp again
>Date: Sat, 22 May 2004 16:56:16 +0100
>
>On Saturday 22 May 2004 4:29 pm, azeem ahmad wrote:
>
> > hi all
> > when i run this script on my box the natting of ftp stops. neither
>clients
> > browse in non-paasive mode nor in passive mode
> > what is the problem
>
>Perhaps you do not have the nat_ftp and conntrack_ftp modules loaded or
>compiled into your kernel?
>
> > iptables -F
> > iptables -t nat -F
> > iptables -P INPUT DROP
> > iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> > iptables -A INPUT -i eth0 -p tcp --dport 8080 -j ACCEPT
> > iptables -A INPUT -i eth0 -p udp --dport 8080 -j ACCEPT
>
>What are you using UDP port 8080 for?
>
> > iptables -A INPUT -i eth0 -p tcp --dport 22   -j ACCEPT
> > iptables -A INPUT -i eth0 -p tcp --dport 53   -j ACCEPT
> > iptables -A INPUT -i eth0 -p udp --dport 53   -j ACCEPT
> > iptables -A INPUT -i eth0 -p udp --dport 137  -j ACCEPT
> > iptables -A INPUT -i eth0 -p udp --dport 138  -j ACCEPT
> > iptables -A INPUT -i eth0 -p tcp --dport 139  -j ACCEPT
> >
> > iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port
>8080
> > iptables -t nat -A PREROUTING -p udp --dport 80 -j REDIRECT --to-port
>8080
>
>Same question as above...
>
> > iptables -P FORWARD DROP
> > iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > iptables -A FORWARD -i eth0 -p tcp --dport 20        -j ACCEPT
> > iptables -A FORWARD -i eth0 -p udp --dport 20        -j ACCEPT
> > iptables -A FORWARD -i eth0 -p tcp --dport 21        -j ACCEPT
> > iptables -A FORWARD -i eth0 -p udp --dport 21        -j ACCEPT
>
>FTP does not use UDP, so two of the above four rules are irrelevant, and
>stateful packet filtering (which you are clearly using from the first rule
>in
>your FORWARD chain) means that you do not need a rule for the data
>connection
>on TCP port 20 - therefore you only need one of the above four rules:
>
>iptables -A FORWARD -i eth0 -p tcp --dport 21        -j ACCEPT
>
> > iptables -A FORWARD -i eth0 -p tcp --dport 443       -j ACCEPT
> > iptables -A FORWARD -i eth0 -p tcp --dport 5000      -j ACCEPT
> > iptables -A FORWARD -i eth0 -p tcp --dport 5001      -j ACCEPT
> > iptables -A FORWARD -i eth0 -p tcp --dport 5005      -j ACCEPT
> > iptables -A FORWARD -i eth0 -p tcp --dport 5050      -j ACCEPT
> > iptables -A FORWARD -i eth0 -p tcp --dport 6660:6670 -j ACCEPT
> > iptables -A FORWARD -i eth0 -p tcp --dport 7000      -j ACCEPT
> > #iptables -A FORWARD -i eth0 -p tcp --dport 28805     -j ACCEPT
> > iptables -A FORWARD -i eth0 -p tcp --dport 51215     -j ACCEPT
> >
> > iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>
>Regards,
>
>Antony.
>
>--
>It is also possible that putting the birds in a laboratory setting
>inadvertently renders them relatively incompetent.
>
>  - Daniel C Dennet
>
>                                                      Please reply to the
>list;
>                                                            please don't CC
>me.
>
>

_________________________________________________________________
STOP MORE SPAM with the new MSN 8 and get 2 months FREE*
http://join.msn.com/?page=features/junkmail



