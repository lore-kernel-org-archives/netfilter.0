From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: block ports
Date: Mon, 16 Sep 2002 13:08:36 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPAEMOCOAA.stewart.thompson@shaw.ca>
References: <0H2J007DEP30QE@l-daemon>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <0H2J007DEP30QE@l-daemon>
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
To: PayalR <payal@hotpop.com>, netfilter@lists.netfilter.org

Hi Payal:

	No offence to Alex, but I would go with Antony's
Advice, and make your policies drop. Theoretically it isn't
necessary to have a drop rule at the end. However I do have
a log and drop rule in each chain for troubleshooting purposes.
Using the logs, and tcpdump or ethereal you can see where
the packets are going.
	If your policy is drop, you should be protected from
these Trojan's and Worms if they are attacking an unused
port, However, if you want to put in a specific rule, I prefer
drop to reject. I would just as soon not even let attackers
know there is a machine there at all. Just my 2 cents worth.
Hope that helps.

Stu.........

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of PayalR
Sent: September 16, 2002 12:02 PM
To: netfilter@lists.netfilter.org
Subject: Re: block ports

Hi,
Thanks a lot for the mails. They were pretty helpful.
I still have some doubts.
Anthony suggests putting,
iptables -P INPUT DROP
at start of rules while Alex wants it at end. What do I do?
I want to send email and browse the net from server. The server does have to
make dns look-ups.

One more small thing, I was getting flood udp requests to port 2002. I had
blocked ICMP totally incoming as outgoing totally. Now what i did was for
port 2002 INPUT rule I told to REJECT the packet with reject-with
icmp-port-unreachable. Now will this setup send the error message back to
the
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
> > and go for the other ports as well. But my problem is that if a packet
> > arrives from port 110, it will be checked for rule 1 above and since it
> > is not for port 22 it will be dropped disregarding the next rules.
Right?
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


