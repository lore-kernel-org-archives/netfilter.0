From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Redirect to same LAN and preserve source IP
Date: Tue, 13 Jul 2004 09:50:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407130950.44683.gdh@acentral.co.uk>
References: <200407121419.40110.gdh@acentral.co.uk> <200407121612.27437.gdh@acentral.co.uk> <200407121631.56183.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407121631.56183.Antony@Soft-Solutions.co.uk>
Content-Disposition: inline
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

On Monday 12 July 2004 16:31, Antony Stone wrote:

> How about *configuring* the clients so they use the proxy "properly"
> instead of doing transparent redirection?   Then you can keep the Squid box
> on the same subnet as the clients, and still block people trying to do TCP
> port 80 straight through the firewall (only one source IP is allowed - the
> Squid box).   

The reason has been the desire to not have to ferry around dozens of machines 
configuring proxy settings, really. I'll certainly give the seperate-subnet 
idea some thought :)

Cheers,
Gavin.

