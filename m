From: KOVACS Krisztian <piglet@sch.bme.hu>
Subject: Re: Server crash after LIST_DELETE in Log
Date: Wed, 24 Mar 2004 21:41:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040324204118.GA18860@sch.bme.hu>
References: <s061bfaf.021@odnw1.minimaxgmbh.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <s061bfaf.021@odnw1.minimaxgmbh.de>
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
To: =?iso-8859-1?Q?Bj=F6rn?= Reese <ReeseB@minimax.de>
Cc: netfilter@lists.netfilter.org


  Hi,

On Wed, Mar 24, 2004 at 05:04:20PM +0100, Bj=F6rn Reese wrote:
>  I have a strange Problem with (I guess) the Netfilter. I have a Proxy-=
Server running, that is dual-homed with a transparent Squid on one Interf=
ace listening. After some time, the syslog lists these messages:
>=20
> Mar 24 15:36:18 Proxy kernel: LIST_DELETE: net/ipv4/netfilter/ip_conntr=
ack_core.c:299 `&ct->tuplehash[IP_CT_DIR_REPLY]'(e96c0d64) not in &ip_con=
ntrack_hash[hr].
> Mar 24 15:36:39 Proxy kernel: LIST_DELETE: net/ipv4/netfilter/ip_conntr=
ack_core.c:299 `&ct->tuplehash[IP_CT_DIR_REPLY]'(dd67fd24) not in &ip_con=
ntrack_hash[hr].
> Mar 24 15:36:55 Proxy kernel: LIST_DELETE: net/ipv4/netfilter/ip_conntr=
ack_core.c:299 `&ct->tuplehash[IP_CT_DIR_REPLY]'(dc976864) not in &ip_con=
ntrack_hash[hr].
>=20
> 5 seconds more...
> and the server freezes...

  Although without your kernel config and exact iptables ruleset I cannot
be sure, but I think you've found the same bug as Jonathan Cooper (and a
few others). See the thread about the problem on netfilter-devel:

http://lists.netfilter.org/pipermail/netfilter-devel/2004-March/014532.ht=
ml

Basically, you should try two things:

- check if using CONFIG_IP_NF_NAT_LOCAL (NAT of local connections)
  solves the problem

- if i does, please try if Henrik's patch at=20
http://lists.netfilter.org/pipermail/netfilter-devel/2004-March/014616.ht=
ml
solves your problem

  To try the patch would be especially useful.

--=20
 KOVACS Krisztian


