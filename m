From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: blocking msn
Date: Thu, 23 Dec 2004 17:20:27 +0100
Message-ID: <20041223162009.84CF06E5D8@smtp.sterenborg.info>
References: <1103818431.6478.83.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1103818431.6478.83.camel@hubcap.ljm.dom>
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

netfilter-bounces@lists.netfilter.org wrote:

> if you want to do this with just IP filtering, you could try
> blocking port 80 access to 207.46.104.20, which is what that
> FQDN currently resolves to--but this solution is kludgey and
> requires that you keep up with the IP address(es) constantly.

You can do that, but last time I checked there were multiple IP's that
MSN Messenger connects to.
So, when you block one it will try another. You'll end up with a list of
MSN servers to block.


Gr,
Rob


