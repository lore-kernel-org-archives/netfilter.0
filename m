From: Alexis <alexis@attla.net.ar>
Subject: Re: POSTROUTING
Date: Wed, 18 Feb 2004 14:52:34 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077126754.1594.23.camel@pepelui.baicom>
References: <40337FD5.5000905@divx.team.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40337FD5.5000905@divx.team.lv>
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
To: capsx@divx.team.lv
Cc: Netfilter <netfilter@lists.netfilter.org>

But, this is not right, LOCAL_NET is not a target, you need at least to
create a new chain called LOCAL_NET to use it as a target.

Im not shure if you can use a chain as a match.



On Wed, 2004-02-18 at 12:08, capsx wrote:
> Hello!
> 
> Is it possible in POSTROUTING as source to specify a chain:
> 
> f.e.
> 
> iptables -N LOCAL_NET
> iptables -A INPUT -i eth1 -s 10.0.0.9 -j LOCAL_NET
> 
> iptables -t nat -A POSTROUTING -o eth0 -s LOCAL_NET -j SNAT --to ip.ad.re.ss
-- 
Alexis <alexis@attla.net.ar>


