From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: ip_forward file
Date: Fri, 5 Jul 2002 00:45:42 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <02070500454203.06327@Lms>
References: <200FAA488DE0D41194F10010B597610D2BA22B@JUPITER>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200FAA488DE0D41194F10010B597610D2BA22B@JUPITER>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: George Vieira <GeorgeV@citadelcomputer.com.au>
Cc: iptables <netfilter@lists.samba.org>

On Friday 05 July 2002 00:12, George Vieira wrote:
> Redhat uses it's /etc/sysconfig/network file to save that stuff..
>
> IE..
>
> FORWARD_IPV4=yes

Not on all RedHat versions work this way, e.g. NOT on RH 7.1 which I am 
running today.

But I seem to remember it did in RH 6.1; what version are you running?

On RedHat 7.1 a "service network stop" (or /etc/init.d/network stop) will 
disable forwarding, but "service network start" will NOT enable it again (!), 
unless specified in /etc/sysctl.conf.

So if you do a "service network restart" (or /etc/rc.d/init.d/network 
restart) and expect to have a clean network configuration (after messing 
around or whatever), then your forwarding won't work.

This is the reason why I now use /etc/sysctl.conf instead of a line in 
/etc/rc.local; then everything works fine.

Jan Humme.

