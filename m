From: PayalR <payal@hotpop.com>
Subject: Re: block ports
Date: Tue, 17 Sep 2002 00:31:54 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <34820.4440706924$1032203293@news.gmane.org>
References: <200209161226.11945@.> <20020916074619.KCJK295.mta06-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020916074619.KCJK295.mta06-svc.ntlworld.com@there>
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

Hi,
Thanks a lot for the mails. They were pretty helpful.
I still have some doubts.
Anthony suggests putting,=20
iptables -P INPUT DROP=20
at start of rules while Alex wants it at end. What do I do?
I want to send email and browse the net from server. The server does have=
 to=20
make dns look-ups.

One more small thing, I was getting flood udp requests to port 2002. I ha=
d=20
blocked ICMP totally incoming as outgoing totally. Now what i did was for=
=20
port 2002 INPUT rule I told to REJECT the packet with reject-with
icmp-port-unreachable. Now will this setup send the error message back to=
 the=20
remote server, cos' in the previous rule I had totally blocked ICMP.

Thanks a lot and bye.
With regards.
-Payal





On Monday 16 September 2002 01:16 pm, you wrote:
> On Monday 16 September 2002 8:02 am, PayalR wrote:
> > Hi all,
> > I have a stupid question. I want to have incoming internet access for
> > only port 22, 25, 80 and 110. How do I go abut it?
> > I thought of this rule first,
> >
> > #iptables -A INPUT -i eth0 -p tcp --dport ! 22 -j DROP
> >
> > and go for the other ports as well. But my problem is that if a packe=
t
> > arrives from port 110, it will be checked for rule 1 above and since =
it
> > is not for port 22 it will be dropped disregarding the next rules. Ri=
ght?
>
> Right.
>
> The recommended way to configure a firewall is "block everything except
> what you want to allow".   Therefore do this:
>
> iptables -P INPUT DROP
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 25 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 110 -j ACCEPT
>
> I recommend the ESTABLISHED, RELATED rule to make sure that things like
> ICMP get through as well.
>
> Antony.

