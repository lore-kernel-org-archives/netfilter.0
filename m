From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Distributed firewall
Date: Mon, 26 Jul 2004 15:20:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407261520.44854.Antony@Soft-Solutions.co.uk>
References: <40FBC3C900163BC5@vsmtp2.tin.it> (added by postmaster@virgilio.it)
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40FBC3C900163BC5@vsmtp2.tin.it>
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

On Monday 26 July 2004 3:03 pm, Gianni Mantellini wrote:

> Hi to all, I'm new in this mailing list. My interest is if there's anybody
> who knows a "Distributed Firewall" for PDA's who mount the Familiar
> distribution of Linux, even commercial or open source.

Does Familiar Linux load a fairly standard kernel?   If so, depending on what 
size it's allowed to be (I'm assuming that PDAs have restricted memory for 
this sort of thing, like embedded systems), you should be able to compile the 
normal netfilter options and do your firewalling as usual?

Remember that netfilter isn't an application which runs on the system - it's 
part of the kernel, so it should work on anything which talks TCP/IP.

Or maybe there's something about Familiar Linux (which I'm not familiar with, 
BTW) which means this isn't possible...?

Regards,

Antony.

-- 
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the list;
                                                           please don't CC me.


