From: Sascha Reissner <sascha.reissner@toxicnet.de>
Subject: Re: Port is open but I am unable to connect
Date: Tue, 07 Sep 2004 21:35:04 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <413E0D68.6020208@toxicnet.de>
References: <413E0B9E.8010708@list.idg.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <413E0B9E.8010708@list.idg.dk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jacob Friis Larsen <jfl@list.idg.dk>
Cc: netfilter@lists.netfilter.org


just to make sure.. you are certain, that you want -s 1.2.3.4?

this means source ip is 1.2.3.4 (so the ip you connect from, not the ip 
you connect _to_)


Jacob Friis Larsen wrote:
> When I add -s 1.2.3.4 I am unable to connect to my server.
> nmap shows that the correct ports are open.
> Any ideas?
> 
> iptables -A INPUT -s 1.2.3.4 -j ACCEPT -p tcp --dport 22 -m state 
> --state NEW
> 
> This is my script:
> <script>
> #!/bin/sh
> 
> # Modules
> modprobe ip_conntrack_ftp
> 
> # Defaults
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT DROP
> 
> # Flush
> iptables -t nat -F POSTROUTING
> iptables -t nat -F PREROUTING
> iptables -t nat -F OUTPUT
> iptables -F
> 
> # STATE RELATED for router
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> # Localhost
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
> 
> # Open ports on router for server/services
> iptables -A INPUT -s 1.2.3.4 -j ACCEPT -p tcp --dport 20 -m state 
> --state NEW
> iptables -A INPUT -s 1.2.3.4 -j ACCEPT -p tcp --dport 21 -m state 
> --state NEW
> iptables -A INPUT -s 1.2.3.4 -j ACCEPT -p tcp --dport 22 -m state 
> --state NEW
> iptables -A INPUT -j ACCEPT -p tcp --dport 25 -m state --state NEW
> iptables -A INPUT -j ACCEPT -p tcp --dport 80 -m state --state NEW
> iptables -A INPUT -j ACCEPT -p tcp --dport 143 -m state --state NEW
> iptables -A INPUT -j ACCEPT -p tcp --dport 993 -m state --state NEW
> </script>
> 
> Thanks,
> Jacob
> 
> 


