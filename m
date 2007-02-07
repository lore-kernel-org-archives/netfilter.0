From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: How to get trace of rules traversed by a packet?
Date: Wed, 07 Feb 2007 15:43:37 -0600
Message-ID: <45CA4809.8060505@riverviewtech.net>
References: <BAY101-F196FDBFB66E8E96B52B842D99E0@phx.gbl>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY101-F196FDBFB66E8E96B52B842D99E0@phx.gbl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Jorge Canas wrote:
> Is there a way to have iptables output the name of each table, chain and 
> rule that a packet goes through as well as the result (ie. rule matched 
> or did not match)?

I'm not sure if it will do exactly what you want (I have not personally 
used it), but I think that the TRACE target in the raw table PREROUTING 
chain will do this.



Grant. . . .

