From: Robert LeBlanc <robert@leblancnet.us>
Subject: Re: Bridge Transparent Proxy
Date: Tue, 22 May 2007 08:35:50 -0600
Message-ID: <C2785BE6.1C244%robert@leblancnet.us>
References: <915989.4708.qm@web38509.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <915989.4708.qm@web38509.mail.mud.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

You will need to look at ebtables. Bridging will bypass iptables. Ebtables
is much like iptables, but there are some subtle differences that may choke
you up. Haven't worked much with it though.

Robert


On 5/22/07 8:28 AM, "Jon Tim" <lcguy229@yahoo.com> wrote:

> HI Expert,
>  
> Please allow me to ask bridge transparent proxy.
>  
> I have public iP address 203.X.X.X and I used Bridge
> between Wireless LAN access point and HUB. So, all IP
> are in 203.X.X.X with same subnet mask 255.255.255.0.
>  
> Interenet---------->
> eth0------>bridge<------eth1<--------WirlessAP
>  
> Bridge is working well with 2 NICs.
>  
> My question is I would like to forward only port 80
> and 443  from eth1 to eth0 and would like to log http
> traffic pass through bridge.
>  
> Please let me know which command to type in iptables.
>  
> Best regards,
> Jon
> 
> 
>        
> ______________________________________________________________________________
> ______Get the Yahoo! toolbar and be alerted to new email wherever you're
> surfing.
> http://new.toolbar.yahoo.com/toolbar/features/mail/index.php
> 

 
Robert LeBlanc
BioAg Computer Support
Brigham Young University
leblanc@byu.edu
(801)422-1882



