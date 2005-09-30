From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Iptables and vlan interfaces
Date: Fri, 30 Sep 2005 17:21:07 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0509301706580.24680@filer.marasystems.com>
References: <20050930112129.19898.qmail@focomunicatii.ro>
	<Pine.LNX.4.61.0509301440560.19019@filer.marasystems.com>
	<20050930125427.28160.qmail@focomunicatii.ro>
	<200509300839.15330.rob0@gmx.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509300839.15330.rob0@gmx.co.uk>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

On Fri, 30 Sep 2005, /dev/rob0 wrote:

> Hmmm, I had always thought you couldn't use virtual interfaces.
> # iptables -vI INPUT -i eth0:101

The above is not a virtual interface like VLAN interfaces are, only a 
labelled IP address on eth0.

   /sbin/ip addr show

will give you a quite good picture of these things.

to make your life saner I recommend unlearning ifconfig and instead learn 
to use the ip command from iproute. ifconfig only confuses things..

This difference is also seen in netstat -i.

Regards
Henrik

