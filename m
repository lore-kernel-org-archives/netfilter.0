From: Willi Mann <newsletters@wm1.at>
Subject: Re: SNAT kills local stuff?
Date: Mon, 14 Jul 2003 22:07:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F130D66.30505@wm1.at>
References: <20030714184402.742.30442.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030714184402.742.30442.Mailman@kashyyyk>
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
To: netfilter@lists.netfilter.org, busby@pnts.com

Please tell us what you mean by "connect out". Do you mean connections 
to any other host or do you mean connections to hosts outside your LAN?

My guess is that the problem occurs because all packets go through the 
POSTROUTING chain, not only packets that will go to the Internet. That's 
why most examples use (only) -o.

I'd suggest to analyze your IP-Traffic with ethereal.

WM


