From: Xuan Chen <xuanc@ISI.EDU>
Subject: Re: Connbytes iptables match
Date: Fri, 14 Mar 2003 06:21:28 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0303140619230.2295-100000@yen.isi.edu>
References: <200303141418.16219.tushe@mgu.bg>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303141418.16219.tushe@mgu.bg>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Todor Tzankov <tushe@mgu.bg>
Cc: netfilter@lists.netfilter.org

there are some changes and should not be too hard to fix. I have made it 
works on my box with 2.4.18 with some minor changes. Let me know if you 
need any help, just too busy to get a patch out.

-chen

 On Fri, 14 Mar 2003, Todor Tzankov wrote:

> I`m trying to use connbytes iptables match rules,
> but on the devik`s site:
> http://luxik.cdi.cz/~devik/connbytes/
> there is patch only for 2.4.17 kernel and iptables v1.2.4
> Is there patch for 2.4.20 kernel and latest iptables??
> Or this is allready in the kernel source tree??
> 

-- 
Xuan Chen
USC/ISI


