From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: -p protocol question
Date: Thu, 06 May 2004 15:59:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083851964.1821.33.camel@anduril.intranet.cartel-securite.net>
References: <39017.4.19.111.130.1083848313.squirrel@home.schroedernet.net>
	 <1083849335.2068.599.camel@grendel>
	 <51874.4.19.111.130.1083849369.squirrel@home.schroedernet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <51874.4.19.111.130.1083849369.squirrel@home.schroedernet.net>
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
To: wschroed@schroedernet.net
Cc: Chris Brenton <cbrenton@chrisbrenton.org>, netfilter@lists.netfilter.org

Le jeu 06/05/2004 =E0 15:16, wschroed@schroedernet.net a =E9crit :
>  iptables -A INPUT -i eth0 -p 132 -s 192.168.0.1  -d 192.168.0.22 -j AC=
CEPT
>  iptables -A INPUT -i eth0 -p smp -s 192.168.0.1  -d 192.168.0.22 -j AC=
CEPT
> both work... I will clarify this point in my paper.

It works as long as you have the appropriate entry within /etc/protocols
file. And you have the same feature for services regarding /etc/services
file, and DNS stuff with /etc/hosts and resolver configuration.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

