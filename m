From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPSec passthrough with iptables
Date: Wed, 16 Oct 2002 09:41:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021016084128.RZEN292.mta03-svc.ntlworld.com@there>
References: <B9D1A7D2.3DF9%george@mattandgeorge.com> <5.1.0.14.2.20021015233540.03a36008@secure.hyperbolic.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.0.14.2.20021015233540.03a36008@secure.hyperbolic.net>
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

On Wednesday 16 October 2002 4:45 am, David A Golden wrote:

> Just to muddy the waters, through experimentation, I have found that using
> Checkpoint SecuRemote (on windows) behind a Linux netfilter firewall, I can
> achieve an IPSEC connection using just:
>
> iptables -A FORWARD -s $INTERNAL_NET -j ACCEPT
> iptables -A FORWARD -d $INTERNAL_NET -m state --state ESTABLISHED,RELATED \
>          -j ACCEPT
>
> I.e. explicit per-protocol forwarding seems unnecessary.  (Though you might
> want to be explicit for security/control reasons.)

Well, quite.

We suggested some rules which would allow IPsec through your firewall, but 
which would at least block a few other protocols.   We also weren't sure 
whether you were initiating the IPsec connection from the inside or the 
outside of your firewall (it's clearly the inside, if the above rules work).

If you prefer to allow *every* protocol out of your network, then this 
includes IPsec, so you don't need to do anything specific.

Good that you have things working - now to consider how secure you want it...

Antony.

-- 

Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Nobel Prizewinner in Physics

