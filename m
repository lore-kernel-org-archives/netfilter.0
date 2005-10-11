From: David Coulson <david@davidcoulson.net>
Subject: Re: Nat on OutPut chain ?
Date: Tue, 11 Oct 2005 07:40:05 -0400
Message-ID: <434BA495.20809@davidcoulson.net>
References: <20051012110400.ab0e00ce.zoup@zoup.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051012110400.ab0e00ce.zoup@zoup.org>
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
To: Armin ranjbar <zoup@zoup.org>
Cc: netfilter@lists.netfilter.org



Armin ranjbar wrote:
> i'm confused a bit , is this possible to do NAT on OutPut chain ?

Yes, you can do DNAT on OUTPUT in the nat table.

David

-- 
David J. Coulson
email: david@davidcoulson.net
web: http://www.davidcoulson.net/
phone: (216) 920-3100 / (216) 258-4942

