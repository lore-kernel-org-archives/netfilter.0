From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Round Robin Load Balancing
Date: Thu, 31 Jul 2003 16:02:23 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030731200223.GA25319@cannon.eng.us.uu.net>
References: <200307311448.h6VEmrpq018899@webmail2.magma.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200307311448.h6VEmrpq018899@webmail2.magma.ca>
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
Content-Transfer-Encoding: 7bit
To: Javier Govea <jgovea@magma.ca>
Cc: netfilter@lists.netfilter.org

On Thu, Jul 31, 2003 at 10:48:53AM -0400, Javier Govea wrote:

> Hi guys,
> 
> Well I tried to use the "nth" patch in the mangle table in both the FORWARD and PREROUTING
> chains and still no success. My browser still cannot surf internet, it just waits and
> eventually times out. The rules i tested are below, please correct them if they are wrong.
> 
> Any more suggestions??? any other ideas????

Yes. CONNMARK the conn's and route them accordingly:

iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source <ppp0-ip-addr>
iptables -t nat -A POSTROUTING -o ppp1 -j SNAT --to-source <ppp1-ip-addr>
iptables -t nat -A POSTROUTING -o ppp2 -j SNAT --to-source <ppp2-ip-addr>
iptables -t nat -A POSTROUTING -o ppp3 -j SNAT --to-source <ppp3-ip-addr>

iptables -t mangle -A PREROUTING -m nth --every 4 --packet 1 -m state --state new  -j CONNMARK --set-mark 1
iptables -t mangle -A PREROUTING -m nth --every 4 --packet 2 -m state --state new  -j CONNMARK --set-mark 2
iptables -t mangle -A PREROUTING -m nth --every 4 --packet 3 -m state --state new  -j CONNMARK --set-mark 3
iptables -t mangle -A PREROUTING -m nth --every 4 --packet 0 -m state --state new  -j CONNMARK --set-mark 4

iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 1 -m state --state new  -j CONNMARK --set-mark 1
iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 2 -m state --state new  -j CONNMARK --set-mark 2
iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 3 -m state --state new  -j CONNMARK --set-mark 3
iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 0 -m state --state new  -j CONNMARK --set-mark 4

iptables -t mangle -A POSTROUTING -m connmark --mark 1 -j ROUTE --oif ppp1
iptables -t mangle -A POSTROUTING -m connmark --mark 2 -j ROUTE --oif ppp2
iptables -t mangle -A POSTROUTING -m connmark --mark 3 -j ROUTE --oif ppp3
iptables -t mangle -A POSTROUTING -m connmark --mark 4 -j ROUTE --oif ppp0

Haven't had the chance to test it, though.

Ramin

