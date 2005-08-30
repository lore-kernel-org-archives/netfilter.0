From: Sascha Reissner <sascha.reissner@toxicnet.de>
Subject: Re: max-src-conn-rate (Connection rate throttling per IP)
Date: Tue, 30 Aug 2005 15:03:11 +0200
Message-ID: <4314590F.7050804@toxicnet.de>
References: <200508301440.59667.benoit.panizzon@imp.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508301440.59667.benoit.panizzon@imp.ch>
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
To: Benoit Panizzon <benoit.panizzon@imp.ch>
Cc: netfilter@lists.netfilter.org

Benoit Panizzon wrote:
> Hi all
> 
> I'm looking for a way to prevent connection DOSing of specific services.
> 
> The goal is to count the connection rate per conneting ip and then reject 
> those connections if they pass a certain limit.
> 
> It looks like OpenBSD's pf is the only packet filter (except some commerctial 
> Firewalls) which has this ability.
> 
> The best I managed with iptables is to throttle the connection rate for a 
> specific port, but this of course affecs normal users trying to use that 
> service and does not change the fact of the service being DOSed.
> 
> The other possibility I found is to write my own userspace QUEUE target 
> connection rate tracker via the iptables api. But as I'm not a programmer and 
> I think this is a quite common request I just wonder:
> 
> Hasn't allready somebody written such a per source connection rate limmiter?
> 
> Is there a repository of different userspace QUEUE tools where I could find 
> something similar?
> 
> Regards

Uhm, why don't you just use features that are already built into 
iptables? Like the following:

iptables -I INPUT -i <interface> -p <protocol> --dport <port> -m state 
--state NEW -m recent --set
iptables -I INPUT -i <interface> -p <protocol> --dport <port> -m state 
--state NEW -m recent --update --seconds 60 --hitcount 3 -j DROP

Just exchange <interface>, <protocol> and <port> and maybe the timspan 
and hitcount. This will DROP incoming _new_ connections if they exceed 
the counter in a given timeframe. It will resume accepting _new_ 
connection requests from the given source ip address once the counter to 
timespan treshold does not get exceeded.

I use this to prevent simple scripts from bruteforcing my sshd.

Okay you might run into problems if people use forged source ip adresses 
since this would also block _new_ connection requests from this ip.

If someone has a smarter idea - let me know.

Regards,
Sascha

