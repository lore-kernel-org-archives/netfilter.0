From: "Small, Jim" <jim.small@eds.com>
Subject: Maxium concurrent connections with IPTables
Date: Mon, 2 Aug 2004 14:15:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <564DE4477544D411AD2C00508BDF0B6A22073275@usahm018.exmi01.exch.eds.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm curious, what is the maximum number of concurrent connections possible
with IPTables using connection tracking for udp and for tcp?  (using latest
2.4 kernel and 2.6 kernel)

I'd also be curious if this changes with the TCP window patch.

I'm currently taking a Cisco firewall class and they're claiming that PIX
which supports 500,000 concurrent connections with the appliance version and
1,000,000 with the blade version vastly exceeds the capabilities of all
general purpose O/S'.

<> Jim

