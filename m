From: Andrea Rossato <mailing_list@istitutocolli.org>
Subject: Re: Modifying Source Ip on input/prerouting
Date: Wed, 11 Dec 2002 17:34:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF76921.4080108@istitutocolli.org>
References: <20021211135812.GA8394@nath.rubis.org> <3DF7536F.9050002@istitutocolli.org> <20021211153854.GA9333@nath.rubis.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021211153854.GA9333@nath.rubis.org>
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

Stephane Jourdois wrote:
> The problem is that I wan't to change the incoming traffic...
> What I would need is something similar to :
> 	-A PREROUTING -j SNAT --from-source xxx

what you need is probably

iptables -A OUTPUT -t nat -j DNAT --to 1.2.3.4

iptables tutorial says that output chain in nat table is broken. but i 
don't know if it still is.
andrea


