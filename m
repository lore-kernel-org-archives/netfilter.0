From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Review of firewall script
Date: Mon, 15 Mar 2004 23:35:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403152335.29942.Antony@Soft-Solutions.co.uk>
References: <20040315231838.GB26800@samad.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040315231838.GB26800@samad.com.au>
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

On Monday 15 March 2004 11:18 pm, Alexander Samad wrote:

> Hi
>
> I have attached my firewall script, basically creates a DB of rules,
> also creates a default set of rules.
>
> Any comments ?

It's long, it's complicated, and it contains some regexes which I don't even 
want to think about.

If you get some problems, by all means post the output of "iptables -L -nvx; 
iptables -L -t nat -nvx" and tell us what the problems are, but I think this 
script is in such a nonstandard form that not many people here are going to 
spend the time looking through it and trying to see if there are any security 
holes.

That's my opinion, anyhow....   (happy for someone else to show I'm wrong)

Regards,

Antony.

-- 
If at first you don't succeed, destroy all the evidence that you tried.

                                                     Please reply to the list;
                                                           please don't CC me.


