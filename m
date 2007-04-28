From: "Alex" <alex@hackgod.org>
Subject: Re: Wireless Login Page
Date: Sat, 28 Apr 2007 18:32:54 +0100
Message-ID: <001701c789bb$63d2d680$0a00080a@rhea>
References: <1177606092.3828.108.camel@ws1.walco02.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Kirk Wallace <kwallace@wallacecompany.com>, netfilter@lists.netfilter.org

TBH this site can explain -j REDIRECT better than I could.
http://security.maruhn.com/iptables-tutorial/x10065.html

Is the machine thats doing the NATing the same as the one with the httpd? 
This has to be the case for redirect to work as you require it. Other wise, 
maybe you could use squid to proxy?

----- Original Message ----- 
From: "Kirk Wallace" <kwallace@wallacecompany.com>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, April 26, 2007 5:48 PM
Subject: Wireless Login Page


>I have a wireless card installed on Fedora 4 system. I have the wireless
> connection open, DHCP enabled and have disabled forwarding for the
> "open" network. I use Poptop and Radius to authenticate and assign IP
> addresses on the tunnel and then allow forwarding for the tunnel address
> range. I now want to have all http requests from the "open" network to
> be directed to a opening/login page on the wireless server. Can this be
> done with iptables (conntrack?)? Would anyone suggest links or keywords
> for finding more information? Thank you.
>
> Kirk
>
>
> 


