From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Question regarding unclean match support!
Date: Wed, 11 Jun 2003 09:54:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306110954.16270.Alistair@nerdnet.ca>
References: <00a601c32e4a$577181a0$6828010a@telxsi.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00a601c32e4a$577181a0$6828010a@telxsi.com>
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
To: Rahul  Gulati <rgulati@tataelxsi.co.in>, netfilter@lists.netfilter.org

On June 9, 2003 01:45 am, Rahul Gulati wrote:
> Hi, All,
>
> I had a question regarding support for "unclean" match in Linux 2.4.18
> kernel.
> I am not able to see "unclean" match as an option under IP: Netfilter
> Configuration.
>
> I would like to know if I need to down load some patch for unclean match
> support,
> if yes would appreciate if anyone could direct me to the location where the
> patch might be available.
>
> TIA...
> Rahul



	Get the most recent Patch O  Matic  -- Unclean is NOT in kernel yet.
	you need to have kernel source, iptables and POM and in the POM 
	dir:
	KERNEL_DIR=/where/you/have/kernelsource ./runme
	(hit me if I'm wrong folks ... I've been on iptables 1.2.7a and POM from 
February of this year for ages)
	and apply the unclean match from there.
-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

