From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: How to log what is drop
Date: Thu, 8 Jul 2004 08:44:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407080844.08036.gdh@acentral.co.uk>
References: <B732FD42D68974438C1451C73C1D030FD1F5BA@FR92EX02.eu.abxlogistics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <B732FD42D68974438C1451C73C1D030FD1F5BA@FR92EX02.eu.abxlogistics.com>
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
To: netfilter@lists.netfilter.org

On Thursday 08 July 2004 08:30, IZEM Farid wrote:
> Hi all,
>
> Just a Simple question.
>
> How do i log what is being rejected or drop by my Firewall.
>
> I configure my syslog.conf like this:
> 	kern.*                                                  /var/log/kernel
>
> And I had the following rule:
> 	Iptables -A FORWARD -j LOG
>
> It seems that all connections is logged so it is very difficult to read the
> log.

Firstly, do you actually have DROP statements in your ruleset? If so, the LOG 
statement should appear JUST BEFORE the block of DROP statements. Since 
ACCEPT or DROP are one-way-streets for packets, you want to LOG just before 
they get DROPped, but not log any of the ACCEPTed packets.

Cheers,
Gavin.

