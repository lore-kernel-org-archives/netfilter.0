From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: mport or multiport?
Date: Tue, 12 Jul 2005 12:47:29 +0200
Message-ID: <1121165249.5328.34.camel@anduril.intranet.cartel-securite.net>
References: <3115d56e05071203266e32e178@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3115d56e05071203266e32e178@mail.gmail.com>
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
To: afshin lamei <afshinlamei@gmail.com>
Cc: netfilter@lists.netfilter.org

Le mardi 12 juillet 2005 =E0 14:56 +0430, afshin lamei a =E9crit :
> "iptables -A INPUT -p tcp -m mport --ports 20:23,80 -j DROP " from
> patch-o-matic is perfect, but what is that: Source port or Destination
> port?

Sorry, but RTFM :)

$iptables --version
iptables v1.3.1
$ man iptables
[...]
   mport
       This module matches a set of source or destination ports. Up to
       15 ports can be specified. It can only be used in conjunction
       with -p tcp or -p udp.

       --source-ports port[,port[,port...]]
              Match if the source port is one of the given ports. The
              flag --sports is a convenient alias for this option.

       --destination-ports port[,port[,port...]]
              Match if the destination port is one of the given ports.
              The flag --dports is a convenient alias for this option.

       --ports port[,port[,port...]]
              Match if the both the source and destination ports are
              equal to each other and to one of the given ports.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

