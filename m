From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Virtual interfaces
Date: Wed, 07 Jul 2004 08:50:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40EBFF9B.4060603@pbl.ca>
References: <200407051642.19090.francesco.chicchiricco@eposse.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407051642.19090.francesco.chicchiricco@eposse.it>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Dott. Francesco Chicchiricc=F2 wrote:
> With physical interfaces only, all works well. When a try to filter tra=
ffic=20
> between 2 LANs attached to the same physical interface but with 2 diffe=
rent=20
> virtual IPs, it starts messing. Nothing works, I can't even log packets.

Netfilter does not know about virtual interfaces.  Use physical=20
interface names in combination with source and/or destination addresses=20
(for example "-i eth0 -s 192.168.0.0/24").

 From security side, you are not gaining anything by filtering between=20
two virutal interfaces on the same wire -- stations on those two=20
networks can talk to each other directly anyhow.  If you haven't=20
disabled ICMP redirects, you'll see that Linux kernel is sending out=20
ICMP redirects telling 192.168.0.1 that 192.168.1.1 is on the same wire=20
and to talk to it directly.

