From: Mike <1100100@gmail.com>
Subject: NAT PREROUTING vs. filter FORWARD
Date: Thu, 19 Oct 2006 14:25:02 -0400
Message-ID: <8ca422820610191125k16f58f03t3ce33bd4e1d22c28@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

I'm having difficulty with clients connecting to a game I'm hosting
over the internet.
So I'm wondering if my PREROUTING rule is conflicting with my FORWARD rule.

If I have these prerouting rules:

 $IPTABLES -t nat -A PREROUTING -p tcp --dport 34297 -i ppp0 -j DNAT
--to-destination 192.168.170.6
$IPTABLES -t nat -A PREROUTING -p udp --dport 34297 -i ppp0 -j DNAT
--to-destination 192.168.170.6
$IPTABLES -t nat -A PREROUTING -p tcp --dport 34397 -i ppp0 -j DNAT
--to-destination 192.168.170.6
$IPTABLES -t nat -A PREROUTING -p udp --dport 34397 -i ppp0 -j DNAT
--to-destination 192.168.170.6
$IPTABLES -t nat -A PREROUTING -p tcp --dport 34447 -i ppp0 -j DNAT
--to-destination 192.168.170.6
$IPTABLES -t nat -A PREROUTING -p udp --dport 34447 -i ppp0 -j DNAT
--to-destination 192.168.170.6

Then I should not have to worry about these FORWARD rules interfering
with the prerouted data getting to the server at 192.168.170.6 ---

$IPTABLES -t filter -A FORWARD -i ppp0 -o eth1 -m state --state
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -t filter -A FORWARD -i ppp0 -o eth2 -m state --state
ESTABLISHED,RELATED -j ACCEPT

Am I right or wrong?
If wrong, is the only way then to change the FORWARD rule to -j ACCEPT
and leave out the ESTABLISHED,RELATED requirement?

Thanks for your time and assistance.

Mike

On 10/19/06, tarak@ossindia.com <tarak@ossindia.com> wrote:
> hello experts,
>
>               i have a problem in iptables, i want to customize the
> firewall. through iptable i want run a shell script which will keep an
> watch
> on each and every ip addresses in my organization, that how much amount
> of
> data downloading and uploading from those ip addresses...... seperately..
> is
> this possible to do,,,, if so please tell me how to do...
>
> thanks in advance
>
> Regards,
> Tarak Ranjan
>
>
>

