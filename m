From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: close port 80 but allow some IPs to use port 80
Date: Thu, 6 Mar 2003 09:43:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019C1E@hslex01.hslbz.local>
References: <F10E4LiCtjFEDeYOS2C000398f0@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F10E4LiCtjFEDeYOS2C000398f0@hotmail.com>
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

> how do i close port 80 to all users except for a few ips ? 
> the generic match 
> of --dport doesn't work for me.

Why not ?
Are these users on your LAN or on the internet ?
Do these users have a fixed IP ?

iptables -P INPUT DROP
iptables -A INPUT -s <src_ip> -p tcp --dport 80 -j ACCEPT
...
iptables -A INPUT -s <src_ip> -p tcp --dport 80 -j ACCEPT


Or maybe you can use the MAC address match.

iptables -P INPUT DROP
iptables -A INPUT -m mac --mac-source <src_mac> -p tcp --dport 80 -j
ACCEPT
...
iptables -A INPUT -m mac --mac-source <src_mac> -p tcp --dport 80 -j
ACCEPT


Rob


