From: "Regalado, Ron" <Ron.Regalado@mci.com>
Subject: RE: TARPIT Documentation?
Date: Thu, 06 Nov 2003 21:53:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E26ABBCB14D369428125D23DF8BE94E5033116F7@DGEXCH06.mcilink.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-return: allowed
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I installed the patch to the kernel.  I still can't get tarpit to work.  I
am using Redhat 9 with the rpm package from redhat.  How can I remove the
rpm and install directly from the netfilter source?

Thanks,

Ron 

-----Original Message-----
From: Alistair Tonner [mailto:Alistair@nerdnet.ca]
Sent: Wednesday, November 05, 2003 4:56 PM
To: Regalado, Ron; netfilter@lists.netfilter.org
Subject: Re: TARPIT Documentation?

On November 5, 2003 03:39 pm, Regalado, Ron wrote:
> Are there step by step instructions anywhere on setting up the TARPIT 
> module for iptables?  I have tried recompiling the kernel and the 
> iptables source.. No luck..
>
>
> Thanks,
>
> Ron
	
	You need to add it to the kernel source from Patch-O-Matic -- which
no longer comes bundled with iptables. --- 
	http://www.netfilter.org/downloads.html#pom-20030912

	once added from there ... rebuild kernel and iptables and away you
go 
	(okay ... you might not have to rebuild iptables --- but is good
policy)
-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

