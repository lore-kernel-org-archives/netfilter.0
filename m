From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: ftp connection tracking
Date: Sun, 31 Aug 2003 21:04:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308312104.34383.Alistair@nerdnet.ca>
References: <00eb01c36cc1$b29fa240$020b0b0b@home>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00eb01c36cc1$b29fa240$020b0b0b@home>
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
To: David Luyens <david.luyens@skynet.be>, netfilter@lists.netfilter.org

On August 27, 2003 01:36 pm, David Luyens wrote:
> Hi,
>
> When a change the portnumber of my ftp deamon, the connection tracking
> of netfilter does not work anymore.
> Is it possible to say to netfilter to look at a different port (than 21)
> for ftp connections?
>
> David Luyens



	Not sure what the kernel command line would be but if you use modules 
	to load
	ip_conntrack_ftp
	ip_nat_ftp
	
	modinfo ip_conntrack_ftp

	you pass the new port as an option to the module when it loads.
	
	insmod ip_nat_ftp ports=xx,xx

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

