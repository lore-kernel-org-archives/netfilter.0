From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: More neqbie questions
Date: Mon, 2 Aug 2004 14:16:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051221@asimail2.alphanumeric.com>
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
To: Eric Ellis <eellis@mail.co.gilchrist.fl.us>, netfilter@lists.netfilter.org

> # DNS
> $IPT -A INPUT -i $INT -p udp --dport 53 -j ACCEPT

is this machine a caching DNS server?

> ### OUTPUT chain
> # The only thing doing output on this box are proxy
> # servers, and the occasional SSH and HTTP for
> # testing.
> # SQUID proxy, and local HTTP requests.
> $IPT -A OUTPUT -p tcp --dport 80 -j ACCEPT
>
> # SSH
> $IPT -A OUTPUT -p tcp --dport 22 -j ACCEPT
>
> ### FORWARD chain
>
> $IPT -A OUTPUT -p tcp --dport 80 -j ACCEPT
>
>
> # SSH
>
> $IPT -A OUTPUT -p tcp --dport 22 -j ACCEPT

if the answer to my previous question was "yes," you're going to need:

	$IPT -A OUTPUT -p udp --dport 53 -j ACCEPT

if not--you're going to need:

	$IPT -A FORWARD -i $INT -p udp --dport 53 -j ACCEPT

> # Accept anything else that's been established
>
> $IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>

might i also recommend:

	$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
	$IPT -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

(normally i put these as the first rule in each chain rather than the =
last)

another common piece that is absent, that is probably causing your squid =
redirect to fail:

	$IPT -A INPUT -i lo -j ACCEPT
	$IPT -A OUTPUT -o lo -j ACCEPT

-j

