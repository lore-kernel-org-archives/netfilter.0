From: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Subject: Re: download problem
Date: 22 May 2003 09:21:29 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053620489.28514.1.camel@knoppix>
References: <Law12-F106n04x29xDb000017bf@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law12-F106n04x29xDb000017bf@hotmail.com>
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
To: Sharad Mittal <sharad_mittal12@hotmail.com>
Cc: netfilter@lists.netfilter.org


On Mon, 2003-05-19 at 03:53, Sharad Mittal wrote:
> Hi all,
>         We are using iptables at our company's firewall to NAT internet 
> traffic. But lot of our downloads get stuck and just don't move forward. I 
> have seen lot of conntrack patches for the recent kernels. But even the 
> 2.4.21-rc2 patch gives the same problems.
> 
> Is there a problem in current version of netfilter code in kernel or there 
> might be some other problem?
> 
> Thanks in anticipation of a enlightening reply,
> Sharad
> 
> PS: please copy the reply to sharad_mittal12@hotmail.com .
> 
> _________________________________________________________________
> MSN 8 with e-mail virus protection service: 2 months FREE*  
> http://join.msn.com/?page=features/virus

Have you loaded the FTP helper module ? Depending on your config, things
like PASV, remote-firewall, etc might cause only some downloads to fail.

-- 
Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Zultys Technologies


