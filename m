From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Restricted Access
Date: Tue, 8 Jul 2003 08:58:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E6D65A6EE5AAD6119DE800B0D03DA0C5289716@MS_LEU1>
References: <004401c344d8$305e0a80$b900a8c0@ljhpm.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004401c344d8$305e0a80$b900a8c0@ljhpm.com.au>
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

> All my clients have fixed IP's
> And are on an internal net of 192.168.0/24

> -A POSTROUTING -s 192.168.0.0/255.255.255.0 -j MASQUERADE

> # Ban this PC
> -A FORWARD -s 192.168.0.245 -i eth0 -j firewall
> 
> This is the bit that I cant get to work
> I can stop the client 192.168.0.245 to get the net at all 
> with the above rule But then I want that client to be able to 
> go to 1.2.3.4
> 
> -A FORWARD -s 192.168.0.245 -d 1.2.3.4 -p tcp -m tcp --sport 
> 80 -j ACCEPT -A FORWARD -s 192.168.0.245 -d 1.2.3.4 -p tcp -m 
> tcp --dport 80 -j ACCEPT


Maybe you don't use the correct order for your rules ?
You have to tell iptables about the restricted client first, after that
about the unrestricted clients.
Rules are evaluated in the order you entered them.


# Drop everything that doesn't have a rule for it
#   If you didn't tell the complete story, it may break other things ;)
iptables -P FORWARD DROP

# Accept related and established
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

# Tell iptables what to accept from the restricted client
# From what I see you want to let the restricted client connect to
#   port 80/tcp on 1.2.3.4.
# Are you sure it connects *from* port 80/tcp ?? If not, don't use
--sport.
# Drop everything else from the restricted client
iptables -A FORWARD -i eth0 -s 192.168.0.245 -d 1.2.3.4 -p tcp --dport
80 -j ACCEPT
iptables -A FORWARD -i eth0 -s 192.168.0.245 -j DROP

# Accept everything from the other clients (you already dropped
#   the restricted client here..)
iptables -A FORWARD -i eth0 -s 192.168.0.0/24 -j ACCEPT

# The MASQ rule
iptables -t nat -A POSTROUTING -s 192.168.0.0/24 [-o <if_out>] -j
MASQUERADE


Rob.


