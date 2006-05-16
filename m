From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: setting up a firewall from scratch
Date: Tue, 16 May 2006 13:54:11 +0200
Message-ID: <4469BD63.2080707@plouf.fr.eu.org>
References: <1147740402.17757.261507231@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1147740402.17757.261507231@webmail.messagingengine.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Mansour Al-Aqeel a =E9crit :
> I'm a new to iptables,

So I strongly suggest that you read the "Packet Filtering HOWTO" from=20
the www.netfilter.org documentation page.

> All I need at this point is to disable any connection attempt from
> out side ($WAN) and enable everything on the ($LAN) side

By doing so, you will block the replies to packets you send. Is this=20
really what you want ?

> #delete all the existing rules from all chains
> iptables -F INPUT
> iptables -F OUTPUT
> iptables -F FORWARD

'iptables -F' does the same in a sigle command.

> #set the default policy on the external interface not to accept anythin=
g
> iptables -P INPUT -i $WAN -j REJECT  # dont let anything coming from
> outside
> iptables -P OUTPUT -i $WAN -j ACCEPT # let anything go out
> iptables -P FORWARD -i $WAN -j REJECT # dont forward anyhting from
> outside to inside

Syntax error. A default policy applies to a whole chain, it can't apply=20
to only an interface. Also, REJECT is not a valid default policy, you=20
can only use DROP or ACCEPT.

> #######################################
> ## allow everyThign internally
> #######################################
> iptables -f filter -A INPUT -i $LAN -j ACCEPT
> iptables -f filter -A INPUT -o $LAN -j ACCEPT

Syntax error. The table is specified by option -t. Option -f is to match=20
fragments. Also, you can't have a -o option (output interface) in an=20
INPUT chain.

> iptable  -A OUTPUT -i $LAN -j ACCEPT
> iptable -A OUTPUT -o $LAN -j ACCEPT

Syntax error. It's iptables, not iptable. Also, you can't have a -i=20
option (input interface) in an OUTPUT chain.

> ####forward internally through the br0
> iptables -f filter -A FORWARD -i $LAN -j ACCEPT
> iptables -f filter -A FORWARD -o $LAN -j ACCEPT

-f mistake again. There is not a single correct rule in your script, so=20
I'm not surprised that it blocks everything.

iptables targets act on individual packets, not on connections. If you=20
block anything coming from the outside, you block the replies to the=20
packets you send.

If you want to filter connections, your rules should use connection=20
tracking state match (-m state --state ESTABLISHED,RELATED) to accept=20
replies but reject new connection requests from the outside.

