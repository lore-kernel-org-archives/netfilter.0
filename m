From: "Shankar; Hari" <hari@ece.utexas.edu>
Subject: Re: Newbie question
Date: Sun, 16 Feb 2003 16:50:15 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.10.10302161645330.8042-100000@tick.ece.utexas.edu>
References: <200302160257.48195.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302160257.48195.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi Joel,

Thanks a lot! Apparently I hadn't loaded the iptable_filter.o module while
configuring uml, and loading it seemed to do the trick! And I will make
sure to upgrade to iptables 1.2.7a too!

Thanks,
Hari

> Finally (but actually first and foremost) you should get iptables v1.2.7a 
> installed, but you'll need to be comfortable with compiling and 
> installing to do so.  If you're not, then just work with what you have 
> for now and get familiar and comfortable first - but be aware that the 
> answer to a support question will sometimes be "install 1.2.7a then 
> ask".
> 
> j
> 
> 
> 



