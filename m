From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: More gateways in the same subnet
Date: Sun, 27 Mar 2005 20:16:26 +0300
Message-ID: <3063e505032709164a601ff8@mail.gmail.com>
References: <4245FB01.6080204@oom-killer.org>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <4245FB01.6080204@oom-killer.org>
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
To: Kevin de Kok <kevin@oom-killer.org>
Cc: netfilter@lists.netfilter.org

echo 100 isp1 >> /etc/iproute2/rt_tables
echo 101 isp2 >> /etc/iproute2/rt_tables

ip ro add 192.168.1.0/24 dev eth1 table isp1
ip ro add 192.168.1.0/24 dev eth3 table isp2
ip ro add <isp1_subnet_link> dev eth0 table isp1
ip ro add <isp2_subnet_link> dev eth2 table isp2

if ISP1 gave you the 1.2.3.4ip, then <isp1_subnet_link> will be
1.2.3.0/24 , or whatever the netmask may be. Now do:

ip ro add default via <isp1_gw> table isp1
ip ro add default via <isp2_gw> table isp2

also

ip ro add default via <whatever_isp_gw_you_want> if you happen not to
have a default gateway

and last;

ip rule add from 192.168.1.0/24 iif dev eth1 table isp1
ip rule add from 192.168.1.0/24 iif dev eth3 table isp2

Hopefully it will work :)
One problem will be if both ethernet cards will reply to some ap
query, so even a client choose 192.168.1.1 as a gateway, the traffic
may come on eth3.



On Sun, 27 Mar 2005 01:14:57 +0100, Kevin de Kok <kevin@oom-killer.org> wrote:
> Hi,
> 
> I have a linux router in my lan with two nic's to two isp's and i also
> have two nic's for the lan. I have on eth0 the ip from ISP1 on eth2 the
> ip from ISP2 on eth1 i have 192.168.1.1 and on eth3 i have 192.168.1.2.
> What i'am trying to is when i give 192.168.1.1 as gateway on a client in
> my  lan then the traffic go's over ISP1 and when i give  as gateway
> 192.168.1.2 that the traffic go's over ISP2. How can i manage this?
> 
> 


-- 
Bla bla

