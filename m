From: "John Black" <black@arbbs.net>
Subject: Re: ip alias
Date: Tue, 28 Sep 2004 07:04:25 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <008601c4a553$4cd4ce60$936ffea9@alpha>
References: <20040928051024.692C0BE3@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


> You say "it will not let me out". Is that out to the internet ?
> I can't see the use for the above :
> - You assign an ip alias to eth0:0
> - You forward all traffic coming in on eth0 (that is directed to the
> aliased ip 192.168.1.23) to 161.31.31.23
> By doing this you won't get access to the internet.

but, how would you forward outgoing traffic to this address?  So 
all traffic generated on 192.168.1.23 is see coming from 161.31.31.23?

john






