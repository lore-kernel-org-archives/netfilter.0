From: capsx <capsx@divx.team.lv>
Subject: Re: POSTROUTING
Date: Wed, 18 Feb 2004 20:07:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4033A9DE.4030009@divx.team.lv>
References: <40337FD5.5000905@divx.team.lv> <1077126754.1594.23.camel@pepelui.baicom>
Reply-To: capsx@divx.team.lv
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077126754.1594.23.camel@pepelui.baicom>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>


iptables -N LOCAL_NET <- new chain
iptables -A INPUT -i eth1 -s 10.0.0.9 -j LOCAL_NET <- add adress to 
chain LOCAL_NET

is there something wrong ?


-[capsx]-


Alexis wrote:
> But, this is not right, LOCAL_NET is not a target, you need at least to
> create a new chain called LOCAL_NET to use it as a target.
> 
> Im not shure if you can use a chain as a match.
> 
> 
> 
> On Wed, 2004-02-18 at 12:08, capsx wrote:
> 
>>Hello!
>>
>>Is it possible in POSTROUTING as source to specify a chain:
>>
>>f.e.
>>
>>iptables -N LOCAL_NET
>>iptables -A INPUT -i eth1 -s 10.0.0.9 -j LOCAL_NET
>>
>>iptables -t nat -A POSTROUTING -o eth0 -s LOCAL_NET -j SNAT --to ip.ad.re.ss


