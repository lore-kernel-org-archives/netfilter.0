From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: iptables in kernel 2.6.6
Date: Sat, 10 Jul 2004 22:15:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407102215.35854.Alistair@nerdnet.ca>
References: <20040709131414.GB16434@omega.lacnic.net.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040709131414.GB16434@omega.lacnic.net.uy>
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

On July 9, 2004 09:14 am, Pablo Allietti wrote:
> a collegue ask this question for me
>
> when compiling in IPTables stuff, I noticed that there was quite a bit
> of stuff that is now missing from the kernel 2.6.6
> Could someone point me to where I can find kernel patches or
> replacements for these:
>
>
> String Match
> DNAT Target
> SNAT Target
> TARPIT Target

	Greetings:
	
	 DNAT/SNAT are integral to iptables -- there is no particular Kernel Module
	or selection on the iptables section of kernel menu for them.

	From what I can see in CVS -- TARPIT is being worked on, and string doesn't
	look like anyone has started to convert it.
	
	TARPIT -> "initial work on 2.6.x merge.  needs more work (rtable -> flowi 
conversion)"

	string -> "Requires 2.4.x since there is no 2.6.x port yet (see ml archives) 
"
	both quotes above are from current CVS .... 


	Alistair. 

