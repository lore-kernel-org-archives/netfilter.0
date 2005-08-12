From: Pablo Neira <pablo@eurodev.net>
Subject: Re: Netfilter cluster / Invalid state problem
Date: Fri, 12 Aug 2005 03:43:49 +0200
Message-ID: <42FBFED5.9060501@eurodev.net>
References: <da73b3d905081110475176121@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <da73b3d905081110475176121@mail.gmail.com>
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
To: Pierre Westeel <pierre.westeel@gmail.com>
Cc: netfilter@lists.netfilter.org

Pierre Westeel wrote:
> I have a Linux netfilter cluster with keepalived to perform high avalaibility.
> The master runs a 2.6.12 kernel and the Backup runs a 2.4.26 kernel. (
> both from kernel.org without patch )
> 
> When I swap all the connections on the backup firewall with stopping
> keepalived daemon on master, the connections are correctly forwarded
> through the backup and I can see the new entry in
> /proc/net/ip_conntrack
> ( This is a VNC stream , the connexion is never Idle so the sequence
> number is increasing quickly )
> 
> BUT when i restart the keepalived daemon to make connection go back
> through the master firewall 30 seconds after the first swap, i get the
> following logs :
> 
> INVALID state -- DENY IN=eth0.730 OUT=eth0.732 SRC=172.18.130.194
> DST=10.24.247.253 LEN=46 TOS=0x00 PREC=0x00 TTL=126 ID=46274 DF
> PROTO=TCP SPT=1522 DPT=5901 WINDOW=17520 RES=0x00 ACK PSH URGP=

Try this:

# echo 1 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal

on the linux-2.6 box. See that later linux kernels 2.6 include TCP 
tracking active by default. Setting ip_conntrack_tcp_be_liberal to 1 
relaxes the in-window checkings. As you can figure out, if linux-2.6 
takes over, it won't know anything about the current active connections, 
so it will consider that they are invalid.

--
Pablo

