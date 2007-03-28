From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Multi ISP router/firewall ...
Date: Wed, 28 Mar 2007 19:15:23 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0703281911130.32661@yvahk01.tjqt.qr>
References: <3564089.276511175009558150.JavaMail.www@wwinf1504> 
	<1175061118.21066.34.camel@rayw.internal>
	<Pine.LNX.4.61.0703280816500.32661@yvahk01.tjqt.qr>
	<1175064190.21066.48.camel@rayw.internal>
	<1175084510.4084.4.camel@rayw.internal>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1175084510.4084.4.camel@rayw.internal>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ray Leach <spoons@rchq.co.za>
Cc: Netfilter <netfilter@lists.netfilter.org>


On Mar 28 2007 14:21, Ray Leach wrote:
>
>The problem was that reverse path filtering had to be enabled on the
>eth4 interface. All my other interfaces have reverse path filtering
>disabled, so what's the difference with this one?

I suspect something, hence please try

>> > >iptables -A FORWARD -i eth0 -p tcp --dport 80 -s 10.0.0.3 -j ACCEPT
>> > >iptables -A FORWARD -i eth4 -p tcp --sport 80 -d 10.0.0.3 -j ACCEPT
>> > >
>> > >iptables -A FORWARD -t mangle -p tcp --dport 80 -s 10.0.0.3 -j MARK
>> > >--set-mark 0x4

iptables -t mangle -A PREROUTING/FORWARD -i eth4 -p tcp --sport 80 -d 10.0.0.3
-j MARK --set-mark 0x4

with rp_filter=1 again.

I believe the reverse route stuff does not get it, because return packets are
not marked. Or, I'd also suggest

iptables -t mangle -A FORWARD -m conntrack --ctstate NEW
-s 10.0.0.3 -p tcp --dport 80 -j CONNMARK --set-mark 4;
iptables -t mangle -A FORWARD -j CONNMARK --restore-mark;

(Or use nat's PREROUTING for the initial CONNMARK - many ways of doing things)


Jan
-- 

