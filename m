From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: bind 9 and iptables
Date: Fri, 27 Aug 2004 19:34:26 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC906420E@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Hi Again,
>
> Damn it still not working why i said it was working was was
> because of cached ip's as soon as i tried to access a site
> that hasn't been cached it would give me a unknown host
> error.
>
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
>
> iptables -A INPUT -p udp -i eth0 -s 192.168.0/24 -d
> 192.168.0.1 --dport 53 -j ACCEPT
> iptables -A INPUT -p tcp -i eth0 -s 192.168.0/24 -d
> 192.168.0.1 --dport 53 -j ACCEPT
> iptables -I OUTPUT -m state --state ESTABLISHED,RELATED -j
> ACCEPT
>
> iptables -I INPUT -i lo -j ACCEPT
> iptables -I OUTPUT -o lo -j ACCEPT
>
> iptables -A FORWARD -i eth0 -o ppp0 -p tcp -j ACCEPT
> iptables -A FORWARD -i eth0 -o ppp0 -p udp -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j
> ACCEPT
>
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>
> Thats my rules im trying to get dns to work atm.
>
> When i comment these out everything works fine:
>
> #iptables -P INPUT DROP
> #iptables -P OUTPUT DROP

somewhere along the line, you lost:

  iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

-j

ps - in the future, it's easier to help if you provide the output of:
     iptables -vnL && iptables -t nat -vnL && iptables -t mangle -vnL
