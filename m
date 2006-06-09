From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Missing shared object
Date: Fri, 9 Jun 2006 18:25:45 +0200
Message-ID: <001d01c68be1$5cc143f0$0101000a@sterenborg.info>
References: <44898EB5.8010005@tlcdelivers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44898EB5.8010005@tlcdelivers.com>
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

> Good morning.
> 
> I have a Gentoo server (2.6.16-r7 kernel from Gentoo sources) running
> iptables 1.3.4. This is a fresh build and I am setting up rules for
> the first time. The rules were complied using FWBuilder and are
> the same set of rules on my current firewall, which is running the
> same configuration, hardware, etc. 
> 
> The first attempt to run the FWB generated script failed:
> 
> iptables-restore v1.3.4: Couldn't load match
> `ipv4options':/lib/iptables/libipt_ipv4options.so: cannot open shared
> object file: No such file or directory
> Error occurred at line: 152
> Try `iptables-restore -h' or 'iptables-restore --help' for more
> information.
> 
> The offending line is:
> 
> -A Cid4461182F.0 -p all  -m ipv4options  --rr  -j ACCEPT
> 
> I dug through the Netfilter docs and Googled the errors, but
> only turned up a single site that seems to be relevant (anyone know
> polish?).
> However, everything seems to indicate that this was an issue with
> version 1.2.8, which was corrected by a patch.

The error says:

===========
iptables-restore v1.3.4: Couldn't load match
`ipv4options':/lib/iptables/libipt_ipv4options.so: cannot open shared
object file: No such file or directory
===========

So, it looks like you don't have the file "libipt_ipv4options.so", or
perhaps it's in the wrong place. Try to find the file ("locate
libipt_ipv4options.so") to see if and where it finds it.
If you don't have it, you're going to have to patch the kernel for
ipv4options and build a new one to be able to use ipv4options.


Gr,
Rob


