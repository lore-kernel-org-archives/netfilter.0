From: "Huw Dixon" <huwdixon@hotmail.com>
Subject: Re: Time Patch on 1.2.6a
Date: Sat, 14 Dec 2002 00:44:35 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F8au7JJi2Fu6JX8dE520000db97@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: fabrice@netfilter.org, netfilter@lists.netfilter.org

Thx - i did have rpm iptables installed. I've removed the iptables package. 
Since I've already went the the 'pending-patches' step and the TIME match 
option does show in my kernel .config, can I simply do a kernel compile from 
make dep to make modules_install, reboot and install iptables 1.2.6a?

Huw


>
>You need to recompile & install iptables after that your kernel has been 
>patched.
>Since you run RH, make sure also that iptables RPM package is not 
>installed.
>
># rpm -q iptables
>package iptables is not installed
>
>If it is, just remove it, and re-compile & reinstall iptables.
>
>Have a nice day,
>
>Fabrice.
>--
>Fabrice MARIE
>
>"Silly hacker, root is for administrators"
>        -Unknown


_________________________________________________________________
Help STOP SPAM with the new MSN 8 and get 2 months FREE*  
http://join.msn.com/?page=features/junkmail


