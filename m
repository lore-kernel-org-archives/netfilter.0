From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Ipchains and Webmin
Date: Mon, 22 Dec 2003 08:35:59 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FE6F33F.1090707@Loudoun-Fairfax.com>
References: <5876346$10720434363fe615ac5a6673.88338672@config4.schlund.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5876346$10720434363fe615ac5a6673.88338672@config4.schlund.de>
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

c0nd0r@kingsoc.de wrote:

>Hello,
>
>
>I need help for an iptables rule : 
>I'im using following /etc/sysconfig/iptables file ::
>www.kingsoc.de/firewall 
>It works fine, since it filters what i should. But I got one problem. I
>want to manage the Box with Webmin on port 10000 over Lan from the IP
>192.168.168.6.
>Could someone help me on making that possible ?
>
>  
>

I haven't looked at your rules, but all you need to do after installing 
the Webmin package is open up dport 10000 on the INPUT chain to allow 
the remote host to connect. Something like this should work:

iptables -A INPUT  -s 192.168.168.6 -p tcp --dport 10000 -j ACCEPT

I'll warn you that Webmin is pretty slow and tedious if you need to make 
a lot of changes, but it seems to work well.

Jeff



