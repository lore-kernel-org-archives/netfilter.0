From: Jon Colverson <netfilter@vcxz.co.uk>
Subject: Re: conf scenario.
Date: Mon, 03 May 2004 23:01:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4096C11D.5000709@vcxz.co.uk>
References: <4096AE99.5070705@o2.pl> <200405032156.34614.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405032156.34614.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Antony Stone wrote:
> On Monday 03 May 2004 9:42 pm, Krystian wrote:
>>i need some help on how to configure this scenario in iptables:
>>
>>[adsl modem/router]-----[eth1-linux box-eth0]-----[network]
>>
>>question: how to configure "linux box's" iptables to forward and
>>masquarade traffic from most users and bridge traffic for couple
>>"public" users.

I don't believe that any iptables configuration is necessary for the 
machines with public IPs. The Linux box will need a public IP on the 
same subnet as them and will need to have IP forwarding turned on (echo 
1 > /proc/sys/net/ipv4/ip_forward). The boxes with public IPs will need 
to have the Linux box as their default gateway and it should all just work.

If you can't spare a public IP for the Linux box, can you just connect 
the ADSL modem/router, the Linux box, and the clients all to the same 
Ethernet? This is the setup I use. In that case the clients with public 
IPs would be able to see the ADSL modem/router directly (and would 
simply use that as their default gateway).

> Add a third interface card eth2, bridge eth1 and eth2 as br0, and then route 
> between br0 and eth0.
> 
> If you have hosts on your network which need public IPs then they have to be 
> on a separate subnet from your normal clients anyway.

I don't think this is necessary. The public IP clients are obviously on 
a different IP subnet, but they can happily share the Ethernet with the 
NATed clients.

-- 
Jon


