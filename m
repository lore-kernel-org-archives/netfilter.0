From: Oleg Savostyanov <savostyanov@internetplustravel.ru>
Subject: Re: pptp-conntrack-nat
Date: Mon, 1 Dec 2003 14:43:22 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <396087453.20031201144322@internetplustravel.ru>
References: <13121614429.20031127183415@internetplustravel.ru>
Reply-To: Oleg Savostyanov <savostyanov@internetplustravel.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <13121614429.20031127183415@internetplustravel.ru>
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

I didn't receive any answer to my question
Is there any other group - may be which deal with extention
developing to IP Tables?
I even tryed to direct my question to developer of that
package Harald Welte, but didn't got any answer.



Thursday, November 27, 2003, 6:34:15 PM, you wrote:

OS> I tryed to install extra package - pptp-conntrack-nat
OS> but failed to do this.

OS> The script tells me "Could not find place to slot in
OS> ip_conntrack.h line", while testing and if I force it to install,
OS> it installs.
OS> And after that I do not see additional configure options while
OS> configuring my kernel.
OS> Do you have any ideas what to do?


OS> Welcome to Rusty's Patch-o-matic!
OS> Kernel:    /usr/src/kernel-source-2.4.18
OS> Userspace: /usr/src
OS> Each patch is a new feature: many have minimal impact, some do not.
OS> Almost every one has bugs, so I don't recommend applying them all!
OS> -------------------------------------------------------
OS> Testing... pptp-conntrack-nat.patch NOT APPLIED (8 missing files)
OS> The extra/pptp-conntrack-nat patch:
OS>    Author: Harald Welte <laforge@gnumonks.org>
OS>    Status: Beta
OS>    This adds CONFIG_IP_NF_PPTP:
OS>    Connection tracking and NAT support for PPTP.
OS>    Note that this code currently has limitations
OS>    - can only NAT connections from PNS to PAC
OS>    - doesnt' support multiple calls within one session
OS> -----------------------------------------------------------------
OS> Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?]
OS> Testing patch extra/pptp-conntrack-nat.patch...
OS>    Placed new Config.in line
OS>    Placed new Configure.help entry
OS>    Placed new Makefile line
OS>    Placed new Makefile line
OS>    Placed new ip_conntrack.h line
OS>    Placed new ip_conntrack.h line
OS> Could not find place to slot in ip_conntrack.h line
OS> Could not find place to slot in ip_conntrack.h line
OS> Could not find place to slot in ip_conntrack.h line
OS> Could not find place to slot in ip_conntrack.h line
OS> Could not find place to slot in ip_conntrack.h line
OS> Could not find place to slot in ip_conntrack.h line
OS> TEST FAILED: patch NOT applied.
OS> [Press enter to continue]
OS> Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] f
OS> Applying patch extra/pptp-conntrack-nat.patch...
OS> Failed to patch copy of /usr/src/kernel-source-2.4.18

  



-- 
Best regards,
 Oleg                            mailto:savostyanov@internetplustravel.ru


