From: Per Jessen <per@computer.org>
Subject: Re: simple load-distribution setup - but weird behaviour
Date: Sun, 14 Mar 2004 18:14:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <c323uh$u07$1@sea.gmane.org>
References: <c2s4k0$35s$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
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
To: netfilter@lists.netfilter.org

Per Jessen wrote:

> iptables -t nat -A OUTPUT -d 192.168.3.200 -j DNAT --to
> 192.168.3.101-192.168.3.108
> 
> All traffic originates on the local machine. It's been working fine for
> quite a while, but today I noticed that only 7 of the 8 machines in the
> cluster are being distributed to - 101,102,104,105,106,107,108 but not
> 103.

I've just now seen this problem again - I had taken 2 nodes down for
maintenance, and although they're both back up and running, iptables is now
not distributing traffic to them. 

Any hints or suggestions?  I'm sure clearing the filtering tables will do
it, but I'd rather understand what's going on here. 


cheers,
Per Jessen, Zurich


