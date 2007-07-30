From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Filtering Query?
Date: Mon, 30 Jul 2007 22:05:07 +0200
Message-ID: <46AE4473.8060500@rtij.nl>
References: <358385.10946.qm@web57412.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <358385.10946.qm@web57412.mail.re1.yahoo.com>
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
To: amna bilal <bilal.amna@yahoo.com>
Cc: netfilter@lists.netfilter.org

amna bilal wrote:
> Hi,
>
> Looking for some insight here. What I would like to do
> is:
>
> I have four main tables
> INTERNET_IN
> INTERNET_OUT
> LAN_IN
> LAN_OUT
>
> I have a few filters I want I named them
> ALLOW_UDP
> ALLOW_TCP
> DENY_ACCESS
>
> Is it possible to set up iptables to filter down a
> list some thing like this:
>
> iptables -A INTERNET_IN -j ALLOW_UDP
> iptables -A INTERNET_IN -j ALLOW_TCP
> iptables -A INTERNET_IN -j DENY_ACCESS
>
> What I want to accomplish is that if it doesn't meet a
> filter in ALLOW_UDP it continues to ALLOW_TCP, then to
> DENY_ACCESS, the it goes into the system.
>   

Yes, absolutely. And with these very clear chain names, it is easy to 
follow the logic as well.

OTOH, You could also opt for:

-A INTERNET_IN -p udp -j UDP_IN
-A INTERNET_IN -p tcp -j TCP_IN

-A INTERNET_IN -j DENY_ACCESS

And end both UDP_IN and TCP_IN with a -j DENY_ACCESS.


Both work, the second is a bit more efficient.

HTH,
M4




