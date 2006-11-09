From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack -E -i not allowed?
Date: Thu, 09 Nov 2006 18:10:05 +0100
Message-ID: <455360ED.2030809@netfilter.org>
References: <200611011043.53370.alan.ezust@presinet.com>
	<200611071037.52450.alan.ezust@presinet.com>
	<4552302B.1030509@netfilter.org>
	<200611090852.14878.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200611090852.14878.alan.ezust@presinet.com>
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
To: Alan Ezust <alan.ezust@presinet.com>
Cc: netfilter@lists.netfilter.org

Alan Ezust wrote:
> Thanks for the reply. Ok, I can see how I can generate some IDs, but I first 
> want to make sure i have all of the information I need.
> 
> When I run conntrack, I only see one protocol number. I think it is a layer4 
> protocol (tcp vs udp). If I'm not seeing an l3proto in my output, why might 
> that be?
> 
> udp      17 12 src=10.10.201.2 dst=204.174.64.1 sport=54475 dport=53 
> src=204.174.64.1 dst=209.53.156.2 sport=53 dport=54475 use=1 mark=0
> tcp      6 420332 ESTABLISHED src=10.10.100.3 dst=10.10.1.22 sport=1356 
> dport=5432 src=10.10.1.22 dst=10.10.100.3 sport=5432 dport=1356 [ASSURED] 
> use=1 mark=0

Are you using nf_conntrack? If so, l3protonum is not shown yet but it
would not be hard to cook a patch to show it. I'll introduce this change
in the new libnetfilter_conntrack API.

-- 
The dawn of the fourth age of Linux firewalling is coming; a time of
great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris

