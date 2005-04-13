From: "Michael Muenz" <linux@leute.server.de>
Subject: Re: SNAT and IPSEC
Date: Wed, 13 Apr 2005 16:26:10 +0200
Message-ID: <d3j9vh$tnf$1@sea.gmane.org>
References: <1113329293.29536.13.camel@fly.in.iantel.com.uy><425C1D5F.7000302@lopsch.com>
	<1113393681.4244.3.camel@fly.in.iantel.com.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

> "Eduardo Spremolla" <edspremolla@antel.com.uy> schrieb im 
> Newsbeitragnews:1113393681.4244.3.camel@fly.in.iantel.com.uy...
> Yes, the OpenSwan is mutch more clear, yuo have the packet with the
> originals ip in the nat post chain to the tunn0 device. 

> Is there any chance to aplay NETMAP to the source 
> ip on PREROUTING ?

I never used NETMAP but this is from the description:
It can be applied to the PREROUTING chain to alter the destination of
incoming connections, to the POSTROUTING chain to alter the source 
of outgoing connections, or both (with separate rules).

You want to alter the source (10.2.2.0/24) and that's an outgoing conn.
(Of course vice versa) ..

So perhaps this will work:
iptables -t nat -A POSTROUTING -s 10.2.2.0/24 -d 10.37.130.0/24 \
   -j NETMAP --to 10.3.3.0/24
iptables -t nat -A PREROUTING -s 10.37.130.0/24 -d 10.3.3.0/24 \
   -j NETMAP --to 10.2.2.0/24

- Michael



