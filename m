From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Routing rule for two gateways.
Date: Fri, 20 Sep 2002 14:17:35 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209201417.35968.dharmu@nsecure.net>
References: <00ce01c26051$994ca630$0200000a@ramasamy>
Reply-To: dharmu@nsecure.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00ce01c26051$994ca630$0200000a@ramasamy>
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
To: Sundaram <sun@percipia.com>, netfilter@lists.netfilter.org

Hi Sundaram,
 I think you can specify both the gws as the default gateways and can connect 
from internet using both the gateways.
Regards,
Dharmendra.T
Linux Security Expert
www.nsecure.net
dharmu@nsecure.net
On Friday 20 September 2002 07:49, Sundaram wrote:
> Routing rule for two gateways.
>
>
>
> I have two Linux netfilter gateways for my network  (1) 192.168.1.10, (1)
> 192.168.1.100 public IP in the external interface. Inside LAN I am running
> ftp server (192.168.1.50) with default gateway as 192.168.1.10. From
> Internet using Fist gateway public IP address I was able to access the ftp
> server, but using second gateway public IP address I was not able to access
> the ftp server.
>
>
>
> Where I need to set the routing, so that I can access the ftp server using
> both gateway.
>
>
>
> Thanks in advance
>
> -SR

-- 


