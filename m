From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: DNAT problem
Date: Tue, 03 Oct 2006 16:48:45 +0200
Message-ID: <BAY103-F389194DE2542288130B31BB21C0@phx.gbl>
References: <45227670.8040702@mail.nankai.edu.cn>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45227670.8040702@mail.nankai.edu.cn>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: struggle@mail.nankai.edu.cn
Cc: netfilter@lists.netfilter.org

Bo Yang wrote:

>Thank you , I just want to know how to use the nth module ,
>so in your response , I know you load the module statistic but
>not the nth module , does this mean nth match belongs to the statistic
>module ?

Yes, nth match belongs to the statistic
module since linux 2.6.18. However you
must also upgrade to iptables 1.3.6



