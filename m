From: Felipe Kellermann <stdfk@terra.com.br>
Subject: CT: Something like max-src-conn
Date: Fri, 6 May 2005 01:09:17 -0300 (BRT)
Message-ID: <Pine.BSO.4.62.0505060046560.30552@bepuvq.alien.bet>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I've recently considered writing something like the `max-src-conn' from 
OpenBSD's pf support in the netfilter. Just curious: Does anyone know 
about some piece of code or similar functionality in the netfilter's 
conntrack (in POM-ng, etc)? Am now considering writing something using 
CONNTRACK-API that I've seen last weekend on POM-ng.

The `max-src-conn' semantics: ``max-src-nodes <number>''.
From the man page: "Limits the maximum number of source addresses which 
can simultaneously have state table entries".

-- 
Felipe Kellermann

