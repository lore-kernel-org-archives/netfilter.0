From: Philip Craig <philipc@snapgear.com>
Subject: Re: Trying to use NETMAP for 1-1 NAT
Date: Mon, 15 Mar 2004 14:46:35 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4055352B.3080904@snapgear.com>
References: <Pine.GSU.4.58.0403142225080.22714@adore.lightlink.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSU.4.58.0403142225080.22714@adore.lightlink.com>
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
To: Nick Taylor <nickt@lightlink.com>
Cc: netfilter@lists.netfilter.org

Nick Taylor wrote:
> so, I try:
> iptables -t nat -A POSTROUTING -s 192.168.33.0/24 -j NETMAP
> iptables v1.2.7a: Couldn't load target
> `NETMAP':/usr/lib/iptables/libipt_NETMAP.so: cannot open shared object file: No such file or directory

You just need to rebuild your iptables userspace.  The NETMAP extension
is only included if userspace is built against a kernel that supports it.
There's no need to get the latest iptables userspace from CVS.

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


