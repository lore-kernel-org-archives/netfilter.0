From: "j.travis" <skynet@psinode.com>
Subject: Re: -m tcp
Date: Wed, 24 Mar 2004 10:41:07 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <019301c411cf$94dbc5f0$0300a8c0@max2>
References: <017e01c411cd$c358a170$0300a8c0@max2> <20040324183937.GB20010@jesus.seclab.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

-Then why might one be inclined to use the '-m tcp' in a situation like
this?  Clarity?

-Under what circumstances might '-m tcp' give added value?



> On Wed, 24 Mar 2004, j.travis wrote:
>
> > Is  there any (functional) difference between these two statements?
> >
> > -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
> >
> > -A INPUT -p tcp --dport 80 -j ACCEPT
> >
>
> No. Absolutely not.
>



