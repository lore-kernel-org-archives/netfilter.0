From: MAB <mabaeyens@eresmas.com>
Subject: Re: ssh
Date: Wed, 15 Jan 2003 18:44:09 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301151844.10222.mabaeyens@eresmas.com>
References: <20ED00AA0BC135449469D6EF0AE79C971046@ozlan.fcdomain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20ED00AA0BC135449469D6EF0AE79C971046@ozlan.fcdomain.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: "Simpson, Doug" <dsimpson@friedmancorp.com>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

El Mar 14 Ene 2003 21:28, Simpson, Doug escribi=F3:
> whoops - forgot this is a dual homed computer and I am opening the eth0=
 to
> the outside world for ssh.
> I did find this -
> iptables -A INPUT -p tcp --syn --destination-port 22 -j ACCEPT

With this rule you mean you accept every incoming packet from the interne=
t=20
through the por 22, and specially packets with the SYN,RST,ACK bit sets t=
o 1=20
(you accept people should establish a connection to the 22 port)

> iptables -A INPUT -p tcp --syn -j DROP

And, out of that, every incoming TCP packet, DROPs

-Miguel Angel Baeyens

KeyID: 0x6FB7A511 en rediris.es

