From: Brad Tilley <rtilley@vt.edu>
Subject: Re: Logging the whole packet
Date: Tue, 23 Nov 2004 21:26:09 -0500
Message-ID: <41A3F141.2040706@vt.edu>
References: <41A3B0A4.9020906@vt.edu>
	<20041123221206.GA3476@bender.817west.com>
	<41A3DFFC.2090109@vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41A3DFFC.2090109@vt.edu>
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

Brad Tilley wrote:

> Jason Opperisano wrote:
>
>> On Tue, Nov 23, 2004 at 04:50:28PM -0500, Brad Tilley wrote:
>>  
>>
>>> Is it possible to log the packet body and not just the header?
>>>
>>> Currently I have this line in my iptables start-up file:
>>>
>>> /sbin/iptables -I INPUT -p tcp -s ! 128.173.120.79 -d 
>>> 128.173.120.79  -j LOG --log-prefix="Packet_Filter:"
>>>
>>> And it generates log entries such as this:
>>>
>>> Nov 23 16:44:28 athop1 kernel: Packet_Filter:IN=eth0 OUT= 
>>> MAC=00:30:6e:5e:a2:0c:00:d0:01:ab:44:00:08:00 SRC=64.81.214.131 
>>> DST=128.173.120.79 LEN=48 TOS=0x00 PREC=0x00 TTL=110 ID=29621 DF 
>>> PROTO=TCP SPT=60366 DPT=445 WINDOW=16384 RES=0x00 SYN URGP=0
>>>
>>> I'd like to capture the packet body as well. I'm new to packet 
>>> logging so forgive me if I'm over looking the obvious.
>>>   
>>
>>
>> AFAIK, the normal LOG target cannot actually do this.  instead, use the
>> ULOG target which will copy the entire packet to the userspace ulogd
>> daemon where you can use the ulogd_PCAP.so plugin to create a tcpdump
>> file of the packets you are interested in.  check out:
>>
>>  http://gnumonks.org/gnumonks/projects/project_details?p_id=1
>>
>> for more details about ulogd.
>>
>> HTH...
>>
>> -j
>>
>> -- 
>> "Television! Teacher, mother, secret lover."
>>        --The Simpsons
>>
>>
>>  
>>
> Thanks, that works great. I had to recompile the kernel to get ULOG 
> support, but other than that, it's rather straightforward. I added 
> this line to my iptables startup script:
>
> /sbin/iptables -I INPUT -p tcp -s ! 128.173.120.79 -d 128.173.120.79 
> -j ULOG --ulog-prefix "Packet_Filter:"
>
> I'm using the  /usr/lib/ulogd/ulogd_OPRINT.so plugin to write the 
> packet capture to a file for now. Here's a sample of what it looks like:
>
> ===>PACKET BOUNDARY
> tcp.fin=0
> tcp.syn=1
> tcp.rst=0
> tcp.psh=0
> tcp.ack=0
> tcp.urg=0
> tcp.window=64240
> tcp.ackseq=0
> tcp.seq=4245420361
> tcp.dport=445
> tcp.sport=2797
> ip.fragoff=16384
> ip.id=11011
> ip.csum=2618
> ip.ihl=5
> ip.totlen=48
> ip.ttl=111
> ip.tos=0
> ip.protocol=6
> ip.daddr=128.173.120.79
> ip.saddr=63.231.157.167
> oob.out=
> oob.in=eth0
> oob.mark=0
> oob.time.usec=213408
> oob.time.sec=1101257132
> oob.prefix=Packet_Filter:
> raw.pktlen=48
> raw.pkt=raw.mac=00:30:6e:5e:a2:0c:00:d0:01:ab:44:00:08:00
>
> Now, all I need to do is figure out what's in the packet body. Any 
> pointers on that? Ideally I'd like to write a script that recreates 
> keystrokes from packets that contain ssh session info. Probably 
> off-topic here, but I thought I'd ask. Thanks for the ULOG tip!
>
>
>
I figured it out. BTW, I meant telnet sessions, not ssh... didn't want 
y'all to think I'm a complete idiot.

Brad


