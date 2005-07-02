From: "David Leangen" <dleangen@canada.com>
Subject: RE: /etc/sysconfig/iptables does not load on reboot
Date: Sat, 2 Jul 2005 17:49:24 +0900
Message-ID: <NEBBKBPLMLNABNADCIPAGEDABDAB.dleangen@canada.com>
References: <200507020339.58492.rob0@gmx.co.uk>
Reply-To: dleangen@canada.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200507020339.58492.rob0@gmx.co.uk>
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
Cc: /dev/rob0 <rob0@gmx.co.uk>


Ah, good point!

Thanks!!



> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of /dev/rob0
> Sent: 2 July 2005 17:40
> To: netfilter@lists.netfilter.org
> Subject: Re: /etc/sysconfig/iptables does not load on reboot
> 
> 
> On Saturday 02 July 2005 01:43, David Leangen wrote:
> > some direction. Unless, of course, I'm looking in the wrong place...
> 
> FWIW you are *asking* in the wrong place. This is an OS problem, not a 
> netfilter / iptables issue.
> 
> RH/FC and such like to hide information from the user. You can add some 
> shell code to your startup scripts which redirect more verbose output 
> to files. In this case maybe some echo commands to show which file is 
> being fed to iptables-restore.
> -- 
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header
> 

