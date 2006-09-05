From: "Fischer, Anna" <anna.fischer@hp.com>
Subject: Netfilter and bridging
Date: Tue, 5 Sep 2006 06:56:41 +0100
Message-ID: <86FE9B2B91ADD04095335314BE6906E85F3DCE@sdcexc04.emea.cpqcorp.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Hi there,

I use bridge-utils to set up a bridge (basically I use Xen...) and now I
want to filter packets coming from (or going to) specific bridge ports.
I use the PHYSDEV extension for that and in general that works fine.
However, I thought all bridged packets traverse the iptables FORWARD
chain, but in my case they don't! As far as I know, every bridged packet
should go through this chain, so I'm wondering what might be the reason
that this is not the case on my machine. Can anyone help me on that?

Cheers,
Anna

