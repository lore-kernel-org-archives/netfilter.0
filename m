From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables / FTP masquerading: Port command illega
Date: Wed, 23 Mar 2005 12:35:54 -0500
Message-ID: <20050323173554.GA22883@bender.817west.com>
References: <1111590778.4241877a4e631@webmail.telus.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1111590778.4241877a4e631@webmail.telus.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Mar 23, 2005 at 07:12:58AM -0800, amateurguy@telus.net wrote:
> modules in memory are:
> 
> ip_conntrack_ftp 5296 1 (autoclean)
> ip_nat_ftp 4112 0 (unused)
> iptable_mangle 2776 0 (autoclean) (unused)
> ipt_MASQUERADE 2200 1 (autoclean)
> iptable_nat 21720 2 (autoclean) [ip_nat_ftp ipt_MASQUERADE]
> ipt_state 1048 10 (autoclean)
> ip_conntrack 26976 3 (autoclean) [ip_conntrack_ftp ip_nat_ftp ipt_MASQUERADE 
> iptable_nat ipt_state]
> iptable_filter 2412 1 (autoclean)
> ip_tables 15096 7 [iptable_mangle ipt_MASQUERADE iptable_nat ipt_state 
> iptable_filter]
> 
> Anybody know whats going on?

did you modprobe with:

	modprobe ip_conntrack_ftp ports=21,29
	modprobe ip_nat_ftp ports=21,29

-j

--
"Ah! the searing kiss of hot lead; how I missed you! I mean, I think
 I'm dying."
         --The Simpsons

