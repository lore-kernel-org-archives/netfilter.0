From: Ashutosh <ashutosh@teneoris.com>
Subject: Re: FTP Connection State Tracking Issue
Date: 29 Nov 2004 20:19:57 +0200
Message-ID: <1101752397.12476.3097.camel@ashutosh.teneoris.com>
References: <1101748780.12476.3083.camel@ashutosh.teneoris.com>
	<1101739147.10064.47.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1101739147.10064.47.camel@hubcap.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org


> no--but you need to write scripts like this:
> 
>   iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>   iptables -A FORWARD -p tcp --syn --dport 21 -j ACCEPT
> 

Well, I thought the Connection Tracking and NAT Modules *for* FTP did
the same.. Correct me if I am wrong..

After all, why are the ALGs neccessary, if *user space* iptables rules
are still required ?
-- 
Ashutosh Naik
Teneoris Networks India Pvt. Ltd
www.teneoris.com


