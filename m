From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables-1.2.9, kernel-2.6.0, pppd-2.4.2
Date: Wed, 31 Dec 2003 12:03:31 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312311203.32092.Antony@Soft-Solutions.co.uk>
References: <BAY2-F33Hh2wLCVYl4m0003f0bf@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY2-F33Hh2wLCVYl4m0003f0bf@hotmail.com>
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

On Wednesday 31 December 2003 7:37 am, zhang ping wrote:

> ----adsl----linuxbox----lan
>
> pppd-2.4.2 (use kernel mode pppoe)
> iptables-1.2.9
> kernel-2.6.0
>
> when I visit www.zaobao.com at lan, it is ok, but I cant visit
> www.kernel.org, so qi guai.
>
> when i set mtu as 1300 at lan, everthins is ok, i can visit all sites.
>
> what is the matter, anybody help me?

This problem has been known for a long time.   You need to clamp the MTU on 
your interface to the Maximum Segment Size supported by your ADSL link.

http://lists.netfilter.org/pipermail/netfilter/2003-November/048409.html

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


