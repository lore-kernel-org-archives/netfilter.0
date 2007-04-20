From: Kiran Murari <kmurari@embeddedinfotech.com>
Subject: Re: NAT Issue
Date: Fri, 20 Apr 2007 16:38:32 +0530
Message-ID: <46289F30.9030800@embeddedinfotech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

  Hi,
> > 
> > My setup is as shown below.
> > PC--------Router---------ISP
> > 
> > I established a connection with the ISP (PPP link) and I am pinging 
> > google.com from LAN side host.
> > Now if I disable WAN
>   

What do you mean exactly ?

I have an option of enabling/disabling the WAN interface from the WEB interface of the Router.

> > (leave the ping running) and then enable it, the 
> > session does not resume.
>   

What session ?

The PING session which was running earlier, does not resume after my WAN is up


> > The SNAT rules are in place.
> > # iptables -t nat -L POSTROUTING -n -v
> > Chain POSTROUTING (policy ACCEPT 13927 packets, 458K bytes)
> > pkts bytes target     prot opt in     out      source           destination
> >    0     0   SNAT     all  --  *      ppp0     0.0.0.0/0        
> > 0.0.0.0/0      to:xx:xx:xx:xx
>   

Is the public address fixed or can it change at each PPP connection ?

The public IP can be configured for both static and dynamic addresses.


> > # cat /proc/net/ip_conntrack | grep icmp
> > icmp     1 29 src=yy:yy:yy:yy dst=64.233.167.99 type=8 code=0 id=16446 
> > packets=575 bytes=48300 [UNREPLIED]
> > src=yy:yy:yy:yy dst=192.168.10.100 type=0 code=0 id=16446 packets=0 
> > bytes=0 mark=0 use=1
> > yy:yy:yy:yy being the IP address of the LAN host.
>   

I doubt that the source address of the expected reply is the LAN host 
address. What is 192.168.10.100 ?


It's my mistake in putting the conntrack entry.... :(
The correct entry is

# cat /proc/net/ip_conntrack | grep icmp
icmp     1 29 src=yy:yy:yy:yy dst=64.233.167.99 type=8 code=0 id=16446 
packets=575 bytes=48300 [UNREPLIED]
src=64.233.167.99 dst=yy:yy:yy:yy type=0 code=0 id=16446 packets=0 
bytes=0 mark=0 use=1

yy:yy:yy:yy being the IP address of the LAN host.


After little bit of experimenting, I could see that if I flush all the conntrack entries,
as soon as my WAN is enabled, the PING session continued.

But flushing all the conntrack entries, doesn't look like a feasible one.

Is there a way to flush the conntrack entries that have been created during a specific interval.

Any thoughts.

Thanks,
Kiran


