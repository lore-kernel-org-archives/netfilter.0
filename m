From: Rick Jones <rick.jones2@hp.com>
Subject: Re: Forward packets from one interface to another?
Date: Tue, 03 Feb 2009 13:37:49 -0800
Message-ID: <4988B92D.8040201@hp.com>
References: <200902031753.59283.Karlis.Repsons@gmail.com>	<200902031940.09273.Karlis.Repsons@gmail.com>	<49889fd0.1c078e0a.6cc4.ffff9618@mx.google.com>	<200902032004.44533.Karlis.Repsons@gmail.com> <Pine.LNX.4.58.0902031205200.13208@bolt.sonic.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0902031205200.13208@bolt.sonic.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: bsilva <bsilva@sonic.net>
Cc: =?UTF-8?B?S8SBcmxpcyBSZXBzb25z?= <karlis.repsons@gmail.com>, 'netfilter' <netfilter@vger.kernel.org>

bsilva wrote:
> You can use either routing/forwarding or bridging for this problem,
> however, bridging is simpler in many ways.  If you use bridging, there is
> are fewer impacts on the design of the rest of your network.  If you use
> routing, then the router that connects the PC with two interfaces to the
> Internet needs to know about the network on the other side of the PC
> (in a small network this can be done by adding a static route).
> 
> So, in this example:
> 
> -----------                -----------                  -----------
> | Router/ |                |   PC    |                  |   PC    |
> | Firewall|.1    Net A  .10| with 2  |.10    Net B   .11| with 1  |
> |   to    |----------------|  NICs   |------------------|  NIC    |
> | Internet|  192.168.1.0   -----------   192.168.2.0    -----------
> -----------
> Each network is /24 (netmask of 255.255.255.0)
> 

If instead, you further subnettted 192.168.1 with a /25 on the PCs (but still a 
/24 on the router), the Router/Firewall wouldn't have to know about the other 
subnet.  It could just blythly ass-u-me that the end-PC was on the same network 
segment as the middle PC.  So long as the middle PC was configured with a static, 
public ARP entry for the IP of the end PC, and had ip_forwarding enabled, it 
would "front" for the end PC.

rickjones
