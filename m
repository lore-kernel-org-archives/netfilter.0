From: John Mathey <jmathey@attbi.com>
Subject: Re: Can iptables manager source mac address?
Date: Fri, 18 Apr 2003 12:29:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.2.20030418122555.00b09310@mail.attbi.com>
References: <1050747660.10928.6.camel@ntc9.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1050747660.10928.6.camel@ntc9.local>
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
Content-Transfer-Encoding: 7bit
To: NetSnake <netsnake@963.net>, netfilter@lists.netfilter.org

Yes, you can use iptables to validate the mac address, try this:

iptables -A INPUT -m mac --mac-source 00:05:69:00:04:BA  -j ACCEPT

or

iptables -A INPUT -m mac --mac-source ! 00:05:69:00:04:BA -j DROP

you get the idea
Hope this helps
John


At 06:21 PM 4/19/2003 +0800, NetSnake wrote:
>   I use iptables to nat to internet, but I found some user use a proxy
>on intranet, like, 192.168.0.5 can access to internet, 192.168.0.10 can
>not access to internet, now 10 access a proxy on 192.168.0.5, then he
>can access now, I thought in package from 192.168.0.5 must contant some
>information about proxy, like source mac address, this can help me to
>identified users, can iptables do this?
>
>   Thanks.


