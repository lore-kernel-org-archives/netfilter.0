From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Rules for web server in DMZ
Date: Wed, 29 Sep 2004 09:14:14 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <415AC336.50702@pbl.ca>
References: <20040929125617.40325.qmail@web51808.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040929125617.40325.qmail@web51808.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

Patrick Dung wrote:
> Hi
> 
> I have a question about web server in dmz. I have
> applied rules to do public IP <-> private IP mapping.
> 
> For the web in dmz, I would only allow tcp port 80 to
> go to the web server in the dmz. I use default DROP
> policy, so should permit tcp port 80 in the INPUT
> chain or the FORWARD chain? Also should I use stateful
> inspection (NEW, RELATED, ESTABLISHED) in both chain
> or only in INPUT chain?
> 
> version 1:
> iptables -P INPUT drop
> iptables -P FORWARD drop
> iptables -A INPUT -i $EXT -d $HTTP_INET_IP -p --dport
> 80 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
> iptables -t nat -A PREROUTING -i $EXT -d $HTTP_INET_IP
> --j DNAT --to $DMZ_HTTP_IP
> iptables -t nat -A POSTROUTING -o $EXT -s $DMZ_HTTP_IP
> --j SNAT --to $HTTP_INET_IP
> iptables -A FORWARD -i $EXT -o $DMZ_IF -d $DMZ_HTTP_IP
> -p tcp --dport 80 -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
> 
> version 2:
> iptables -P INPUT drop
> iptables -P FORWARD drop
> iptables -A INPUT -i $EXT -d $HTTP_INET_IP -p --dport
> 80 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
> iptables -t nat -A PREROUTING -i $EXT -d $HTTP_INET_IP
> --j DNAT --to $DMZ_HTTP_IP
> iptables -t nat -A POSTROUTING -o $EXT -s $DMZ_HTTP_IP
> --j SNAT --to $HTTP_INET_IP
> iptables -A FORWARD -i $EXT -o $DMZ_IF -d $DMZ_HTTP_IP
> -p tcp --dport 80 -j ACCEPT

The web server and firewall are two different boxes?  Than you need only 
FORWARD chain.  For web server to serve requests you only need DNAT 
rule.  RELATED is for the first seen packet of an connection that is 
related to some other already established connection.  In this case it 
has no use.

Basically what you need is (these are not working example, just to 
illustrate things):

in nat table:

    iptables -t nat -A PREROUTING -d $HTTP_INET_IP \
       -j DNAT --to-destination $DMZ_HTTP_IP

in filter table:

    iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT
    iptables -A FORWARD -d $DMZ_HTTP_IP -p tcp --dport 80 \
       -m state --state NEW -j ACCEPT

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

