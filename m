From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT and DNS/NTP servers
Date: Sat, 1 May 2004 22:07:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405012207.14866.Antony@Soft-Solutions.co.uk>
References: <409310DE.2020004@isoar.ca> <200405012121.27461.Antony@Soft-Solutions.co.uk> <40940D29.3080302@isoar.ca>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40940D29.3080302@isoar.ca>
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

On Saturday 01 May 2004 9:48 pm, Andrew E. Mileski wrote:

> It seems netfilter doesn't check for the existence of a local listener
> on a port before deciding whether or not to remap it.  Only the
> connection table seems to be referenced.

This is correct, because remapping is only relevant to packets leaving the 
machine (this machine acting as client), and a local listener is only 
relevant to packets arriving at the machine (this machine acting as server).

I remain confused from your description as to whether you are talking about 
the machine running the netfilter rules being an NTP server (servicing 
requests from other clients), or an NTP client (sending requests to other 
servers).

It may be that the problem you are experiencing is simply due to the default 
timeout on UDP "connections" (which is an artificial concept anyway, built 
into netfilter simply to try and make UDP conform to the stateful packet 
monitoring mechanism), and you need to adjust the timings by fiddling about 
with /proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout ?

Regards,

Antony.
-- 
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the list;
                                                           please don't CC me.


