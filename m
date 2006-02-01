From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: How make iptables script with NAT handle "active FTP"?
Date: Wed, 1 Feb 2006 07:50:56 +0100
Message-ID: <002301c626fb$da310410$0101000a@sterenborg.info>
References: <1138390474.4844.79.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1138390474.4844.79.camel@localhost.localdomain>
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
To: Netfilter <netfilter@lists.netfilter.org>

> Active FTP seems to need to open new sockets.
> 
> This creates problems for NAT'ing firewalls.
> 
> What is easiest way to open the right ports
> 
> and do NAT'ing back to clients on 192.168.x.y IP addresses?

modprobe ip_conntrack_ftp
modprobe ip_nat_ftp

Use stateful forwarding.
http://iptables-tutorial.frozentux.net/iptables-tutorial.html


Gr,
Rob


