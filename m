From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: How to loop back internal traffic?
Date: Sat, 10 Feb 2007 12:07:46 +0100
Message-ID: <1171105666.4319.5.camel@anduril.intranet.cartel-securite.net>
References: <BAY101-F34372C92C74BBC676F0D39D9930@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY101-F34372C92C74BBC676F0D39D9930@phx.gbl>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Jorge Canas <jcanas2000@hotmail.com>
Cc: netfilter@lists.netfilter.org

Le samedi 10 f=E9vrier 2007 =E0 03:45 -0500, Jorge Canas a =E9crit :
> How do I configure the firewall rules on the gw so that the port forwardi=
ng=20
> also occurs when my other local network machines try to go to the website=
=20
> via the public domain name?

You have to extend your SNAT rule so thoses machines egts NATed when
trying to reach this webserver using its public IP, otherwise, you'll
get a triangle situation where your webserver sends its SYN/ACK directly
through the LAN with its private IP.

Something like:

	iptables -t nat -A POSTROUTING -s $LAN -d $WebServPrivIP \
		-j SNAT --to-source $GWPrivIP


BTW, it's a FAQ, but I agree it might be difficult to find relevant
answers in the wild.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

