From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: ICMP question
Date: Thu, 14 Nov 2002 20:59:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211142059.43778.netfilter@newkirk.us>
References: <NABBIDJPNCAGKGOFGHBFOELFPIAA.luba@assist.com.gt>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NABBIDJPNCAGKGOFGHBFOELFPIAA.luba@assist.com.gt>
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
To: Luis Fernando Barrera <luba@assist.com.gt>, netfilter@lists.netfilter.org

On Thursday 14 November 2002 01:28 pm, Luis Fernando Barrera wrote:

> iptables -A FORWARD -p ICMP -s 192.168.1.37 -m state --state
> NEW,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -p ICMP -d 192.168.1.37 -m state --state ESTABLISHE=
D -j
> ACCEPT
>
> I've been experiencing the problem that with this set of rules, suddenl=
y,
> the PC in the LAN cannot "ping" any hosts in the Internet. To solve the
> problem

> iptables -A FORWARD -p ICMP -s 192.168.1.37 -j ACCEPT
> iptables -A FORWARD -p ICMP -d 192.168.1.37 -j ACCEPT
>
> These are the same rules, except that don't track the state of the
> connections...
>
> Could someone tell me what is the risk asociated to NOT to track the
> connections?

For the first rule just use the second version (without state match), but=
 for=20
the second rule you want state as it will prevent any ICMP connections=20
originating anywhere else from being forwarded to that IP, assuming other=
=20
rules and policy don't ACCEPT it.  (and assuming you don't want that...) =
 The=20
new pair would then allow any ICMP through that came FROM 192.168.1.37, a=
nd=20
prevent any ICMP from going TO 192.168.1.37 UNLESS it is part of an=20
established connection, IE a response to a ping that was ACCEPTed by the=20
first rule.

Using the state matches can help you tighten things up considerably, and =
also=20
considerably reduce the number of rules you need to explicitly define.  Y=
ou=20
can allow a local machine out only to port 80 and 53, nothing back to it =
at=20
all, then accept ESTABLISHED/RELATED both ways and everything will work,=20
because the responses back to the local machine, and even ICMP messages=20
related to the connection, are matched based on state.

> One more question... Is it true that when you specify the ICMP protocol=
,
> iptables only
> applies the rule to the type 0?

Nope, unless it's a bug in a version other than 1.2.5, I just tested.  (P=
ing=20
my ISP's DNS, nothing, added ICMP rule with no type specified, 18.2ms)

> thanks in advance
>
> Luis Fernando Barrera
> luba@assist.com.gt

j

