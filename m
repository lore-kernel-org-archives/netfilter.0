From: Jason Opperisano <opie@817west.com>
Subject: Re: udp port forwarding from internal network to internet
Date: Thu, 27 Jan 2005 09:37:07 -0500
Message-ID: <1106836627.5784.28.camel@hubcap.ljm.dom>
References: <20050127143101.19462.qmail@web30905.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050127143101.19462.qmail@web30905.mail.mud.yahoo.com>
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

On Thu, 2005-01-27 at 09:31, Kevin Van Workum wrote: 
> >   # adjust these to suit
> >   INT_IF=eth1

is the internal interface of the firewall machine

> >   EXT_IF=eth0

is the external interface of the firewall machine

> >   EXT_IP=`ip -4 -o addr sh $EXT_IF | awk '{print
> > $4}' | cut -d"/" -f1`

is the external ip address of the firewall machine

> >   SRV_IP=1.2.3.4

is the IP address of the server on the internet you're trying to connect
to

> >   SRV_PORT=1111

is the UDP port you're trying to connect to on the server on the
internet

> >   iptables -A FORWARD -m state --state
> > ESTABLISHED,RELATED -j ACCEPT

allows the replies to established connections and related connections
and error messages through the FORWARD chain of the firewall
 
> >   iptables -A FORWARD -i $INT_IF -o $EXT_IF -p udp
> > -d $SRV_IP \
> >     --dport $SRV_PORT -j ACCEPT

allows packets arriving inbound on the internal interface destined for
the udp port on the server on the internet to be forwarded through the
firewall
 
> >   iptables -t nat -A POSTROUTING -o $EXT_IF -j SNAT
> > --to-source $EXT_IP

translates the source IP of packets exiting the firewall to the external
IP address of the firewall.
 
> Thanks. Just so I understand what I'm doing here.
> SVR_IP is the IP of the server on the internet that my
> app on my internal network is conntacting? 

yup.

> What is the effect of these rules?
> Can you explain in english what these rules mean?
> What IP does my app connect to, the internal IP of my
> server with the internet connection?

nope--the IP of the server on the internet.

-j

--
"Homer no function beer well without."
	--The Simpsons


