From: Jason Opperisano <opie@817west.com>
Subject: Re: disconnection from LAN
Date: Tue, 07 Sep 2004 14:00:45 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094580044.1890.44.camel@wolfpack.ljm.dom>
References: <20040907175403.GC21613@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040907175403.GC21613@tranquility.scriptkitchen.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 2004-09-07 at 13:54, Payal Rathod wrote:
> Hi,
> I am conecting to internet via. my Mandrake Linux 10 box. But
> whenever I connect to my client's VPN from my windows machine (using
> CISCO client) the windows machine is disconnected from the LAN
> immediately after the client gets connected. I have even tried this
> with no firwall except simple MASQUERADE rule for my 192.168.x.x series
> machine. But the same problem. As soon as I disconnect VPN I can
> get in LAN.
> Can someone suggest anything? I am very very bad in VPN and firewalls.
> 
> With warm regards,
> -Payal

your cisco VPN client is configured (at the VPN gateway end) not to
allow "split-tunneling" and is working as designed.

contact the administrator of the VPN gateway and ask to have
split-tunneling enabled so that you may access your LAN simultaneously.

-j

-- 
Jason Opperisano <opie@817west.com>


