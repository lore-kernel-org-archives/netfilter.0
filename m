From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: iptables and port mapping
Date: Mon, 10 Mar 2003 02:57:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303100257.44740.netfilter@newkirk.us>
References: <web-117748330@back2.chartermi.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-117748330@back2.chartermi.net>
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
To: "Mcminn, Matt 8869" <melfinadev@chartermi.net>, netfilter@lists.netfilter.org

On Monday 10 March 2003 01:05 am, Mcminn, Matt 8869 wrote:

> What I want to do is map port 80 on the external interface
> (eth0) to port 80 on my internal (eth1) 192.168.0.2 ip
> address.  So what I thought would do this is:
>
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
> DNAT --to 192.168.0.2
> iptables -I INPUT -d 192.168.0.0/32 -j ACCEPT

First part is right, second is wrong.  Once you DNAT it, it is no longer=20
destined for the machine running iptables, so it goes to FORWARD chain,=20
not INPUT chain.  (also you have problems with that rule's construction:=20
using "-I" you should specify a rule number to insert before, like "-I=20
INPUT 4" to make it the 4th rule, plus your /32 mask will only match=20
that single IP...)  Just change your second rule to:

iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 80 -j ACCEPT

and the request will reach the local server.  Getting the reply traffic=20
back out is a separate issue in FORWARD.  If you don't already have=20
outbound traffic ACCEPTed, you'd need something like one of these:

iptables -A FORWARD -s 192.168.0.2 -p tcp --sport 80 -j ACCEPT
or
iptables -A FORWARD -s 192.168.0.2 -m state --state    \
ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -d 192.168.0.2 -m state --state    \
ESTABLISHED,RELATED -j ACCEPT

The second pair (using the state match) is preferable, since they will=20
also allow ICMP traffic related to the HTTP connection.  If you already=20
have connectivity from the local machines through this box to the=20
internet then you probably don't need anything for outbound replies. =20
Also, the state pair is subsumed in the more general rule:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

which is commonly used to allow those two states to pass the FORWARD=20
chain in any direction.

j


