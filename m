From: "Fredrik Emil Jensen" <fredrik.jensen@netpower.as>
Subject: RE: transparent proxy
Date: Mon, 15 Mar 2004 10:19:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3C204966522884458700FF59D6EFB87A474DDE@FORUS01.netpower.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Netfilter <netfilter@lists.netfilter.org>

Hey=20

I'm currently using squid and squidGuard for redirection. Setting up the
rules:

Iptables -t nat -A PREROUTING -p tcp -s 192.168.1.0/24 -d 0/0 --dport 80
-j REDIRECT --to-ports 3128=20

But does anyone know what to do if you want to use iptables to bypass
squid with single IP address?

I know that you can add the rule "iptables -t nat -A POSTROUTING -o eth0
-s 192.168.1.10/32 -d 0/0 -j SNAT --to "source_Wan_address" ". But this
rule will be added at the end of the rule list, and all traffic on port
80 will still be redirected through squid. Even when I use priority
"iptables -t nat -I POSTROUTING 1 etc" and I put higher priority on the
rule for the bypass IP, it is still being redirected through squid. I
have to remove the redirect rule before I can bypass squid.=20

Does anyone know what I'm doing wrong?

Using Slackware 9.1 with Kernel 2.6.2, iptables version 1.2.9 and squid
2.5

Regards,=20
Fredrik

-----Original Message-----
From: Daniel F. Chief Security Engineer -
[mailto:danielf@supportteam.net]=20
Sent: 27. februar 2004 18:01
To: Tomasz Macioszek; Netfilter
Subject: Re: transparent proxy

That rule should work fine, make sure you compiled squid with:

./configure --enable-linux-netfilter=20

But for more usefull info :)
Here is a nice HOW-TO
http://en.tldp.org/HOWTO/TransparentProxy.html


On Friday 27 February 2004 02:48, Tomasz Macioszek wrote:
> Hello!
> I have a Linux server acting as a gateway between internal network and
> internet. The iptables rule set have been working  good for long time.
> I have configured squid on this server. When I have set internal
network
> client to use directly proxy server it has worked properly. But when I
have
> set iptable to redirect all http traffic to squid  port (3128) it
didn't
> work (transparent proxy).
> This is my iptable rule:
> iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port
3128
> I think that all options in my kernel are set properly.
> I don't know why it doesn't work
> I set tcpdump to listen on 3128 port and when client tried to connect
to
> web server on port 3128 showed only first IP  package of this
connection
> and connections failed.
> Could you send me a solution for this problem?
> Best regards
> Tomek

--=20
_,.-:*"``'*:-.,_,.-:*"``'*:-.,_,.-:*"``'*:-.,_,.-:*"``'*:-.,_,.-:*"``'*:
-.,_
Daniel Fairchild - Chief Security Officer | danielf@supportteam.net
The distance between nothing and infinity is always the same no matter
how=20
close you get to nothing.




