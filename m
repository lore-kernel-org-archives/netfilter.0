From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: multi-isp connection NAT not working
Date: Wed, 28 Sep 2005 13:24:11 -0500
Message-ID: <200509281324.11170.rob0@gmx.co.uk>
References: <1127926307.32641.17.camel@tholian.starken.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1127926307.32641.17.camel@tholian.starken.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Wednesday 2005-September-28 11:51, Daniel Wittenberg wrote:
> I think this is a simple problem, but nothing I've read so far seems
> to help, maybe I'm missing something.

A serious typo?

> route add default via {ISP-1-gateway} table T1 dev eth0
> rule add from {ISP-1-ip} table T1
> rule add fwmark 1 table T1

Prepend "ip " to those.

> iptables -t mangle -A PREROUTING -i eth0 -j MARK --set-mark 1

ok

> route add default via {ISP-2-gateway} table T2 dev eth1
> rule add from {ISP-2-ip} table T1
> rule add fwmark 2 table T1

Again prepend "ip " and s/T1/T2/

> iptables -t mangle -A PREROUTING -i eth1 -j MARK --set-mark 2
>
> Any ideas?

I use and recommend Julian Anastasov's routes patch. Usage is explained 
in http://www.ssi.bg/~ja/nano.txt , the patches are linked from the 
parent directory. IWFM at 3 sites.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

