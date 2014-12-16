From: Tim Nelson <tnelson@rockbochs.com>
Subject: Re: Bridging / VLANs / ebtables
Date: Tue, 16 Dec 2014 15:46:59 -0600 (CST)
Message-ID: <31506370.345790.1418766419268.JavaMail.root@rockbochs.com>
References: <20141216213425.GU967@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20141216213425.GU967@titan.lakedaemon.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

----- Original Message -----
> iiuc, you have the following types of packets on eth0:
> 
> 	x.x.x.x/24
> 	y.y.y.y/24
> 	z.z.z.z/24
> 	vlan2:a.a.a.a/24
> 	vlan3:b.b.b.b/24
> 
> So, you need x.x.x.x/24, y.y.y.y/24, and z.z.z.z/24 to get routed
> into
> vlan3.  Does traffic need to go the other way?  Is there broadcast or
> multicast traffic to worry about?
> 

Greetings Jason-

Specifically, I have:

eth0: x.x.x.x/24
eth0.2: y.y.y.y/29
eth0.3: z.z.z.z/24

After bridging eth0 and eth0.3, devices on eth0.3 will utilize the same address space as that present on eth0 native (x.x.x.x/24). Of course, traffic to/from eth0.2 would continue to be functional. Traffic *does* need to operate in both directions, and yes there will be broadcast traffic originating from eth0.3, as a DHCP request, which would be answered by a DHCP server on the eth0 native connected network.

Thanks!

--Tim
