From: George Agnelli <george@mattandgeorge.com>
Subject: Re: IPSec passthrough with iptables
Date: Tue, 15 Oct 2002 11:09:06 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B9D1A7D2.3DF9%george@mattandgeorge.com>
References: <20021015082231.RBQR27697.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021015082231.RBQR27697.mta05-svc.ntlworld.com@there>
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

I'm having a similar problem and am not very experienced yet with iptables.

> Make sure you are forwarding (both ways :-) protocol 50 (ESP), protocol 51
> (AH) and UDP sport 500 / dport 500 (IKE).

Could you show me the best way to write this in iptables syntax?

George


