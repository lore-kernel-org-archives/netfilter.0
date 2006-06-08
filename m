From: Philip Craig <philipc@snapgear.com>
Subject: Re: iptables - resource temporary unavailable
Date: Thu, 08 Jun 2006 18:26:48 +1000
Message-ID: <4487DF48.9020608@snapgear.com>
References: <000001c68abb$b71dd1a0$0101000a@sterenborg.info>	<002601c68ac3$7188bbc0$0e01050a@robee>	<4487D422.7090707@snapgear.com>
	<005b01c68ad4$6e1f1b30$0e01050a@robee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <005b01c68ad4$6e1f1b30$0e01050a@robee>
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
To: robee <mlody@elpec.com>
Cc: netfilter@lists.netfilter.org

On 06/08/2006 06:20 PM, robee wrote:
> Could you tell me how do you lock around calls to iptables?

See 'man lockfile'.  It includes an example.


