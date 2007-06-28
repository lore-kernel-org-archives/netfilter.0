From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: How can I forward ICMP packages?
Date: Thu, 28 Jun 2007 12:28:19 +0200
Message-ID: <20070628102819.GB29575@outback.rfc2324.org>
References: <4682DE75.5040301@hp.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4682DE75.5040301@hp.com>
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

Am Wednesday, den 27 June hub Bryan Christ folgendes in die Tasten:

> I can't seem to find a rule to do this.

What exactly is your problem?
If you actived routing or build a bridge icmp packages should be
forwarded if you did not filter them away.

Maybe you are looking for something like this:
 iptables -I FORWARD -p icmp -j ACCEPT

Ciao
Max
-- 
	Follow the white penguin.

