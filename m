From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: fw-builder
Date: Thu, 2 Jan 2003 21:01:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301022101.53365.netfilter@newkirk.us>
References: <20ED00AA0BC135449469D6EF0AE79C970FA3@ozlan.fcdomain.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20ED00AA0BC135449469D6EF0AE79C970FA3@ozlan.fcdomain.net>
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
To: "Simpson, Doug" <dsimpson@friedmancorp.com>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Thursday 02 January 2003 04:18 pm, Simpson, Doug wrote:
> Here is my rc.firewall that I generated using FW Builder.
> I want to add these lines -
> iptables -t nat -A POSTROUTING -p tcp --dport 110 -o eth0 -s
> $INTERNAL_IP -j SNAT --to $external_ip
> iptables -t nat -A POSTROUTING -p tcp --dport 23 -o eth0 -s
> $INTERNAL_IP -j SNAT --to $EXTERNAL_IP
> Where can I put these in the script and do I need to follow the same
> pattern as the script?
> Thank you
> Doug
> ##############################################
> #!/bin/sh
> #
> #  This is automatically generated file. DO NOT MODIFY !
> #
> #  Firewall Builder  fwb_ipt v1.0.7-

> $IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

Right here would probably make sense.  Actually you can put them=20
anywhere, since there are no other POSTROUTING rules in the script. =20
Just DON'T put them inside a loop or a conditional statement.  There's=20
no explicit need to follow the pattern in the script, but be aware that=20
if you rebuild the ruleset with fw-builder you will need to manually=20
re-insert these afterwards, AFAIK.

j


