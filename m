From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Allow active and passive FTP connections
Date: Thu, 17 Jun 2004 14:24:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406171424.54797.Antony@Soft-Solutions.co.uk>
References: <2E314DE03538984BA5634F12115B3A4E894FF3@email1.mitretek.org>
Reply-To: "netfilter" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2E314DE03538984BA5634F12115B3A4E894FF3@email1.mitretek.org>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thursday 17 June 2004 2:06 pm, Piszcz, Justin Michael wrote:

> root@p500:~# insmod ip_conntrack_ftp
> insmod: can't read 'ip_conntrack_ftp': No such file or directory
> root@p500:~#
>
> - Insmod is when you load the module directly, there it would not work
> unless you were in the _same_ directory as the ip_conntrack_ftp and you
> renamed the ip_conntrack_ftp.{ko,o} ip_conntrack_ftp, then it would
> work.

Fair comment about the absolute path, but I'm not sure why you think you need 
a rename.   From "insmod --help" on my system (insmod version 2.4.6):

root@onyx:~# insmod --help
Usage:
insmod [-fhkLmnpqrsSvVxXyY] [-e persist_name] [-o module_name] [-O blob_name] 
[-P prefix] module [ symbol=value ... ]

  module                Name of a loadable kernel module ('.o' can be omitted)

However, I'm sure the original poster has worked out how to solve the problem 
by now, so this is probably getting OT...

Regards,

Antony.

-- 
"When you talk about Linux versus Windows, you're talking about which 
operating system is the best value for money and fit for purpose. That's a 
very basic decision customers can make if they have the information available 
to them. Quite frankly if we lose to Linux because our customers say it's 
better value for money, tough luck for us."

 - Steve Vamos, MD of Microsoft Australia

                                                     Please reply to the list;
                                                           please don't CC me.


