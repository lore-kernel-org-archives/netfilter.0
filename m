From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: (no subject)
Date: Fri, 21 Nov 2003 15:10:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019D15@hslex01.hslbz.local>
References: <1069417756.3fbe051c48a7d@paris-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069417756.3fbe051c48a7d@paris-hme1>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

>   ->  iptables -A INPUT -m state --state=20
> RELATED,ESTABLISHED -j ACCEPT
>=20
> if i understand this correctly, this rule is what it=20
> takes to accept all related connections that are=20
> caught and just related with any kind of connection=20

When a connection is made, the first packet that is seen in a connection
has state NEW. All other packet in that connection have state
ESTABLISHED.
If an application (like ftp) is opens other ports (like 20/tcp) then
those packets have state RELATED.
For a more detailed description :
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#USERLANDST
ATES

If you write a rule like :
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i <if_lan> -s <ip_admin> -p tcp --dport 22 -j ACCEPT
Only the initial packet coming in on the LAN nic, having your admin IP,
destined for the ssh port matches. The rest is handled by ESTABLISHED.

You can see this if you have the rules working for some time and then
issue a : iptables -nvL
Here you can see the byte counters for each chain and you'll see that
the RELATED,ESTABLISED rules are by far the biggest compared to the
other rules.

> (correct me if i'm wrong.. :) )... it doesn=B4t matter=20
> from where it comes or where it goes. just being=20
> related is enough for the rule to catch and accept, in=20

Yep.

> this case, the related traffic that came from the=20
> www.hotmail.com connection... ;)) without the need to=20
> specify the --dport or --sport.

Mostly you don't know what ports to accept and it's quite safe to do
this.
You can add additional options to the rule to restrict packet flow, but
this rule can be used.

> hotmail.com was just an exemple! many urls will follow=20

I didn't specify any Hotmail specific rules ;o).
It should work for (virtually ?) any website.

> since i'll be accepting almost all kind os urls except=20
> those of porno ones, ftp ones... and all those kind of=20
> thing that can distract one from his work !! ;))=20
> (hehe!!)

If you use Squid, use a content filter like SquidGuard for that. I think
that'll be easier and afaik there are regularly updated blocklists for
SquidGuard.

You could restrict access to ftp servers running on port 21 (which
catches most) with :
iptables -A OUTPUT -o <if_inet> -p tcp --dport 21 -j REJECT
--reject-with tcp-reset
However, this way you will not be able to access any ftp server unless
you use NAT which uses the FORWARD chain.

> about the output chain... i had it to accept, so i=20
> assume i don't need those rules about the output=20
> chain... is that correct..!? :))

Having it set to ACCEPT and no rule to tell it to DROP, REJECT or
whatever, it should let any packet go out.


Gr,
Rob


