From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Management of bridged iptables
Date: Thu, 28 Apr 2005 18:17:07 -0500
Message-ID: <42716EF3.7050104@riverviewtech.net>
References: <0380eb44cd704cf780c1fd7f71cece5e@ebasedsecurity.com>
	<1403218a05042815502d3fe194@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1403218a05042815502d3fe194@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

> Why don't you give the br0 an IP !!?

If you are wanting an IP address that you can connect to to be able to manage a device that is functioning as a firewall router you quite often want to be able to access it from both sides of the router even when things are not functioning.  Thus it is quite common to have an external IP on the external interface and an internal IP on the internal interface.  This will allow you to connect to the firewall and manage it no matter what the state of the forwarding and / or bridging.



Grant. . . .

