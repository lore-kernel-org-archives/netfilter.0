From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: New to IP Tables
Date: Sun, 24 Nov 2002 21:04:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211242104.46139.netfilter@newkirk.us>
References: <580E532D9F7A9B4BAE8A130848E0DDA702A0B74F@franklin.narus.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <580E532D9F7A9B4BAE8A130848E0DDA702A0B74F@franklin.narus.com>
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
To: David Reta <DavidR@Narus.com>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Wednesday 13 November 2002 07:14 pm, David Reta wrote:
> I just started using IP Tables and have a question. I was not able
> to find the answer in any of the docs I've read so far.
> I have a machine that I am using as a router and running Ip Tables on i=
t.
> Here is a list of my tables.
>
> [root@qa-gate root]# iptables -L
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
>
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:htt=
p
> ACCEPT     tcp  --  anywhere             anywhere           tcp
> dpt:ftp-data
>
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ftp
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:dom=
ain
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:26
> DROP       tcp  --  anywhere             anywhere
>
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>
> Chain test (0 references)
> target     prot opt source               destination
>
> I am not able to pass any data through the router. Here is the scenario=
, I
> want to access a Web Site which is on the other side of the router. The=
 way
> that I interpret this is that the packet will get passed to the first c=
hain
> which is
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:htt=
p
> and be let through, yet this is not happening. All tcp traffic is being
> blocked which is defined by my 6th rule. I guess I am not understanding
> this, but I would think that the packet would match the first rule and =
be
> passed through and the following chains would be ignored. My logic is
> probably wrong.

It is right as far as it goes.  But the only thing that rule allows is pa=
ckets=20
with a destination port 80.  The returning traffic would likely have SOUR=
CE=20
port 80, which is not allowed through.  Also make sure you have forwardin=
g=20
enabled, with=20
echo "1" > /proc/sys/net/ipv4/ip_forward

If you invoke "/sbin/iptables -L -v -n" it will list your filter table ru=
le=20
chains (INPUT,OUTPUT,FORWARD, but not NAT or MANGLE tables) including the=
=20
number of packets & total data size that has matched each rule.  If you t=
ry=20
this, you will probably find that the --dport 80 rule IS matching, and=20
allowing connections out, but return traffic is dropping through to the D=
ROP=20
rule, since it's dport will usually be the unprivileged port that the req=
uest=20
specified as its sourceport.

You should (eventually, after getting things working) set DROP as the pol=
icy=20
at least for forward, usually for input, and also output for thoroughness=
=2E =20
(just set ACCEPT rules for desired traffic)  If you enable ip_conntrack=20
(insmod ip_conntrack) then the rule
/sbin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
will allow responses back, and allow related connections (like ICMP Host=20
Unreachable) between the same two points that have an ESTABLISHED connect=
ion. =20
Note that this will work currently because you have a default ACCEPT poli=
cy.

Depending on your setup, you might want to tighten your rules quite a bit=
=2E =20
IE, you currently allow forwarding of ANY traffic with your 5 designated=20
destination ports, regardless of where it is from or to.  Especially if t=
his=20
firewall is accessible from the internet, you should handle things more=20
carefully.

In addition, I wanted to add that you should be allowing UDP 53, not (or =
not=20
just) TCP 53 for DNS requests.  This works ok now since all UDP passes by=
 all=20
these rules and is ACCEPTed by the chain policy, but if that policy is DR=
OP=20
then suddenly you will find that web browsing will usually fail.

j

