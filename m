From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: ACK,RST getting dropped in the firewall.
Date: Wed, 23 Jun 2004 07:32:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087990356.2064.47.camel@grendel>
References: <GHEILNONPACCGBGKBEKKKEAMCHAA.manikandan@manikandan.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <GHEILNONPACCGBGKBEKKKEAMCHAA.manikandan@manikandan.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: manikandan@manikandan.org
Cc: netfilter <netfilter@lists.netfilter.org>

On Wed, 2004-06-23 at 07:06, Manikandan wrote:
>
> Jun 23 16:42:43 javagreen kernel: New not syn:IN=eth0 OUT=
> MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=202.138.101.5
> DST=202.138.22.218 LEN=1500 TOS=0x00 PREC=0x00 TTL=122 ID=51601 DF PROTO=TCP
> SPT=80 DPT=2162 WINDOW=64574 RES=0x00 ACK URGP=0
> Jun 23 16:42:43 javagreen kernel: New not syn:IN=eth0 OUT=
> MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=202.138.101.5
> DST=202.138.22.218 LEN=1500 TOS=0x00 PREC=0x00 TTL=122 ID=51601 DF PROTO=TCP
> SPT=80 DPT=2162 WINDOW=64574 RES=0x00 ACK URGP=0

Seen this a lot. When ever I record a trace it ends up being the
following:
Three packet handshake is normal
Established state goes normally
Client issues a FIN/ACK
State table time-out drops to 2 minutes
Server still has data to send so continues to ACK
State table time-out expires
Server gets blocked at ACK or FIN/ACK stage, session never finishes

There is obviously data getting blocked (based on the packet size) but
I've never had a user complaint. 

> Jun 23 16:43:22 javagreen kernel: IPT INPUT packet died: IN=eth1 OUT=
> MAC=ff:ff:ff:ff:ff:ff:00:0d:60:40:99:db:08:00 SRC=0.0.0.0 DST=255.255.22.255
> LEN=340 TOS=0x00 PREC=0x00 TTL=128 ID=0 PROTO=UDP SPT=68 DPT=67 LEN=320

You are blocking bootp/DHCP traffic. Should not be a big deal.

> Jun 23 16:43:26 javagreen kernel: IPT INPUT packet died: IN=eth0 OUT=
> MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=4.78.20.2
> DST=202.138.22.218 LEN=84 TOS=0x00 PREC=0x00 TTL=41 ID=0 DF PROTO=ICMP
> TYPE=8 CODE=0 ID=58217 SEQ=55219
> Jun 23 16:43:26 javagreen kernel: IPT INPUT packet died: IN=eth0 OUT=
> MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=166.90.213.130
> DST=202.138.22.218 LEN=84 TOS=0x00 PREC=0x00 TTL=41 ID=0 DF PROTO=ICMP
> TYPE=8 CODE=0 ID=8475 SEQ=60480

You are blocking inbound Ping attempts. Nothing wrong with that. :)

HTH,
Chris



