From: Philip Craig <philipc@snapgear.com>
Subject: Re: Problems with NAT - it worked !
Date: Fri, 06 Jun 2003 19:00:05 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EE05815.1060701@snapgear.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D73@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D73@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

George Vieira wrote:
> What I read was that MASQUERADE should be used for changing IP machines like dialup or DHCP lan workstations etc.. SNAT/DNAT was more for servers with static IPs.
> 
> It didn't say why and what things could happen, just that it was good networking to do it that way...

The reason why is that when an interface goes down or changes address,
the connection tracking entries for MASQUERADE targets are flushed,
whereas the connection tracking entries for SNAT targets remain.

So if you have a dynamic IP address, use MASQUERADE, so that the NAT
mappings will be invalidated when the address changes.

But if you have a static IP address, then use SNAT, so that the NAT
mappings remain and the connections are not broken, even if the
interface temporarily goes down.

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


