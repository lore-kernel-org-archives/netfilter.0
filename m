From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Firewall blocking Java applet?
Date: Wed, 22 Jun 2005 21:02:32 -0500
Message-ID: <200506222102.32991.rob0@gmx.co.uk>
References: <cb82de59050622183613989c5f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cb82de59050622183613989c5f@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Jong Hian Zin <mail.zin@gmail.com>
Cc: netfilter@lists.netfilter.org

On Wednesday 22 June 2005 20:36, Jong Hian Zin wrote:
> http://202.188.95.52:8080/speedometer/
>
> The bandwidth test Java applet can be loaded, but unable to start the

Does it work if not going through the OpenWRT?

>   iptables -A INPUT -m state --state INVALID -j DROP
>   iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

You could consolidate these INPUT rules with the ones in FORWARD and 
OUTPUT. I use a chain named "State" which I call from INPUT and 
FORWARD. (I don't do OUTPUT filtering, seems pointless to me.)

>   iptables -A INPUT -p tcp --dport 22 -j ACCEPT

You're DNAT'ing your 22/tcp, so that would hit the FORWARD chain.

>   iptables -A INPUT -j input_rule

These "*_rule" chains do not appear to be used for anything.

> Any idea what is blocking the bandwidth test Java applet?

Not from what you posted. iptables-save(8) would be easier to follow. 
But you can probably troubleshoot this on your own by putting in -j LOG 
rules for -s/-d 202.188.95.52 traffic. Try it and see what you get. Is 
the openwrt capable of normal logging? Or maybe to a remote syslog 
server?
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

