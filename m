From: Tom Eastep <teastep@shorewall.net>
Subject: Re: iptables
Date: Fri, 28 Jun 2002 06:48:56 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0206280648070.13407-100000@wookie.shorewall.net>
References: <3CEF4F3E000255CB@ims3c.cp.tin.it>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CEF4F3E000255CB@ims3c.cp.tin.it>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "luigicart@tin.it" <luigicart@tin.it>
Cc: "netfilter@samba.org" <netfilter@samba.org>

On Fri, 28 Jun 2002, luigicart@tin.it wrote:

> Hi I'm Luigi.When I digit a whichever iptables command the shell say:
> /lib/modules/2.4.7-10/net/ipv4/netfilter/ip_tables.o :init_module:
> Device or resource busy
> Hint: insmod errors can be caused by incorrect module parameters,
> including invalid IO orIRQ parameters
> /lib/modules/2.4.7-10/net/ipv4/netfilter/ip_tables.o: insmod /lib/modules/Kernel/net/ipv4/netfilter/ip_tables.o
> failed
> /lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o :insmod ip_tables
> failed
> iptables v1.2.3: can't initialize iptables table 'filter' :iptables who?
> (do you need to insmod?)
> Perhaps iptables or your kernel needs to be upgraded.
> 
> Why???????

See http://www.shorewall.net/FAQ.htm#faq8

-Tom
-- 
Tom Eastep    \ Shorewall - iptables made easy
AIM: tmeastep  \ http://www.shorewall.net
ICQ: #60745924  \ teastep@shorewall.net


