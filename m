From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: iptables forward rulesets woes
Date: Wed, 24 Sep 2003 07:49:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001c01c3825f$99375470$0401000a@tanjian>
References: <200309240448.KAA10542@WS0005.indiatimes.com>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309240448.KAA10542@WS0005.indiatimes.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'akshaysalkar' <akshaysalkar@indiatimes.com>, netfilter@lists.netfilter.org

> iptables -F FORWARD
> iptables -P FORWARD DROP
> iptables -A FORWARD -m tcp -p tcp -s 0/0 --sport 80 -d
> 172.16.1.0/24 --syn -j DROP
> iptables -A FORWARD -m tcp -p tcp -s 172.16.1.0/24  --sport
> 80 -d 0/0 -j ACCEPT
> iptables -A FORWARD -m tcp -p tcp -d 172.16.1.0/24  --dport
> 80 -s 0/0 -j ACCEPT
>
> i dont kinda understand this...
> firstly 2nd line whats the -P. i guess its the default
> policy. but i could have given as
> iptables -A FORWARD -j DROP

Yes, it's default policy and indeed you could also do that to with -A,
but then it should be your last rule ; you can easily forget to do that
when setting up you rules.
Normally you start with DROPing everything and after that create rules
for packets you want to accept.

See : man iptables and the iptables tutorial
(http://iptables-tutorial.frozentux.net/).

> 2nddly 3rd line why the -j DROP i thought it should be ACCEPT

No. You _don't_ want new incomming connections (--syn) from port 80 to
be forwarded because you didn't initiate them.
I cannot imagine a webserver sending out packets to one of my
workstations by all itself (so I didn't make a request to it) ;-).. Can
you ?

> 3rdly since it says access the WWW servers on the internet
> why is it that on the 4th linethe --sport is 80
> the source doesnt necessarily have to be 80 it could be any
> unprivileged port. the --dport should be infact 80

What they want to do is to let return packets pass, as they don't use
the RELATED,ESTABLISHED states.
But, as you say, a packet is coming FROM 172.16.1.0/24 TO port 80/tcp.
Thus it should be -d.
And in the next line a packet is going TO 172.16.1.0/24 FROM port 80/tcp
thus should be -s as we most likely are not listening on port 80.

I wouldn't do it this way. The state framework is easier to use.

> and the last line also seems confusing to me. where the -d is
> the network-ip
>
> please help me/ suggest.

iptables -F FORWARD
iptables -P FORWARD DROP
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD [-i if_in] -s 172.16.1.0/24 -p tcp --dport 80 -j
ACCEPT
iptables -A FORWARD [-i if_in] -s 172.16.1.0/24 -p tcp --dport 443 -j
ACCEPT
(The part I'm missing here :)
iptables -t nat -A POSTROUTING [-o if_out] -s 172.16.1.0/24 -p tcp
--dport 80 -j SNAT --to-source <ip_ext>
iptables -t nat -A POSTROUTING [-o if_out] -s 172.16.1.0/24 -p tcp
--dport 443 -j SNAT --to-source <ip_ext>

Flush all rules.
Set default policy to DROP.
RELATED,ESTABLISHED will take care of any return packets.
Accept packets to webservers (http and https) in the FORWARD chain.
SNAT packets to webservers in the nat table POSTROUTING chain.


Rob



