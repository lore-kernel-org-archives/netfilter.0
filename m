From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ftp again
Date: Sat, 22 May 2004 16:56:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405221656.16525.Antony@Soft-Solutions.co.uk>
References: <BAY15-F4dP1h5lOX3Af000a1ed3@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F4dP1h5lOX3Af000a1ed3@hotmail.com>
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

On Saturday 22 May 2004 4:29 pm, azeem ahmad wrote:

> hi all
> when i run this script on my box the natting of ftp stops. neither clients
> browse in non-paasive mode nor in passive mode
> what is the problem

Perhaps you do not have the nat_ftp and conntrack_ftp modules loaded or 
compiled into your kernel?

> iptables -F
> iptables -t nat -F
> iptables -P INPUT DROP
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 8080 -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --dport 8080 -j ACCEPT

What are you using UDP port 8080 for?

> iptables -A INPUT -i eth0 -p tcp --dport 22   -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 53   -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --dport 53   -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --dport 137  -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --dport 138  -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 139  -j ACCEPT
>
> iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
> iptables -t nat -A PREROUTING -p udp --dport 80 -j REDIRECT --to-port 8080

Same question as above...

> iptables -P FORWARD DROP
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i eth0 -p tcp --dport 20        -j ACCEPT
> iptables -A FORWARD -i eth0 -p udp --dport 20        -j ACCEPT
> iptables -A FORWARD -i eth0 -p tcp --dport 21        -j ACCEPT
> iptables -A FORWARD -i eth0 -p udp --dport 21        -j ACCEPT

FTP does not use UDP, so two of the above four rules are irrelevant, and 
stateful packet filtering (which you are clearly using from the first rule in 
your FORWARD chain) means that you do not need a rule for the data connection 
on TCP port 20 - therefore you only need one of the above four rules:

iptables -A FORWARD -i eth0 -p tcp --dport 21        -j ACCEPT

> iptables -A FORWARD -i eth0 -p tcp --dport 443       -j ACCEPT
> iptables -A FORWARD -i eth0 -p tcp --dport 5000      -j ACCEPT
> iptables -A FORWARD -i eth0 -p tcp --dport 5001      -j ACCEPT
> iptables -A FORWARD -i eth0 -p tcp --dport 5005      -j ACCEPT
> iptables -A FORWARD -i eth0 -p tcp --dport 5050      -j ACCEPT
> iptables -A FORWARD -i eth0 -p tcp --dport 6660:6670 -j ACCEPT
> iptables -A FORWARD -i eth0 -p tcp --dport 7000      -j ACCEPT
> #iptables -A FORWARD -i eth0 -p tcp --dport 28805     -j ACCEPT
> iptables -A FORWARD -i eth0 -p tcp --dport 51215     -j ACCEPT
>
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

Regards,

Antony.

-- 
It is also possible that putting the birds in a laboratory setting 
inadvertently renders them relatively incompetent.

 - Daniel C Dennet

                                                     Please reply to the list;
                                                           please don't CC me.


