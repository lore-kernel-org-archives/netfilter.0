From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: make error with iptables 1.2.11
Date: Tue, 29 Jun 2004 22:00:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406292200.23738.Antony@Soft-Solutions.co.uk>
References: <200406291645.13172.pgunarat@csee.usf.edu>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406291645.13172.pgunarat@csee.usf.edu>
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

On Tuesday 29 June 2004 9:45 pm, Chamara Gunaratne wrote:

> Hello All,
> I am trying to make and install ip_tables and I am getting an error when
> running make. I am running SuSE 8.2 with kenel release 2.4.26 and I have
> patched the kernel using patch-o-matic. The command I gave and the output I
> got is:
>
> iptables-1.2.11> make KERNEL_DIR=/usr/src/linux-2.4.26/
> Making dependencies: please wait...
> Something wrong... deleting dependencies.
> make: *** [../ipset/libipt_set.h] Error 1
>
> I would greatly appreciate it if somebody can show me what I am doing wrong
> here. Thanks !

What happens if you try a simple build of 1.2.11 without applying p-o-m first?

It would be good to know whether the error is in stock netfilter, or being 
caused by the patches you've applied.

Regards,

Antony.

-- 
Bill Gates has personally assured the Spanish Academy that he will never allow 
the upside-down question mark to disappear from Microsoft word-processing 
programs, which must be reassuring for millions of Spanish-speaking people, 
though just a piddling afterthought as far as he's concerned.

 - Lynne Truss, "Eats, Shoots and Leaves"

                                                     Please reply to the list;
                                                           please don't CC me.


