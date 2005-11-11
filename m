From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: DNAT query
Date: Fri, 11 Nov 2005 11:55:59 +0100
Message-ID: <437478BF.1020109@mnemon.de>
References: <20051111103020.GB18203@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051111103020.GB18203@tranquility.scriptkitchen.com>
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
To: netfilter@lists.netfilter.org

Payal Rathod schrieb:
> Hi,
> I am trying to redirect trafffic from outside to an internal machine.  
> The setup is SuSE Linux 9.1 (i586) 2.6.4-52-default
> # iptables --version
> iptables v1.2.9
> 
> When I give,
> # iptables -t nat -I OUTPUT -d dyn.example.com -p tcp --dport 8000 -j DNAT --to-destination 192.168.10.2:8000
> iptables: Target problem
> 
> What exactly is wrong? If I try it on my Mandrake box it works. Any 
> ideas?

Some time ago I had a similar problem with SLES8 and nat/OUTPUT. The
reason was, that is was the _only_ netfilter optio, that wasn't compiled
into the kernel :) I generally don't work with SuSE, so I don't know.
Bur maybe they still don't compile it as a kernel module.

HTH,

Joerg



