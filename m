From: Michelle Konzack <linux4michelle@freenet.de>
Subject: Re: ULOG:  invalid argument
Date: Thu, 26 Feb 2004 02:40:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040226014018.GH27875@freenet.de>
References: <LAW12-F18Uhyx9w8OjU000276ef@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <LAW12-F18Uhyx9w8OjU000276ef@hotmail.com>
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
Cc: netfilter@lists.netfilter.org

Am 2004-02-19 20:46:12, schrieb T. Take:
>I cannot use "ULOG".
>
>#iptables -A INPUT -i $OUTER_PORT -s $INNER_IP -j ULOG --ulog-nlgroup 32 
>--ulog-prefix "spoofed packet "
>#iptables: Invalid argument
>
>Although I updated iptables to version 1.2.9 and installed ulogd by apt-get 
>install (Debian),  I have not used ULOG yet. And there is ipt_ULOG.o in 
>"/lib/modules/2.4.24/kernel/net/ipv4/netfilter".
>
>Did you have the same problem about ULOG?
>I hope your advises.

I had he same problem...

It is NOT an iptables problem/bug !!!

It is the ULOG Package from WOODY !!! 

It is too old. put the source from unstable 
in your /etc/apt/sources.list like

deb-src ftp://ftp.debian.org/debian unstable main

Then make a 

apt-get build-dep ulogd

and last not least a 

apt-get -b source ulogd

It will compile automaticly and install ist.

Have fun with 'iptables' and 'ulogd'

Greetings
Michelle

-- 
Registered Linux-User #280138 with the Linux Counter, http://counter.li.org/ 

