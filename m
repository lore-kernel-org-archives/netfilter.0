From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: filtering by packet contents?
Date: Tue, 15 Jul 2003 23:22:58 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F14EF42.5010006@smgtec.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15BF26@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15BF26@wardrive.citadelcomputer.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: cc <cc@belfordhk.com>, netfilter@lists.netfilter.org

George Vieira wrote:

>You can you use the p-o-m patch for the string module "-m string --string pattern"
>
>this works and can be used for some funky stuff too like redirecting 1 virtual host on a server to another server which is very handy when a particular virtual host goes down...
>
>  
>

Just keep in mind that the string patch is VERY heavy on CPU depending 
on how much traffic passes through the rule.


