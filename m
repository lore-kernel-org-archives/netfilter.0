From: "Tom Elsesser" <tom@acalgrinding.dyndns.org>
Subject: Re: http forwarding
Date: Fri, 15 Nov 2002 08:40:19 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <38876.66.73.3.150.1037367619.squirrel@www.acalgrinding.dyndns.org>
References: <cld7tugoh1bo72ihi68e98j7sh2a19kqn4@4ax.com>
        <200211142011.52029.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211142011.52029.netfilter@newkirk.us>
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
To: netfilter@newkirk.us
Cc: netfilter@lists.netfilter.org


>> /sbin/iptables -A INPUT -i eth1 -d 0/0 -p tcp --dport 80 -j ACCEPT
>
> Everything looked good up to here.  This rule needs to be in the FORWARD
>  chain.  Once you've DNATted in PREROUTING, it's not coming to this
> machine,  it's being forwarded to another.


I got it working now, thanks very much to you and Eric.


Tom
-- 





