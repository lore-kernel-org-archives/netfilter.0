From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: martians and portforwarding to 127.0.0.1
Date: Tue, 20 Apr 2004 19:20:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082481659.1838.9.camel@anduril.intranet.cartel-securite.net>
References: <20040420163326.32095.qmail@web40706.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040420163326.32095.qmail@web40706.mail.yahoo.com>
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
To: udo <udovdh@yahoo.com>
Cc: netfilter@lists.netfilter.org

Le mar 20/04/2004 =E0 18:33, udo a =E9crit :
> $path_iptables -t nat -A PREROUTING -p tcp -i $ext_if
> -s 0/0 -d $ext_ip --dport 222 -j DNAT --to
> 127.0.0.1:22

Something is quite wierd here. You say you want to run an unprivilieged
SSHd, so it won't be able to bind port 22... So, please rephrase if I'm
wrong, but I guess you want to redirect connections to port 22 to
127.0.0.1, port 2222. You seems very confused about what you want to
achieve, and the way you're trying to do it.

BTW, do not DNAT to 127.0.0.1.
Use REDIRECT that is designed for this very need :

	iptables -t nat -A PREROUTING -p tcp -i $ext_if \
		-d $ext_ip --dport 22 -j REDIRECT --to-ports 2222

Please correct me if I'm wrong. For other mistakes, see Antony's answer.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

