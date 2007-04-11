From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: ESTABLISHED makes possible to connect to internal servers
Date: Wed, 11 Apr 2007 17:06:20 +0200
Message-ID: <20070411150620.GA27571@galois.math.uni-paderborn.de>
References: <461BCBBE.5060003@mfmdb.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <461BCBBE.5060003@mfmdb.com>
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

Am Tuesday, den 10. April hub Anton Sidorov folgendes in die Tasten:

Hi!

> The problem is that if I put
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> or just
> iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT
[...]
> it is possible to access my internal web server (and not only web
> server) from outside
> despite I did not open port 80 in FORWARD chain and policy for FORWARD
> is DROP.
[...]
> I've been fighting with that problem for two weeks now.
> I rewrite my script several times and brought it to bare basic but
> nothing has fixed the problem.

Maybe it would help to see the "bare basic" script, so we could get the
"big picture".

Ciao
Max
-- 
|           |                 Follow the white penguin.
|  |\/|  |  |-----------------------------------------------------------.
|  |  |/\|  |  Rechnerbetrieb Mathematik  |   Meine Baustellen:  TSM    |
|           |  Universitaet Paderborn     |   Hostmaster, Linux, LDAP   | 

