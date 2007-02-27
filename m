From: Aleksander <aleksander@krediidiinfo.ee>
Subject: Re: iptables <= 1.3.7
Date: Tue, 27 Feb 2007 14:51:29 +0200
Message-ID: <45E42951.6010208@krediidiinfo.ee>
References: <027301c759c0$cf2352a0$6b0a0bc1@Walle>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <027301c759c0$cf2352a0$6b0a0bc1@Walle>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Christopher Wallin wrote:

> It seems that my iptables is blocking my inbounds generated connection, so
> when i have -P INPUT DROP, my traffic goes from my pc and to the server but
> iptables is blocking them when the replies from the server comes to my PC.

-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

Alex

