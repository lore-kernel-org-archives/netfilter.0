From: Jason Opperisano <opie@817west.com>
Subject: Re: some iptable logs
Date: Tue, 05 Oct 2004 20:21:34 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097022094.1720.17.camel@wolfpack.ljm.dom>
References: <20041005235755.KYAS2497.mta9.adelphia.net@mail.adelphia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041005235755.KYAS2497.mta9.adelphia.net@mail.adelphia.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 2004-10-05 at 19:57, menonrr@adelphia.net wrote:
> Hello,
> 
> I am a new user of iptables. I implemnted logging on my INPUT, OUTPUT, and FORWARD chains. The result is hundreds of messages like these:
> 
> Entry 1:
> 
> Oct  5 10:12:04 nessusClient kernel: INPUT packets:IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1 LEN=65 TOS=0x00 PREC=0x00 TTL=64 ID=45019 DF PROTO=TCP SPT=33871 DPT=631 WINDOW=32767 RES=0x00 ACK PSH URGP=0

part of a connection from the local machine to the local machine on the
cupsd port (TCP 631)...  your firewall is a print server?

> Entry 2:
> 
> 
> Oct  5 10:12:04 nessusClient kernel: OUTPUT packetsIN= OUT=lo SRC=127.0.0.1 DST=127.0.0.1 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=45619 DF PROTO=TCP SPT=631 DPT=33871 WINDOW=32754 RES=0x00 ACK URGP=0 

the reply to the previous packet.

> Entry 3:
> 
> Oct  5 10:50:09 nessusClient kernel: INPUT eth1 Ext:IN=eth1
> OUT= MAC=ff:ff:ff:ff:ff:ff:00:08:74:ce:1a:21:08:00
> SRC=134.126.21.73 DST=255.255.255.255 LEN=68 TOS=0x00
> PREC=0x00 TTL=128 ID=13372 PROTO=UDP SPT=1053 DPT=7100 LEN=48

broadcast packet looking for a font server (xfs)

> My network is NOT a production network. There is very little activity form it. The firewall/gateway communicates to 192.16.18.0 and 172.16.4.0 through interface eth1.
> 
> I have 4 questions:
> 
> 1. How can I limit logging to all packets on eth0 (external) and eth1(internal) to and from 192.168.18.0, 172.16.4.0, and 192.168.1.10/the gatewat itself?

with various combinations of:

  -i eth0
  -i eth1
  -s 192.168.18.0/24
  -d 192.168.18.0/24
  -s 172.16.4.0/24
  -d 172.16.4.0/24

you could also employ "-i ! lo" and "-o ! lo" to filter out loopback
traffic (through you really should probably be accepting input/output
packets on lo)

> 2. What is a good log level?

depends where you want the messages to end up:  man 5 syslog.conf

6 seems to be a popular choice.

> 3. How can I limit syslog size so that my computer does not crash?

man 8 logrotate

> 4. How can I log the iptables to a different log file?

see answer to #2.

-j

-- 
Jason Opperisano <opie@817west.com>


