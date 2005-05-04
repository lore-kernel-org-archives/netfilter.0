From: "Ing. Rogelio Sevilla Fernandez" <sevilla@col.gob.mx>
Subject: Re: multiple SNAT
Date: Wed, 04 May 2005 02:33:39 -0500
Message-ID: <20050504023339.q77yvjqsu880go4s@mail.col.gob.mx>
References: <a0f69e5050504002326a08e85@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e5050504002326a08e85@mail.gmail.com>
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

I think you could get work that only using a static route to your servers on
192.168.50.x network via eth1




Quoting Askar <askarali@gmail.com>:

> hi,
> we have a netfilter iptables base gateway (NATing), doing SNAT.
>
> interfaces
>
> eth0: public ip + single alias for RFC 1918 (192.168.1.x)
> eth1: 192.168.50.3 (pvt)
>
> Our web,mail server also have  192.168.50.x subnet ips
>
> Now I want to SNAT the traffic to companies web server and mail via
> eth1 and the rest (Internet) via eth0.
> we are also MARKing port 80 traffic to send for our cache /proxy server.
>
> Portion from the iptables ruleset.
>
> #echo 200 cache.out >> /etc/iproute2/rt_tables
> #ip rule add fwmark 1 table cache.out
> #ip route add default via xxx.xxx.xxx.xx dev eth0 table cache.out
> #ip route flush cache
> ############Ip Tables Mangle For Above Rule####################
> # Mark all port 80
> iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 80 -j MARK 
> --set-mark 1
>
> # re mark port 80 towards company web server that by passing cache/server
> iptables -A PREROUTING -i eth0 -t mangle -p tcp -d xxx.xxx.xxx.xx -j
> MARK --set-mark 2
>
> # marking mail traffic to company mail server
> iptables -A PREROUTING -i eth0 -t mangle -p tcp -d xxx.xxx.xxx.xx -j
> MARK --set-mark 2
> #
>
>
> Regards
>
> Askar Ali
>
> --
> I love deadlines. I like the whooshing sound they make as they fly by.
> Douglas Adams
>
>
>



----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.


