From: Alex Satrapa <alex@lintelsys.com.au>
Subject: Re: Performance Monitoring
Date: Mon, 12 Jan 2004 10:26:16 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4001DB98.9090607@lintelsys.com.au>
References: <004401c3d17c$4baa7cc0$0a01000a@xcom1> <3FF9E4B7.8010109@lintelsys.com.au> <011001c3d3f8$6a6a7e20$7700000a@lawrencewin2k> <3FFA33C7.9010806@lintelsys.com.au> <20040106033802.30955.qmail@paus.pesat.net.id> <20040105230233.27d84a49.michael@bluesuperman.com> <20040110000419.GA25191@cannon.eng.us.uu.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040110000419.GA25191@cannon.eng.us.uu.net>
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
To: netfilter@lists.netfilter.org

Ramin Dousti wrote:
> One can come up with a btree which should reduce the worst case lookup to a max
> of 8 lookups for a /24.

It'd be better if netfilter supported some way of either binding rules 
to an interface, or allowing a hashtable-lookup for a "jump" based on IP 
address.


