From: Mario =?ISO-8859-1?Q?H=FClsegge?= <huelsegge@gmx.de>
Subject: Re: Port-based routing with OpenVPN
Date: Wed, 19 Sep 2007 23:38:18 +0200
Message-ID: <1190237898.6922.11.camel@laptop>
References: <20070915231545.224150@gmx.net> <46ED0DE4.1040300@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46ED0DE4.1040300@plouf.fr.eu.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <http://lists.netfilter.org/pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

and thank you for answering despite the fact i forgot to set a
subject :)

> Was this trace captured on interface tun0 ?
yes

> What is the address of vroot ? Is it the other end of the VPN ?
no, it is just my dns-server that has nothing to do with the vpn.

> Is the OpenVPN link configured in TUN (IP) or TAP (ethernet) mode ?
it is in tun mode, i have no idea why it acts like in tap mode.

Mario


