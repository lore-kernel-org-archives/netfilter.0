From: Stephen Shirley <diamond+netfilter@skynet.ie>
Subject: Re: conntrack broken with multiple gateways?
Date: Mon, 07 Feb 2005 16:48:08 +0000
Message-ID: <42079BC8.1020303@skynet.ie>
References: <4202FA6F.5080500@skynet.ie>
	<d64535605020403435dcc2b0b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <d64535605020403435dcc2b0b@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ulysses Almeida <ulysses.almeida@gmail.com>
Cc: netfilter@lists.netfilter.org

Ulysses Almeida wrote:
> Do you have your ReturnPathFilter disable? If it's enabled, multiple
> routing is supose not to work
> 
> echo 0 > /proc/sys/net/ipv4/conf/*/rp_filter

And that was it, thank you!

Steve


