From: "Andrew S. Haydon" <andrew_s_haydon@yahoo.com>
Subject: Re: -p icmp in IPv6 does not work
Date: Mon, 31 Mar 2003 23:55:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E891BBA.9020907@yahoo.com>
References: <Pine.GSO.4.44.0303311016410.25589-100000@rose.man.poznan.pl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marcin Kaminski <maxiu@man.poznan.pl>
Cc: netfilter@lists.netfilter.org

To use -p icmpv6 may be helpful.

Marcin Kaminski wrote:

>Hi
>I've tried to filter out some ICMPv6, but -p icmp does not seem to work.
>ip6tables -A OUTPUT -p icmp -j DROP
>is doing nothing. It looks like -p icmp matches nothing, filtering with
>other rules (-s etc) works pretty well.
>Of course any other jump (f.e. LOG) does nothing too with -p icmp.
>I've tested it on Linux 2.4.20 from PLD and 2.4.19 from SuSe.
>
>What is wrong?
>
>
>  
>



