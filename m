From: =?unknown-8bit?b?sLAg/uP+4yDf6nL74vFnILCw?= <duppeh@yahoo.com>
Subject: dnat to multiple destination *correction*
Date: Wed, 26 Oct 2005 07:14:21 -0700 (PDT)
Message-ID: <20051026141421.43651.qmail@web53308.mail.yahoo.com>
References: <20051026140258.79270.qmail@web53313.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051026140258.79270.qmail@web53313.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

hi there,

recently i read iptables man page,
in the DNAT part :
You  can  add  several --to-destination options.  If
you specify more than
one destination address, either via an address range
or multiple --to-des=ADtination  options,  a simple
round-robin (one after another in cycle) load
balancing takes place between these adresses.
=20
in my mind, it sounds like:
iptables -t nat -A PREROUTING -s xxx.xxx.xxx.xxx -p
tcp
--dport 80 -j DNAT --to-destination aaa.aaa.aaa.aaa
--to-destination bbb.bbb.bbb.bbb

but it says invalid arguments.
which part was wrong ?

cheers,
Agung


	=09
__________________________________=20
Start your day with Yahoo! - Make it your home page!=20
http://www.yahoo.com/r/hs

