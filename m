From: Matt Hellman <netfilter@taxandfinance.com>
Subject: Re: Restricted Access
Date: Mon, 07 Jul 2003 23:46:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F0A4CB5.6060809@taxandfinance.com>
References: <001e01c34437$cf18b9a0$b900a8c0@ljhpm.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001e01c34437$cf18b9a0$b900a8c0@ljhpm.com.au>
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
To: netfilter@lists.netfilter.org

Craig Thew wrote:

>Hi everyone,
>
>I have a very basic iptables setup to allow my windows clients to access
>the net
>through iptables, What I want to do is allow some clients to have full
>access the any websites
>and others to be resticted to certain sites only, Can iptables do this?.
>Does someone have an example
>or point me in the right direction     
>
>Many Thanks
>
>CT
>
Unless you have a very small number of ip addresses and ports you want 
to allow those "restricted clients" to access...I would advise using an 
application layer proxy like Squid. It would have the added benefit of 
allowing you to configure authentication as well, which is almost always 
a more effective and thorough way to restrict [and monitor] client 
access. Goodluck,

Matt


