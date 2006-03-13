From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: list of ip
Date: Mon, 13 Mar 2006 14:30:36 +0100
Message-ID: <1142256637.4809.48.camel@anduril.intranet.cartel-securite.net>
References: <019f01c6469e$70c20b60$2f00a8c0@TRINTASETE>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <019f01c6469e$70c20b60$2f00a8c0@TRINTASETE>
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
To: Pedro Drimel Neto <pedrodrimel@uol.com.br>
Cc: netfilter@lists.netfilter.org

Le lundi 13 mars 2006 =E0 10:02 -0300, Pedro Drimel Neto a =E9crit :
> How do I make a rule with a lot os ips like
> IPS=3D"{192.168.1.2, 192.168.1.50, 192.168.1.55}"
> iptables -A INPUT -p tcp -s $IPS -j DROP

An iptables rule can only take one src and/org dst at the time, saying
one host or network. Thus, shell scripting is your friend:

	IPS=3D"192.168.1.2 192.168.1.50 192.168.1.55"
	for i in $IPS; do
		iptables -A INPUT -p tcp -s $i -j DROP;
	done


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

