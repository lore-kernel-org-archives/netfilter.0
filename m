From: Sertys <sertys@supportivo.org>
Subject: Re: Altering a packet's port
Date: Tue, 22 Mar 2005 00:00:04 +0200
Message-ID: <opsn0cqeu476nf2y@xonix>
References: <00c501c52e56$acbe6070$bf07a8c0@civicXp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <00c501c52e56$acbe6070$bf07a8c0@civicXp>
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Netfilter list <netfilter@lists.netfilter.org>

On Mon, 21 Mar 2005 15:43:44 -0500, Nicolas Ross =20
<rossnick-lists@cybercat.ca> wrote:

> Hi all !
>
> I have a quite "standard" setup as follow :
>
> 192.168.7.x/24 -> iptables/router  SNAT --to-source a.b.c.d  -> interne=
t
>
> What I want to do, is that if a packet originites from the local net =20
> (192.168.7.x) on tcp port 22, that the final destination of the packet =
=20
> would wtill be the same host, but on port 8022...
>
> Like this :
>
> Normal :
>
> 192.168.7.1 ssh to f.g.h.i on port 22
>
> the connection is :
>
> 192.168.7.1:sport -> f.g.h.i:8022
>
> Is it possible ?
>
> I've tried with REDIRECT, but it afects the destination of the packet, =
=20
> but I don't want that...
>
> Thanks,
>
> Nicolas

Redirect works on local hooks. Just DNAT it, dude.
iptables -t nat -A PREROUTING -p tcp -s 192.168.x.x --dport 22 -j DNAT =20
--to-destination f.g.h.i:8022

It's crucial to define dport, not sport, cause your sport is not 22, it's=
 =20
a client port > 1024 and random.


--=20
www.supportivo.org

I can't stop myself checking for pigs in the outlets. Everybody thinks i'=
m =20
a punk, cause of the hairstyle(220V).
end

