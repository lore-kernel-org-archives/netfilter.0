From: Nguyen Dinh Nam <64vn@cardvn.net>
Subject: Re: yahoo mail problem
Date: Sat, 05 Mar 2005 21:21:04 +0700
Message-ID: <4229C04F.1000103@cardvn.net>
References: <0dd101c5215c$7393efb0$09603fca@southern>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <0dd101c5215c$7393efb0$09603fca@southern>
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
To: hareram <hareram@sol.net.in>
Cc: netfilter@lists.netfilter.org

If you use pppoe, and your ISP blocks ICMP packets (many incompetent 
ISPs do so), you will need tp CLAMP MSS:
http://lists.roaringpenguin.com/pipermail/rp-pppoe/2004-August/000006.html

hareram wrote:

> Hi all
>
> I have iptables running with FC3
> I have some different problem
> when iam doing NAT and masq.. iam not able to check yahoo mails
> when i use the public IP i could able to check mails and send/receive
>
> iam doing ip masq using 1 public ip address.
> when i change to another public ip for 2 days iam able to check the 
> yahoo mails send/receive ok.
> then again start getting the same yahoo mail problem
>
> does any one face this kind of problem or any solution for this kind 
> of situation ??
>
> suggestion and some docs will be appreciated
>
> hare


