From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: forward is not forwarding
Date: Fri, 06 Sep 2002 08:40:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D784DD0.8010301@fugmann.dhs.org>
References: <EF33C96B91C212479FA2B0B0A96868F80102C887@sydxch02.veritas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Abraham Kim <Abraham.Kim@veritas.com>
Cc: netfilter@lists.netfilter.org

Abraham Kim wrote:
> telnet from Linux to Solaris takes too long to be established
> (it looks hung after the Escape character... message)
This has been seen before, and is easy to fix if my assumption is correct.

Try adding this to your firewall:
$ iptables -A FORWARD -p tcp --dports auth -j REJECT \
         --reject-with tcp-reset

This will "reject" any packet destined for the auth port.
My guess is that the Solaris box does not have a auth deamon running, 
and therefore Linux clients will "hang" while waiting for an answer from 
the port.

Regards
Anders Fugmann

-- 
Author of FIAIF
Fiaif is an intelligent firewall
http://fiaif.fugmann.dhs.org


