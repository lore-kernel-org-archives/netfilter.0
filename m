From: Kiran Kumar Immidi <immidi_kiran@yahoo.com>
Subject: Re: problem with documentation
Date: Tue, 18 May 2004 09:12:50 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405180912.50361.immidi_kiran@yahoo.com>
References: <000001c439c0$a5ee79f0$28c8a8c0@polm.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c439c0$a5ee79f0$28c8a8c0@polm.dyndns.org>
Content-Disposition: inline
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
To: Benjamin Case <benjamin_case@yahoo.com>, netfilter@lists.netfilter.org

On Friday 14 May 2004 08:04 pm, Benjamin Case wrote:

> polm:/etc# iptables -N block
> polm:/etc# iptables -A block -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables: No chain/target/match by that name
>
> When I do an iptables -L , I can see the "block" chain.
>
> Why does the second command return an error ?

The problem is because the state module is not being found. Make sure that 
libipt_state.so is among your iptables libraries, and that ipt_state.[k]o 
kernel module is present. It has nothing to do with the new chain that you 
have created.

