From: Angel j Alvarez <a.alvarez@uah.es>
Subject: Re: how to stop broadcasts using iptables
Date: Tue, 27 Apr 2004 17:40:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404271740.01050.a.alvarez@uah.es>
References: <20040427123529.HVYI23570.viefep19-int.chello.at@localhost> <408E7229.40001@pbl.ca>
Reply-To: a.alvarez@uah.es
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <408E7229.40001@pbl.ca>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

try pkttype match

El Martes, 27 de Abril de 2004 16:46, Aleksandar Milivojevic escribi=F3:
> sschlesi@chello.at wrote:
> > hi,
> >
> > I'm trying to stop broadcasts getting forwarded, but I'm  not sure how =
to
> > do this. i read that *.255 - which are afaik broadcast addresses - does=
nt
> > guarantie that its a broadcast. then i read that its possible by matchi=
ng
> > the mac address, because broadcast will have ff:ff:ff:ff:ff:ff . but I'm
> > not sure if that's all  nonsense.
>
> IP broadcast address does not need to end with 255.  It is convention on
> C class subnets to give it address of 255 (all ones), however
> theoretically it can be any address, as long as you define it as
> broadcast address on all of your machines.  If you subnet C class to
> even smaller subnets and use "all ones" convetion for broadcast address,
> broadcast address will not end in 255 (for example, using "all ones"
> convetion, broadcast address of 192.168.1.0/25 would be 192.168.1.127).
>   Same goes for A or B class subnets (If your network is defined as
> 192.168.0.0/16, broadcast address (using convention) would be
> 192.168.255.255, so in this case 192.168.12.255 is not broadcast
> address, it's just a host in 192.168.0.0/16).
>
> However, do note that 255.255.255.255 is always valid broadcast address!
>
> The answer to your second question is, yes, on Ethernet
> ff:ff:ff:ff:ff:ff is always an (Ethernet) broadcast.  Ethernet
> broadcasts are not the same as IP broadcast.  However, IP broadcasts
> packets will be encapsulated into Ethernet broadcast packets (unless you
> have something really wrong in your configuraion).  Do note that I saw
> at least one broken higher level protocol implementation (no, it wasn't
> IP) that spit out everything using Ethernet broadcasts.
>
> As David already told you, broadcasts should not be routed (if you want
> them to be routed, you usually need to read tips-and-tricks section in
> your router configuration, and do something to make it work).  So the
> router is the place to have them blocked.

