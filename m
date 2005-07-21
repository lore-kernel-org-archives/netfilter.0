From: =?UTF-8?B?SsO2cmcgSGFybXV0aA==?= <harmuth@mnemon.de>
Subject: Re: Time stamp for Recent
Date: Thu, 21 Jul 2005 18:17:25 +0200
Message-ID: <42DFCA95.90409@mnemon.de>
References: <W6058014509160581121960705@robles.clunet.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <W6058014509160581121960705@robles.clunet.edu>
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

Kevin Appel schrieb:
> Hello everyone,
> 
> I am using the recent module to set up a rule to block too many ssh attempts and I am curious about the last_seen number.  Is this some sort of timestamp and if it is, is it possible to translate this to a readable format?
> 
> Example:
> [root@caddy net]# cat /proc/net/ipt_recent/sshscans 
> src=192.168.1.21 ttl: 64 last_seen: 6908449 oldest_pkt: 5 last_pkts: 6866823, 6867384, 6867634, 6908149, 6908449
> 
> Thank you,
> 
> Kevin

I don't know the answer, but looks like sequence numbers to me. But this
may bo totally wrong.

For what you want to do, this thread may be of interest for you,
especially Grant's ideas:

https://lists.netfilter.org/pipermail/netfilter/2005-May/060299.html

Have a nice time,

Joerg


