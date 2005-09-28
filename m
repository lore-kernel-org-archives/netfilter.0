From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Iptables for webmail access
Date: Wed, 28 Sep 2005 11:32:46 +0200
Message-ID: <433A633E.4020807@mnemon.de>
References: <01ef01c5c382$b9666ef0$0b0c0a0a@Alejandro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <01ef01c5c382$b9666ef0$0b0c0a0a@Alejandro>
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
To: netfilter@lists.netfilter.org

Alejandro Cabrera Obed wrote:
> Hi people,
> 
> I have a Linux machine with a webmail server  (smtp+imap+http), and I have a
> iptables script in order to protect the host.
> 
> By default I deny all the traffic. Then, I enable all new connections
> (--syn) from every hosts (-s 0/0) to ports 25, 80 and 143.
> 
> But whern a try to log in via web, I can enter the webmail interface and I
> get a message teling "IMAP timeout".
> 
> The connection from the webmail to the imap server is from eth0 to eth0, I
> suposse Im forgetting something like this.....
> 
> Can you help me with a iptables rule in order to connect to my imap server
> from the webmail interface, both in a unique machine ???


No, not enough information :( Please post your rule set, either the 
output of iptables -nvxL or iptables-save.

