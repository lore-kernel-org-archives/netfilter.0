From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: TARPIT Documentation?
Date: Wed, 5 Nov 2003 18:55:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311051855.32244.Alistair@nerdnet.ca>
References: <E26ABBCB14D369428125D23DF8BE94E503310E85@DGEXCH06.mcilink.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E26ABBCB14D369428125D23DF8BE94E503310E85@DGEXCH06.mcilink.com>
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
To: "Regalado, Ron" <Ron.Regalado@mci.com>, netfilter@lists.netfilter.org

On November 5, 2003 03:39 pm, Regalado, Ron wrote:
> Are there step by step instructions anywhere on setting up the TARPIT
> module for iptables?  I have tried recompiling the kernel and the iptables
> source.. No luck..
>
>
> Thanks,
>
> Ron
	
	You need to add it to the kernel source from Patch-O-Matic -- which no longer 
comes bundled with iptables. --- 
	http://www.netfilter.org/downloads.html#pom-20030912

	once added from there ... rebuild kernel and iptables and away you go 
	(okay ... you might not have to rebuild iptables --- but is good policy)
-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

