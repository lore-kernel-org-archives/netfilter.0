From: Cody Harris <hchs@ns.sympatico.ca>
Subject: Re: Netfilter and Squid
Date: Tue, 27 Jan 2004 14:28:48 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040127142848.272b8ce3.hchs@ns.sympatico.ca>
References: <5.2.1.1.0.20040127093418.029803f0@mail.cybercorpinc.com>
	<1075226090.1898.78.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075226090.1898.78.camel@jasiiitosh.nexusmgmt.com>
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

> I usually set Squid up as a transparent proxy, i.e., I use the REDIRECT
> iptables target to redirect any Internet bound traffic on port 80 to
> port 3128 on the same server (and thus to Squid) whereas all other
> traffic just obeys the normal iptables rules - John 

REDIRECT table or chain? Webmin shows me: filter, mangle, and nat.


root@darna:/usr/local/squid/sbin# iptables -L
Chain INPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           
ACCEPT     all  --  anywhere             anywhere           
ACCEPT     udp  --  anywhere             anywhere           udp 
ACCEPT     icmp --  anywhere             anywhere           
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:http 
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:https 
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:pop3 
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:smtp 
ACCEPT     tcp  --  anywhere             anywhere           tcp dpts:32000:40000

> -- 
> John A. Sullivan III
> Chief Technology Officer
> Nexus Management
> +1 207-985-7880
> john.sullivan@nexusmgmt.com
> ---
> If you are interested in helping to develop a GPL enterprise class
> VPN/Firewall/Security device management console, please visit
> http://iscs.sourceforge.net 
> 
> 


-- 
+------------------+-----------------------------+
| Cody Harris      | --------------------------- |
| ---------------- | --------------------------- |
+------------------+-------+---------------------+---+
| *Sigh*. No key.                                    |
+----------------------------------------------------+

