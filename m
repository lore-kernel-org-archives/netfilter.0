From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: blocking all traffic in port 137/137
Date: Wed, 16 Jun 2004 09:52:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406160952.36284.Antony@Soft-Solutions.co.uk>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108> <200406152004.45544.Antony@Soft-Solutions.co.uk> <011701c4537e$891361b0$858310ac@suarapembaruan.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <011701c4537e$891361b0$858310ac@suarapembaruan.com>
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

On Wednesday 16 June 2004 9:47 am, david wrote:

> Dear all,
> When i look at "IPTRAF", i see lot of broadcast traffic that using port 137
> and 138,

You must have Windows machines on your network, then - that's how Microsoft 
networking works - using broadcasts on the local subnet.

> how to make rules that can block all traffic in port 137 and 138,

Why bother?   It's broadcast traffic - it's not going anywhere (through a 
router), and if your firewall doesn't listen on those ports, nothing's going 
to happen anyway.

Regards,

Antony.

-- 
"The future is already here.   It's just not evenly distributed yet."

 - William Gibson

                                                     Please reply to the list;
                                                           please don't CC me.


