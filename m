From: Willi Mann <newsletters@wm1.at>
Subject: Re: strange log entries concerning mail server
Date: Sat, 15 Feb 2003 23:05:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E4EB9C5.1070109@wm1.at>
References: <20030213171002.5495.70915.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030213171002.5495.70915.Mailman@kashyyyk>
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
To: netfilter@lists.netfilter.org, k.tragant@firemail.de

Look at

http://www.iptables.org/documentation/tutorials/blueflux/iptables-tutorial.html#NEWNOTSYN
(The paragraph with "..bad Microsoft TCP/IP implementations.." )

This *could* be the problem as long as your machine makes outgoing 
sessions to these ports.

I have similar problems with a HTTP-proxy.

Willi Mann



