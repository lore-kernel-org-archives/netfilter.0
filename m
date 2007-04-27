From: "Alex" <alex@hackgod.org>
Subject: Re: Wireless Login Page
Date: Fri, 27 Apr 2007 12:41:07 +0100
Message-ID: <00d501c788c0$f460c730$0a00080a@rhea>
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

You don't need contrack for the redirection part. I've achived the same 
thing on my router using -j REDIRECT

You could do it for only port 80 trafic, but I've done it for all traffic. 
You get some entertaining attempts from people trying to work out why they 
have a valid DHCP lease but now internet conductivity.

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


