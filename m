From: a.ledvinka@promon.cz
Subject: Re: Iptables Problems
Date: Thu, 2 Dec 2004 09:00:40 +0100
Message-ID: <OF60ADB785.65F94CAE-ONC1256F5E.002BF2C6-C1256F5E.002C019B@promon.cz>
References: <008201c4d835$eff08480$0200a8c0@etpi>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <008201c4d835$eff08480$0200a8c0@etpi>
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
To: testmail <testmail@peterpaul.com.ph>
Cc: Netfilter <netfilter@lists.netfilter.org>

> # Set the default policy
> iptables -t filter -A INPUT  -j DROP  
iptables -t filter -P INPUT DROP

