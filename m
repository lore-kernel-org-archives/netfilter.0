From: Jason Opperisano <opie@817west.com>
Subject: Re: Transparent gateway
Date: Thu, 18 Nov 2004 08:41:51 -0500
Message-ID: <1100785310.3848.20.camel@hubcap.ljm.dom>
References: <419C7FE2.8060002@mattiamartinello.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <419C7FE2.8060002@mattiamartinello.com>
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

On Thu, 2004-11-18 at 05:56, Mattia Martinello wrote:
> Hi,
> 
> I'm using a netfilter gateway between my LAN and the server on the DMZ.
> This gateway makes a DNAT from 192.168.1.* to the external IP of the 
> server on the DMZ.

why?

> Then, if I call http://[my external IP], the gateway makes a DNAT to 
> http://192.168.20.x (the internal DMZ IP of the server), through the 
> 192.168.20.254 interface.

because you told it to...

> The problem is that when I call Apache on the server, Apache thinks that 
> I am 192.168.20.254, not 192.168.1.x.
> So, in the access logs the connection is made from the DMZ interface of 
> the gateway and not from the real IP address of the client.
> This make me some real problems about client autentication.
> 
> How I can I get my gateway transparent and solve this problem to let 
> Apache to write the correct IP address of the client in the logs?

don't NAT traffic from your LAN to your DMZ.  if clients inside the LAN
are requesting the public IP of the DMZ server and not it's actual DMZ
IP, you'll need something along the lines of:

  iptables -t nat -A PREROUTING -i ${INSIDE_IF} -s ${INSIDE_NET} \
    -d ${WEBSRV_PUB_IP} -j DNAT --to-destination ${WEB_SRV_DMZ_IP}

and make sure your outbound SNAT/MASQ for the internal net specifies the
external interface:

  iptables -t nat -A POSTROUTING -o ${OUTSIDE_IF} -s ${INSIDE_NET} \
    -j SNAT --to-source ${OUTSIDE_IP}

other than that--you haven't provided near enough information to answer
your questions (hint:  post your rules [1])

-j

[1] iptables -t mangle -vnxL && iptables -t nat -vnxL && iptables -vnxL

--
"You must be the man who didn't know whether it was a blister or
 a boil.
 It was a gummi bear."
	--The Simpsons


