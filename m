From: dwhite@speakeasy.net
Subject: Re: FTP Bounce Attack.
Date: Mon, 31 Jan 2005 16:28:43 -0800 (PST)
Message-ID: <Pine.LNX.4.61.0501311608270.13730@willie>
References: <41FA594A.1000103@multitech.co.in>
Mime-Version: 1.0
In-Reply-To: <41FA594A.1000103@multitech.co.in>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Vinod Chandran <vinod_chandran@multitech.co.in>
Cc: netfilter@lists.netfilter.org



Vinod,

I was able to confirm this (iptables 1.2.11, kernel 2.6.9).  The PORT 
command is indeed forwarded and unmangled, even if NAT is being used for 
the control session.

However, it appears that, while the PORT command is allowed and passed on 
to the server, the resulting "EXPECTING" connection (data channel) is not 
made available.  So in that way the bounce attack is stopped.  It appears, 
by glancing through the code, that this is the intended design.

But, this amounts to only disabling a bounce attack *through* the 
firewall.  It does *not* restrict me from connecting to another device 
*behind* the firewall (or more specifically, to any host on the same side 
of the firewall as the server).

I think this has some significant security implications.  I think you're 
right to raise the issue.

-dave

On Fri, 28 Jan 2005, Vinod Chandran wrote:

> Hi,
>
> I am currently using iptables 1.2.11 with the patch-o-matic patch applied.
> Its documented that netfilter is patched to  protect against FTP bounce 
> attacks, when an invalid IP is given in the FTP PORT command.
> I can detect the PORT command reaching the FTP server through the router( 
> containing netfilter), even when I give an ivalid IP.
> I would like to know whether the patch is not working or whether the patch is 
> meant to not allow the resulting bounce attack, even with allowing the PORT 
> command to pass through.
>
> Thanks and Regards,
> Vinod C
>
>

