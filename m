From: unauthorized@internode.on.net
Subject: Re: problem with hostB wifi0 -> aDSL modem wifi0 -> hostA wifi0 ->
 hostA eth0 -> hostA ppp0 -> aDSL modem bridge --- Not
 MASQUERADEing...
Date: Mon, 22 Jan 2007 23:48:07 +1100
Message-ID: <20070122234807.5d7b08a0@athlon1>
References: <20070122233232.6e63e55b@athlon1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070122233232.6e63e55b@athlon1>
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

On Mon, 22 Jan 2007 23:32:32 +1100
unauthorized@internode.on.net wrote:

< I can't even run on hostA:
> ping -I ath0 <external internet site>
> as that fails.

I forgot to mention that I do however see traffic leaving ppp0 destined for <external internet site> while using tcpdump.

Chris-

