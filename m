From: Qui Le <qle@telogy.com>
Subject: Re: rule check
Date: Thu, 16 Jan 2003 10:50:49 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301161050.49338.qle@telogy.com>
References: <000d01c2bd74$2db248f0$1e01a8c0@win2k.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c2bd74$2db248f0$1e01a8c0@win2k.com>
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
To: Mike <mikeeo@msn.com>, netfilter@lists.netfilter.org

  No.  The first rule has a broader scope than the second rule.  The second 
rule limits the destination port to 2000 - 2050, whereas, the first rule will 
accept any destination port.

Qui


On Thursday 16 January 2003 10:30 am, Mike wrote:
> Are these two rules essentially the same ?
>
> Thanks,
> Mike
>
> iptables -A FORWARD -i eth2 -o eth0 -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
>
> iptables -A FORWARD -i eth2 -o eth0 -p tcp --dport 2000:2050 -m
> state --state NEW,ESTABLISHED,RELATED -j ACCEPT

