From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Can netfilter bypass routing table?
Date: Tue, 30 May 2006 17:13:09 +0200
Message-ID: <006a01c683fb$90036790$0101000a@sterenborg.info>
References: <200605281605.k4SG5ke08025@zool.gorillacon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200605281605.k4SG5ke08025@zool.gorillacon.com>
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

> I have a linux machine with two interfaces eth0 and eth1.
> I am interested in sending a packet to address 1.2.3.4.
> I want the packet to go out eth0 if it is being sent by ProcessA.
> I want the packet to go out eth1 if is being sent by ProcessB.
> 
> Is this possible to do with iptables?

Have you looked at the ROUTE target ?
http://www.netfilter.org/projects/patch-o-matic/pom-extra.html#pom-extra
-ROUTE

You can also mark the packets and use iproute to route them to a
different gateway. I *think* the ROUTE target is be the simplest method,
however, I have done neither in practice..


Gr,
Rob


