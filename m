From: ASHISH <ashishis@gmail.com>
Subject: Re: --limit 5/m doesn't work
Date: Wed, 23 Mar 2005 13:51:24 +0530
Message-ID: <558224e305032300217c4772c9@mail.gmail.com>
References: <000001c52f53$ed3f3220$1500a8c0@itasam>
	<558224e30503222255158832bc@mail.gmail.com>
Reply-To: ASHISH <ashishis@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <558224e30503222255158832bc@mail.gmail.com>
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

The rule that you have mentioned will "Accept" the first five matches.
This does not specify any condition  about dropping the packets. And
after first five packets each second, rest packets will not match this
rule, so they will jump to next rule. In order to drop these packets
(your desire as per your mail),  the next rule should be used to drop
them. Take a look at this example :-

$IPTABLES -A icmp_packets -p icmp --icmp-type 8 -m limit --limit
6/minute --limit-burst 5 -j ACCEPT
$IPTABLES -A icmp_packets -p icmp --icmp-type 8 -j DROP

A combination of these two rules will help you in your cause. The
second rule drop all the packets that fail the first rule.

These type of confusions can be better analysed by logging the packets
with some preferred prefix.

Hope it helps you.

On Wed, 23 Mar 2005 09:56:35 +0700, Andy Samuel <anci@centrin.net.id> wrote:
> Dear All
>
> I have this rule :
> iptables -A INPUT -i eth0 -m limit --limit 5/m --limit-burst 5 -j ACCEPT
>
> When I tried to ping my Linux box from a Windows box, :
> ping -t 192.168.12.1
>
> The reply always come within less than 1 ms.
> I'm actually expecting many timeouts because iptables would drop my
> package, but the reply always come within less than 1 ms and no timeouts
> at all.
> Am I expecting something wrong ?
>
> Thank you all in advance.
> Andy
>
>

--
cheers
Ashish


-- 
cheers
Ashish

