From: "Reckhard, Tobias" <tobias.reckhard@secunet.com>
Subject: RE: Translating Ziegler Book ipchains Rules
Date: Wed, 11 Dec 2002 13:43:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <96C102324EF9D411A49500306E06C8D1021AE3F2@eketsv02.cubis.de>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> That script has nice, symmetrical pairs of rules like this:
> 
> # HTTP (80) - accessing remote web sites as a client
> ipchains -A output -i eth1 -s $IPADDR $UNPRIV -d 0/0 80 -p 
> tcp -j ACCEPT
> ipchains -A input -i eth1 -s 0/0 80 -d $IPADDR $UNPRIV -p tcp 
> ! -y -j ACCEPT
> 
> With connection tracking in iptables, can all these pairs be 
> cut to just
> one rule, like this:
> 
> $IPTABLES -A FORWARD -o eth1 -s $IPADDR -p tcp --sport $UNPRIV  \
> --dport 80 -j ACCEPT
> 
> Or do I still need this, too?
> 
> $IPTABLES -A FORWARD -i eth1  -p tcp --sport 80 -d $IPADDR \
> --dport $UNPRIV ! --syn -j ACCEPT

You can, if you wish, make do with the following:

# Allow all established and related traffic to pass the FORWARD chain
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow HTTP session initiation
$IPTABLES -A FORWARD -p tcp -s $IPADDR -i $INIF --dport 80 -o eth1 \
  -m state --state NEW -j ACCEPT

> Similarly, is it necessary to have multiple rules for ftp control
> and data ports, or does ip_conntrack_ftp handle everything with just
> one rule, like this:
> 
> $IPTABLES -A FORWARD -o eth1 -s $IPADDR -p tcp --sport $UNPRIV  \
> --dport 21 -j ACCEPT
> 
> Or do I need these in pairs also, with parallel ones for port 21?

Well, the first rule above takes care of ESTABLISHED and RELATED traffic, so
you should only need the above rule. You should use "-m state --state NEW"
in it, though.

If you don't want to trust netfilter's state that much, you can still use
ipchains style rules and state, if you want.

Tobias

