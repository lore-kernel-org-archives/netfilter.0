From: "Nigel Clarke" <nigel@forever-networks.com>
Subject: RE: IPTABLES vs Checkpoint
Date: Tue, 26 Nov 2002 15:53:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <MKEJJFIGIGKMFKMKEEDBOEIACAAA.nigel@forever-networks.com>
References: <3F5BAB933C75004690195047C4040A6D0535D4@tc-pdc.jhbA.techconcepts.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F5BAB933C75004690195047C4040A6D0535D4@tc-pdc.jhbA.techconcepts.co.za>
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
To: Wayne de Nobrega <wdenobre@techconcepts.co.za>, netfilter@lists.netfilter.org

Wayne,

How are the firewalls installed? In a cluster configuration or stand alone?

In a stand alone you can go with either. If you're looking for scalability
and use of
things like VPNs, I'd go with Checkpoint. If you're looking for a stable
stateful firewall, you'd be
better off with iptables/netfilter.

The Nokia IPSO is not that bad. It is a stripped down version of BSD. So,
you're going to end up
with a stateful / Unix firewall no matter how you look at it.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Wayne de
Nobrega
Sent: Tuesday, November 26, 2002 2:28 PM
To: netfilter@lists.netfilter.org
Subject: IPTABLES vs Checkpoint


Hello,

I have a customer who is part of an international group which has a
policy of using the Nokia Checkpoint firewall.  Due to the signifcant
cost differences, and our preference, the local branch and ourselves
would like to install an IPTABLES based firewall.  I need some help in
motivating this to head office and am looking for information comparing
the two solutions.  I need to focus on the technical issues of the two
products and ultimately the inherent security realised from the two
products.

Can anyone offer some input or point me to a source of information.

Many thanks

Wayne


