From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: my system is under syn-flood attack
Date: Mon, 23 Sep 2002 08:26:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020923072643.BZMQ20346.mta02-svc.ntlworld.com@there>
References: <002201c262ae$36db04b0$9801010a@redhat73>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002201c262ae$36db04b0$9801010a@redhat73>
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
To: netfilter@lists.netfilter.org

On Monday 23 September 2002 4:06 am, Peter.Chen wrote:

> my box is redhat 7.3 apache 1.3.26
> 
> from last week . some guys use syn-flood and ping death to attack my
> system
 

> #Set default policies to DROP

Good idea.

> $IPTABLES -F INPUT
> $IPTABLES -F OUTPUT
> $IPTABLES -F FORWARD
> $IPTABLES -P INPUT ACCEPT
> $IPTABLES -P OUTPUT ACCEPT

Why have you not set the default INPUT and FORWARD policies to DROP ?

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

