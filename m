From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: (newbie) SNAT woes
Date: Thu, 7 Aug 2003 19:08:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030807230827.GC24623@cannon.eng.us.uu.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C079@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15C079@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: Martin Djernaes <martin@djernaes.dk>, netfilter@lists.netfilter.org

On Fri, Aug 08, 2003 at 08:53:21AM +1000, George Vieira wrote:

> Also, better to use MASQUERADE rather than SNAT for workstation access to the internet.

You use MASQUERADE if you have a dynamic IP otherwise use SNAT, it's more
efficient.

Ramin

