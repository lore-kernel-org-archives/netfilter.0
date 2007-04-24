From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: Re: SYN Proxy for iptables?
Date: Tue, 24 Apr 2007 12:18:46 -0700
Message-ID: <BAY119-F272D3350558D08062A1DA3D64A0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

>Hope this solve this problem:
>
># This enables SYN flood protection.
># The SYN cookies activation allows your system to accept an unlimited
># number of TCP connections while still trying to give reasonable
># service during a denial of service attack.
>i f [ "$SYSCTL" = "" ]
>then
>    echo "1" > /proc/sys/net/ipv4/tcp_syncookies
>else
>    $SYSCTL net.ipv4.tcp_syncookies="1"
>fi
>
>make sure `CONFIG_SYN_COOKIES' is compiled into the kernel while 
>configuring the kernel.
>
>On Tuesday 24 April 2007 03:24, Andrew Kraslavsky wrote:

Thanks for the suggestion!

I do already use the tcp_syncookies option to protect the Linux box that is 
acting as my firewall.

What I am interested in here is a way to have that Linux firewall box help 
protect hosts that sit behind it from SYN floods.  These hosts are of a 
mixture of operating systems and I cannot guarantee that each one has 
sufficient protection against SYN flooding on its own so I am hoping that 
the Linux firewall box can help.

As far as I can tell, the tcp_syncookies option will only help the Linux 
firewall box itself and will not do anything to assist the hosts that the 
Linux box is being used to protect.


>>Hello,
>>
>>For SYN flood protection, it seems OpenBSD's pf deploys something they 
>>call
>>a "SYN proxy" whereby the 3 step TCP handshake is completed by this proxy
>>so as to avoid SYN floods to the actual target.
>>
>>This OpenBSD pf feature is described here:
>>http://www.openbsd.org/faq/pf/filter.html#synproxy
>>
>>The target is only brought into the picture if and when the handshake is
>>complete.
>>
>>I guess pf must then adjust the real target's sequence numbers so as not 
>>to
>>confuse the initiator of the connection.
>>
>>Has something like this been implemented via iptables?
>>
>>If not, are there any plans to do so?
>>
>>Thanks,
>>
>>- Andrew Kraslavsky

_________________________________________________________________
Mortgage rates near historic lows. Refinance $200,000 loan for as low as 
$771/month* 
https://www2.nextag.com/goto.jsp?product=100000035&url=%2fst.jsp&tm=y&search=mortgage_text_links_88_h27f8&disc=y&vers=689&s=4056&p=5117


