From: Jason Opperisano <opie@817west.com>
Subject: Re: Port is open but I am unable to connect
Date: Thu, 09 Sep 2004 08:20:47 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094732447.1897.44.camel@wolfpack.ljm.dom>
References: <413E0B9E.8010708@list.idg.dk> <413E2123.6050908@pbl.ca>
	<413EAAF6.5030804@list.idg.dk>  <41402DC4.3030901@list.idg.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41402DC4.3030901@list.idg.dk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-09-09 at 06:17, Jacob Friis Larsen wrote:
> With the changes I still can't connect. I also use bonding if that's 
> important.

dunno about bonding...might be important.

> <script>
> #!/bin/sh
> 
> # Modules
> modprobe ip_conntrack_ftp
> modprobe ip_nat_ftp
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
> iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> # Localhost
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
> 
> # Open ports on router for server/services
> #iptables -A INPUT -s 1.2.3.4 -j ACCEPT -p tcp --dport 20 -m state 
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

just to clarify a point--the services your trying to connect to *are*
running locally on the machine running netfilter, correct?  the only
reason i ask, is because the comment "Open ports on router for
server/services" leads me to believe that "router" and "server" are two
different machines.  if "server" is behind "router" you should be using
FORWARD filter rules, not INPUT...

anyways...at this point--i'd recommend:

  iptables -A INPUT -j LOG --log-prefix "FW DROP IN: "
  iptables -A OUTPUT -j LOG --log-prefix "FW DROP OUT: "
  iptables -A FORWARD -j LOG --log-prefix "FW DROP FWD: "

and then "tail -f /var/log/messages" and try to connect.  the logs will
tell you why the firewall is dropping the traffic.

-j

-- 
Jason Opperisano <opie@817west.com>


