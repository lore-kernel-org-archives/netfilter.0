From: Axel Heinrici <heinrici76@gmx.de>
Subject: Re: block ports
Date: Mon, 16 Sep 2002 09:53:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209160953.50974.heinrici76@gmx.de>
References: <200209161226.11945@.>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209161226.11945@.>
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

Hi
on 16. September 2002 09:02 PayalR wrote:
> Hi all,
> I have a stupid question. I want to have incoming internet access for
> only port 22, 25, 80 and 110. How do I go abut it?
> I thought of this rule first,
>
> #iptables -A INPUT -i eth0 -p tcp --dport ! 22 -j DROP
>
> and go for the other ports as well. But my problem is that if a
> packet arrives from port 110, it will be checked for rule 1 above and
> since it is not for port 22 it will be dropped disregarding the next
> rules. Right?
>
> What can I do about this? How do I exactly frame the rules?
> Thanks a lot and bye.

 #iptables -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT
 #iptables -A INPUT -i eth0 -p tcp --dport 25 -j ACCEPT
 #iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
 #iptables -A INPUT -i eth0 -p tcp --dport 110 -j ACCEPT
=20
 And at the end of the Chain
#iptables -A INPUT -i eth0 -p tcp --dport 1:1024 -j DROP
to drop all other priviledged ports or =20
#iptables -P INPUT DROP
to drop all other traffic (use when you know you want to drop all=20
including ICMP and UDP)

You know that this is not the right way if you want to "surf", send=20
email and use ssh. This is the server-side setup for this.

greetings=20
=09Axel


