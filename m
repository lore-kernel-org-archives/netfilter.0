From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: mail relay
Date: Thu, 20 Mar 2003 16:39:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019C76@hslex01.hslbz.local>
References: <OFF04453C4.ECF4132D-ONC1256CEF.00548382-C1256CEF.00543F77@LocalDomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OFF04453C4.ECF4132D-ONC1256CEF.00548382-C1256CEF.00543F77@LocalDomain>
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
To: david@atd.es, netfilter@lists.netfilter.org

> I would like to know how can I filter the mail relay received 
> in my port 25 with the firewall,..  I want only accept the 
> packets from only one ip, my ISP. 

iptables -P INPUT DROP
# Maybe you don't need it, but I'll add it anyway
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i <eth_inet> -s <isp_mailserver_ip> -p tcp --dport 25
-j ACCEPT

However, this way you will be blocking *everything* else from coming in.
You probably want to accept local traffic, something like this :

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i <eth_lan> -s <net_lan> -j ACCEPT

If you're running other servers on the box too (e.g. a webserver), you
also need rules for those servers.

Or you could do simply this, dropping all traffic *not* coming from your
isp's mailserver :

iptables -A INPUT -i <eth_inet> -s <! isp_mailserver_ip> -p tcp --dport
25 -j DROP


Rob


