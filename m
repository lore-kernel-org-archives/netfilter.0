From: "John Black" <black@arbbs.net>
Subject: Re: (No subject header)
Date: Mon, 29 Nov 2004 17:10:17 -0600
Message-ID: <41abac59.42.31a.1947458792@arbbs.net>
Reply-To: black@arbbs.net
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org




> You also need forward statment
> 
> iptables -A FORWARD -d 110.20.30.15 -p tcp --dport 2289 -j
> ACCEPT
would my server need to be in that forwarding statement?
iptables -A FORWARD -d 80.1.1.1 -p tcp --dport 3389 -j
ACCEPT

because i want to allow only this address 80.1.1.1 access to
this port.

> also in case it matters to you, you misspelled iptables
> below.
it was just a typeo


