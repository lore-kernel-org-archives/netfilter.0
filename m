From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: question about match string?
Date: Sat, 25 Oct 2003 18:06:30 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031026010630.16688.qmail@web40204.mail.yahoo.com>
References: <20031025224901.55994.qmail@smtp.puc.cl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031025224901.55994.qmail@smtp.puc.cl>
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
Content-Transfer-Encoding: 7bit
To: "Miguel Amador L." <amador@puc.cl>, nf <netfilter@lists.netfilter.org>

--- "Miguel Amador L." <amador@puc.cl> wrote:
> 
> I need know if ipchains support match string filter, even though i know that 
> this is a iptables list, i need do resolve this question.
>  I started  with iptables linux firewall , and never see ipchains.
>  Thnk
>   Miguel Amador L.
>  
> 
I doubt very seriously if string matching is available in ipchains. It is after
all an iptables module. It might be..but I have to wonder if string matching
would even work on a 2.2.x kernel. Most people who still run ipchains I think
run it on 2.2.x kernels...

I could be wrong though.

=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
Exclusive Video Premiere - Britney Spears
http://launch.yahoo.com/promos/britneyspears/

