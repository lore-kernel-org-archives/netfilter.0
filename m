From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables for backup connection
Date: Mon, 14 Jun 2004 09:05:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406140905.53992.Antony@Soft-Solutions.co.uk>
References: <1171.172.16.128.100.1087207004.squirrel@mail.suarapembaruan.co.id>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1171.172.16.128.100.1087207004.squirrel@mail.suarapembaruan.co.id>
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
To: netfilter@lists.netfilter.org

On Monday 14 June 2004 10:56 am, david@suarapembaruan.co.id wrote:

> Dear all,
> In my office i using 2 connection (Wireless connection direct to ISP "A"
> and backup connection to ISP "B" with ADSL Modem), how to configure Linux
> iptables (gateway) so when connection to ISP "A" down client can still
> work with ISP "B" without reconfiguration at client computer.

This is not a firewalling question; this is a routing question.

The tool you need to set this up is iproute2.   See http://lartc.org for 
details.

Regards,

Antony.

-- 
Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

                                                     Please reply to the list;
                                                           please don't CC me.


