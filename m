From: Christian Riechmann <riechmann@fgan.de>
Subject: Re: Need some clarification or help
Date: Wed, 21 Apr 2004 13:14:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040421111445.GA892@rie.rie.priv>
References: <20040420182205.GA2948@rie.rie.priv> <200404201947.39774.Antony@Soft-Solutions.co.uk> <20040420205144.GC2997@rie.rie.priv> <003c01c4271e$ffbe9a00$68892090@grouse>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <003c01c4271e$ffbe9a00$68892090@grouse>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jee J.Z." <jz105@york.ac.uk>
Cc: netfilter@lists.netfilter.org

Hello Jee,

On 2004-04-20 22:32:36 +0100, Jee J.Z. wrote:
> Hi Christian,
> 
> 
> > Maybe I am a little bit lazy when describing my method as "tunnelling".
> > Therefore I will go a little bit deeper.
> > I know that UDP and TCP protocols are completely different, especially
> > the 3-way handshake. But all its steps are TCP packets. Therefore my idea
> > is to encapsulate on each side each TCP packet into a UDP packet, send
> > this one to the other side, decapsulate the original TCP paket from the
> > UDP packet and inject the TCP packet to the kernel. This way the total TCP
> > dialog shall be exchanged as payload of separate UDP packets. UDP
> > is necessary, because only UDP can use broadcast addresses.
> > (I use this type of address to emulate LAN-broadcast within a mobile
> > adhoc network. Therefore I doubt that vtun would help me.)
> 
> This sounds to me like that you need two transport layers to do this at the
> receivers. Otherwise the encapsulated TCP packets will be forwarded as the
> payload of UDP packets to upper layers. The receivers even don't know they
> were actually TCP packets, and upper layers will get confused what these
> payloads mean. Am I missing something obvious?

What I have in mind is:
On the receiver the TCP packet, which is part of the payload of the
received ipq-captured UDP packet, shall be decapsulated and then injected
to the kernel (instead of the received UDP packet). Therefore only one
transport layer is envolved.

As I mentioned in my first mail, this method works very well with
encapsulated UDP and ICMP packets, but not with TCP, although a tcpdump
running on the receiver displays the injected IP/TCP packet, but with some
additional bytes at the end. In other words tcpdump seems to display an
IP/TCP packet, which according to the length field of IP shall have only 
64 bytes but really consists of 80 bytes (numbers are only examples).

My assumption is, that these surplus bytes beyond the end, lead to the
problem (maybe a checksum error because of those bytes not belonging to
the TCP packet.) I do not see why during injection the surplus bytes
have not been deleted, although the verdict call is parameterized with
the new length.

Regards
Christian


> 
> Cheers,
> Jee
> 
> > >
> > > > Here is what I wish to do:
> > > > For the transmission of IP packets (UDP, ICMP, TCP) between two hosts
> > > > I want to send these packets through a UDP tunnel.
> > >
> > > Tunnelling is a very different matter from converting UDP packets into
> TCP
> > > packets, and should be eminently feasible.
> >
> > As I tried to explain, I do NOT want to convert UDP to TCP, I only want to
> > transport TCP packets as UDP payload.
> >
> > I would be glad if you can comment the method described above.
> >
> > Regards
> > Christian
> >
> > -- 
> > Christian Riechmann    E-Mail: riechmann@fgan.de
> > c/o FGAN/FKIE          Tel: (+49) 228/9435 345,378
> > Neuenahrer Strasse 20  Fax: (+49) 228/9435 685
> > D-53343 Wachtberg, Germany
> >
> >
> 
> 

-- 
Christian Riechmann    E-Mail: riechmann@fgan.de
c/o FGAN/FKIE          Tel: (+49) 228/9435 345,378
Neuenahrer Strasse 20  Fax: (+49) 228/9435 685
D-53343 Wachtberg, Germany

