From: Michelle Konzack <linux4michelle@freenet.de>
Subject: Re: ULOG
Date: Thu, 22 Jan 2004 16:16:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040122145159.GE13388@freenet.de>
References: <20040121004046.GG8389@freenet.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040121004046.GG8389@freenet.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Am 2004-01-21 01:40:46, schrieb Michelle Konzack:
>Hello, 
>
>I am using Debian GNU/Linux 3.0r2 WOODY and have installed the 'ulogd' 
>Packge. 
>
>I like to log the traffic in my ADSL-Interface ppp0 
>But I do not know, HOW !

Now I ave tried again:

iptables -I INPUT  1 -i ppp0 -j ULOG
iptables -I OUTPUT 1 -o ppp0 -j ULOG

But I get nothing in the logfiles...

Q:	Does anyone have A WOODY-Backport for 'ulogd' ?
	I have only version 0.97-1. Because a little technical 
	problem I can not compile the Version from 'unstable'
	
Greetings
Michelle

-- 
Registered Linux-User #280138 with the Linux Counter, http://counter.li.org/ 


