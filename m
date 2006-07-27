From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: IPTABLES , help requested , have problem in forwarding port 110
 to 8110
Date: Thu, 27 Jul 2006 11:10:45 +0200
Message-ID: <44C88315.3060006@plouf.fr.eu.org>
References: <20060727063003.28711.qmail@web55508.mail.re4.yahoo.com>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127E7@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C40127E7@knowledge.wizdom.nu>
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

Sietse van Zanen a =E9crit :
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport pop3 -j DNAT --to =
192.168.242.129:8110
> This rule would NAT all traffic coming into eth0 for port 110 to
> 192.168.242.129:8110, also traffic to other servers, that might need to
> be reached on port 110.

That's exactly what John wants : "I want *all POP3 packets* coming  in=20
through the gateway  wan interface (eth0) to be redirected  to the=20
PS1(192.168.242.129 inside the lan) port 8110".

> ACCEPT     all  --  anywhere             anywhere
> This converts your DROP policy to an ACCEPT, doesn't seem wise.

Remember that iptables -L hides some rule parameters such as interfaces.=20
I would not be surprised that this rule actually contains "-i eth1".
I strongly suggest John and anyone lists iptables rules with=20
iptables-save instead of iptables -L.

> For the rest, your rules should work.

I agree.

