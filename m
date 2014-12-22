From: Tim Nelson <tnelson@rockbochs.com>
Subject: Re: Bridging / VLANs / ebtables
Date: Sun, 21 Dec 2014 21:37:46 -0600 (CST)
Message-ID: <9818903.380408.1419219466312.JavaMail.root@rockbochs.com>
References: <30877804.350548.1418834429764.JavaMail.root@rockbochs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <30877804.350548.1418834429764.JavaMail.root@rockbochs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

----- Original Message -----
> ----- Original Message -----
> > On Tue, Dec 16, 2014 at 03:46:59PM -0600, Tim Nelson wrote:
> > > ----- Original Message -----
> > > > iiuc, you have the following types of packets on eth0:
> > > > 
> > > > 	x.x.x.x/24
> > > > 	y.y.y.y/24
> > > > 	z.z.z.z/24
> > > > 	vlan2:a.a.a.a/24
> > > > 	vlan3:b.b.b.b/24
> > > > 
> > > > So, you need x.x.x.x/24, y.y.y.y/24, and z.z.z.z/24 to get
> > > > routed
> > > > into vlan3.  Does traffic need to go the other way?  Is there
> > > > broadcast or multicast traffic to worry about?
> > > > 
> > > 
> > > Greetings Jason-
> > > 
> > > Specifically, I have:
> > > 
> > > eth0: x.x.x.x/24
> > > eth0.2: y.y.y.y/29
> > > eth0.3: z.z.z.z/24
> > > 
> > > After bridging eth0 and eth0.3, devices on eth0.3 will utilize
> > > the
> > > same address space as that present on eth0 native (x.x.x.x/24).
> > > Of
> > > course, traffic to/from eth0.2 would continue to be functional.
> > > Traffic *does* need to operate in both directions, and yes there
> > > will
> > > be broadcast traffic originating from eth0.3, as a DHCP request,
> > > which
> > > would be answered by a DHCP server on the eth0 native connected
> > > network.
> > 
> > I'm sure I'm missing something, but a quick test in a VM worked:
> > 
> > [root@triton] # brctl show
> > bridge name     bridge id               STP enabled     interfaces
> > br0             8000.00163e1c9a87       no              eth126
> >                                                         eth126.3
> > 
> > eth126.3 did not have an ip address.  eth126 did, but you have to
> > set
> > both interfaces promiscuous and 0.0.0.0.  Then, assign an IP in the
> > range z.z.z.z/24 to br0.
> > 
> 
> I've done the same:
> 
> root@h4222:~# brctl show
> bridge name     bridge id               STP enabled     interfaces
> br0             8000.b827ebbd9e51       no              eth0
>                                                         eth0.3
> 
> I've set both eth0 and eth0.3 to promiscuous mode (ifconfig ethX[.y]
> promisc), and neither eth0 or eth0.3 have an IP, but br0 does. I'm
> not able to communicate with the IP assigned to the bridge from
> either interface.
> 
> Thank you very much for the helpful suggestions, it is greatly
> appreciated.
> 

*BUMP*

Any thoughts on this? I know it's "odd", but all suggestions welcome and appreciated. Thanks!

--Tim
