From: Fabrice MARIE <fabrice@netfilter.org>
Subject: Re: Simulate Poor Network Conditions?
Date: Sun, 29 Dec 2002 15:39:50 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212291539.51377.fabrice@netfilter.org>
References: <3BAC15E02315BC4783152AC5E9621BB501C7BA20@trcexcsrv01.trcinc.com>
Reply-To: fabrice@netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3BAC15E02315BC4783152AC5E9621BB501C7BA20@trcexcsrv01.trcinc.com>
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
To: Bill Binko <Bill.Binko@trcinc.com>, "Michael B. Allen" <miallen@eskimo.com>, netfilter@lists.netfilter.org


Hello,

On Saturday 28 December 2002 01:42, Bill Binko wrote:
> NISTNet is what you want to use for this.  It is not related to Netfilter,
> but it does exactly what you want.  When we used it, the X client was very
> buggy, but the command line rocked: http://snad.ncsl.nist.gov/itg/nistnet/
> (Not only that, but you get to use some of those tax dollars :)
> Bill

You can also use nth, random and limit matches along with the DROP target.
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO.html

Have a nice day,

Fabrice.
--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown

