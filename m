From: Matt Hellman <netfilter@taxandfinance.com>
Subject: Re: Error responce when limiting access
Date: Mon, 07 Jul 2003 23:40:38 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F0A4B46.9080408@taxandfinance.com>
References: <3F0953DB.BB9B3B4@danbbs.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F0953DB.BB9B3B4@danbbs.dk>
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
To: Netfilter <netfilter@lists.netfilter.org>

Mogens Valentin wrote:

>Using iptables, I can of cause deny access to cirtain IP addresses or
>websites, however, I'd like to make sure clients do not just get a
>timeout, not found or something alike.
>AFICS, it'll be difficult to set some errorresponce a browser can
>understand, allowing it to display a meaningful errorresponce.
>
>  
>
Use a tcp reset instead of just dropping the packet.  Try -j REJECT.


