From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Bastion Firewall Host Redirect Question
Date: Fri, 17 Dec 2010 22:35:34 +0100
Message-ID: <4D0BD7A6.7040908@plouf.fr.eu.org>
References: <000601cb9b9e$c6e81e30$54b85a90$@com> <AANLkTi=xSuKsKw7UPiR1aTCCf0G9AGt7tiu6Unu3PCUA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=xSuKsKw7UPiR1aTCCf0G9AGt7tiu6Unu3PCUA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Billy Crook <billycrook@gmail.com>
Cc: iic1tls@yahoo.com, netfilter <netfilter@vger.kernel.org>

Hello,

Billy Crook a =E9crit :
> On Tue, Dec 14, 2010 at 08:54, iic1tls <iic1tls@yahoo.com> wrote:
>> I have attempted several iptables rules, including:
>> iptables -v -t nat -A PREROUTING --in-interface eth1 --dport 80 -d
>> www.website.com -j DNAT --to 149.10.10.25
>=20
> When you hit enter to commit this rule the iptables command resolves
> www.website.com to an ip address, and then hands the request to add a
> rule to netfilter.  The in-kernel rule will not change when
> website.com's IP changes, which may happen at any time.  If clients
> get a different IP for website.com (say they have multiple IPs), thei=
r
> access will not be intercepted by the iptables rule.

Conversely, access to any other site hosted at the same IP address will
be intercepted.

> iptables does not filter on domain names.

Nor web site (HTTP Host:) names. Bottom line.
