From: "Jason Corekin" <jason@corekin.no-ip.com>
Subject: Re: Custom kernel won't load iptables modules
Date: Sat, 15 Feb 2003 23:49:21 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c2d58f$eaf416e0$5d01a8c0@jason>
References: <000801c2d585$ba8091f0$5d01a8c0@jason> <200302161536140710.001B82E8@202.188.95.165>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Julian Gomez <kluivert@tm.net.my>, netfilter@lists.samba.org

    According to RedHat my modutils is up to date, along with the rest of my
system.

    I also checked for myself, my modutils is at the same version level as
my kernel 2.4.18.  Should my modutils be at a higher version?

Jason Corekin
----- Original Message -----
From: "Julian Gomez" <kluivert@tm.net.my>
To: "Jason Corekin" <jason@corekin.no-ip.com>
Sent: Saturday, February 15, 2003 11:36 PM
Subject: Re: Custom kernel won't load iptables modules


>
> >Feb 15 20:36:10 corekin iptables: init_module: Device or resource busy
> >Feb 15 20:36:10 corekin iptables: /lib/modules/2.4.18-24.8.0custom/
> >kernel/net/ipv4/netfilter/ip_tables.o:insmod
>
> Other people noticed the same issue before also -- upgrading modutils
> fixed the issue, but that was on RH v7.2 -> v7.3 I think. You can try it
though.
>
>
>
>


