From: israel Gold <rhglaw1@barak.net.il>
Subject: RE: Logging the whole packet
Date: Wed, 24 Nov 2004 13:03:33 +0200
Message-ID: <000001c4d215$3d4cb540$939a5a3e@il.sangate.com>
References: <20041123221206.GA3476@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <20041123221206.GA3476@bender.817west.com>
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

Jason Opperisano wrote:

>>AFAIK, the normal LOG target cannot actually do this.  instead, use
the ULOG target which will copy the entire packet to the
>>userspace ulogd daemon where you can use the ulogd_PCAP.so plugin to
create a tcpdump file of the packets you are 
>>interested in.

I also would like to log the packet data. In fact, I would like to
monitor NFS Write calls.
However, using ULOG and copying all packets to user space is time
consuming. 
I have no interest in Read calls which is most of the traffic.
Does iptables provide a tool to filtering packets by looking at the data
?

Thanks,
Israel   

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jason
Opperisano
Sent: Wednesday, November 24, 2004 12:12 AM
To: netfilter@lists.netfilter.org
Subject: Re: Logging the whole packet


On Tue, Nov 23, 2004 at 04:50:28PM -0500, Brad Tilley wrote:
> Is it possible to log the packet body and not just the header?
> 
> Currently I have this line in my iptables start-up file:
> 
> /sbin/iptables -I INPUT -p tcp -s ! 128.173.120.79 -d 128.173.120.79  
> -j
> LOG --log-prefix="Packet_Filter:"
> 
> And it generates log entries such as this:
> 
> Nov 23 16:44:28 athop1 kernel: Packet_Filter:IN=eth0 OUT=
> MAC=00:30:6e:5e:a2:0c:00:d0:01:ab:44:00:08:00 SRC=64.81.214.131 
> DST=128.173.120.79 LEN=48 TOS=0x00 PREC=0x00 TTL=110 ID=29621 DF 
> PROTO=TCP SPT=60366 DPT=445 WINDOW=16384 RES=0x00 SYN URGP=0
> 
> I'd like to capture the packet body as well. I'm new to packet logging
> so forgive me if I'm over looking the obvious.

AFAIK, the normal LOG target cannot actually do this.  instead, use the
ULOG target which will copy the entire packet to the userspace ulogd
daemon where you can use the ulogd_PCAP.so plugin to create a tcpdump
file of the packets you are interested in.  check out:

  http://gnumonks.org/gnumonks/projects/project_details?p_id=1

for more details about ulogd.

HTH...

-j

--
"Television! Teacher, mother, secret lover."
        --The Simpsons


