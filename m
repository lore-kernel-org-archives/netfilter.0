From: Shawn <core@enodev.com>
Subject: Re: iptables support this?
Date: 18 Jul 2003 10:10:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058541048.2196.8.camel@localhost>
References: <20030718145526.49893.qmail@web41505.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030718145526.49893.qmail@web41505.mail.yahoo.com>
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
To: Augusto Flavio <augustoflavioms@yahoo.com.br>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Performance no fail much, but you fail to mention how it is all
organized. Not that it should matter much with modern CPUs. How many
sequential steps in the path you're worried about? 500? That would be
just silly.

I'm guessing you have different rules for different IP or IP range
matches. No big deal.

Keep in mind if you're that worried about speed, maybe you ought to
think about making your routing and firewalling separate.


On Fri, 2003-07-18 at 09:55, Augusto Flavio wrote:
> Hi,
> The IPTables support some like 500 rules? 
> The performance fail much?
> 
> 
> Tkz!


