From: Nguyen Dinh Nam <64vn@cardvn.net>
Subject: Re: which version of iptables supports iplimit or connlimit?
Date: Tue, 25 Jan 2005 21:49:08 +0700
Message-ID: <41F65C64.8010304@cardvn.net>
References: <531442a505012415241a77865c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <531442a505012415241a77865c@mail.gmail.com>
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
To: GiGi Zick <nospam2day@gmail.com>
Cc: netfilter@lists.netfilter.org

connlimit doesn't work with new kernels because of change in design. I'm 
having connlimit working perfectly on 2.6.8.1, so you can try it first.

GiGi Zick wrote:

>Hi all,
>
>Can someone please recommend me a version of iptables and linux kernel
>that supports iplimit or connlimit?
>
>I'm currently testing kernel 2.6 and iptables 1.2.11 on FC3 and they
>don't seem to support what I need.
>Thanks!
>
>
>  
>


