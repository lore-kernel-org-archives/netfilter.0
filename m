From: Toby <tobia.conforto@linux.it>
Subject: Filtering in the nat table
Date: Tue, 22 Mar 2005 17:06:39 +0100
Message-ID: <20050322160638.GA347@ikkoku.ath.cx>
Mime-Version: 1.0
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear netfilter users,

	I've found it handy to put filtering rules in the nat table,
precisely in the PREROUTING chain.  Is it ok to do that?  What are the
complications or inefficiencies I should expect to come across?  

The fact that the filter table is called like that suggests that it's
the "right" place to put filtering rules, but putting them in the nat
table makes things considerably easier--and shorter.  

I'm wondering what are the drawbacks, if any.


Here is a simple set of rules I just made up as a simple example.  
They do NAT for an internal LAN (all outgoing connections are allowed)
and restrict packets incoming from an external interface.  Incoming
external tcp connections on port 80 are forwarded to an internal WWW
server, ssh ones are accepted for the firewall box itself, everything
else (external) is discarded.  As I said, this is a very simple example.


"Canonical" version:

    iptables -t nat -A PREROUTING -i $EXT_IF -p tcp --dport 80 -j DNAT \
             --to-destination $INT_SERVER

    iptables -t nat -A POSTROUTING -o $EXT_IF -j SNAT \
             --to-source $EXT_ADDR

    iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
    iptables -A FORWARD -i $EXT_IF -p tcp --dport 80 -j ACCEPT
    iptables -A FORWARD -i $EXT_IF -j DROP

    iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
    iptables -A INPUT -i $EXT_IF -p tcp --dport 22 -j ACCEPT
    iptables -A INPUT -i $EXT_IF -j DROP


Nat-only version:

    iptables -t nat -A PREROUTING -i $EXT_IF -p tcp --dport 80 -j DNAT \
             --to-destination $INT_SERVER
    iptables -t nat -A PREROUTING -i $EXT_IF -p tcp --dport 22 -j ACCEPT
    iptables -t nat -A PREROUTING -i $EXT_IF -j DROP

    iptables -t nat -A POSTROUTING -o $EXT_IF -j SNAT \
             --to-source $EXT_ADDR


What are your thoughts on this?  May I go on writing my firewalls like
this, or should I expect them to be broken into in some subtle way?

Consider that in a real firewall I would insert rules against address
spoofing (private classes, localhost class) in both versions.


Toby

