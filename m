From: horape@tinuviel.compendium.com.ar
Subject: Re: DNATing packets sent to the NATing box
Date: Sun, 14 Dec 2003 15:02:26 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031214180226.GC19059@tinuviel.compendium.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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

> > > > It looks like the proxy is grabbing the packets first and then drop=
ping
> > > > them directly onto the INPUT chain. Try disabling the proxy and rel=
ease
> > > > the bound ports then try it again. Once the packets reach PREROUTING
> > > > you can DNAT them to another port.
> > > I could ubnderstand the proxy code managing to grab the packet off the
> > > wire before netfilter (PREROUTING) sees it, but I don't see how it wo=
uld
> > > then get seen by the INPUT chain - as far as I know, it's not possible
> > > for a packet to reach netfilter's INPUT chain without first going thr=
ough
> > > the PREROUTING chain.   If a packet bypasses one of these, it will by=
pass
> > > both.
> > Well that's what I thought but I can't explain his results any other wa=
y.
> > What are we missing here?

> 	My question exactly ...=20
> 	a silly question is :
> 	what if anything is in /proc/net/ip_conntrack for these connections?

udp      17 179 src=3D200.68.94.100 dst=3D200.61.169.146 sport=3D5000 dport=
=3D18416 src=3D200.61.169.146 dst=3D
200.68.94.100 sport=3D18416 dport=3D5000 [ASSURED] use=3D2

(200.68.94.100 is my ip)

> 	Alistair Tonner

Saludos y gracias,
					HoraPe
---
Horacio J. Pe=F1a
horape@compendium.com.ar
horape@uninet.edu

