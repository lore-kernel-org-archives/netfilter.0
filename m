From: "Luis Fernando Barrera" <luba@assist.com.gt>
Subject: strange drop packets
Date: Thu, 7 Nov 2002 10:44:47 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NABBIDJPNCAGKGOFGHBFEEHHPIAA.luba@assist.com.gt>
References: <3607.192.168.7.41.1036626850.squirrel@iw.k1k2.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3607.192.168.7.41.1036626850.squirrel@iw.k1k2.com>
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
To: netfilter@lists.netfilter.org

Hi all,


I have the following rules in a Red Hat 7.3 box with 512 MB RAM:


echo "SMTP Inbound..."
iptables -A INPUT  -i eth0 -p tcp --dport 25 -m state --state
NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 25 -m state --state
BLISHED     -j ACCEPT

echo "SMTP Outbound..."
iptables -A OUTPUT -o eth0 -p tcp --dport 25 -m state --state
NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT  -i eth0 -p tcp --sport 25 -m state --state
BLISHED     -j ACCEPT


I use them to allow incoming SMTP connections to the SMTP server and allow
the SMTP server to send email...
Since I put in the log all the dropped Packets, I've seen the following
messages:

------------------------------------------------------------------------
Nov  6 10:13:31 <IP address> kernel: DROP packet:IN= OUT=eth0 SRC=<linux IP
address> DST=<another IP Address> LEN=44 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF
PROTO=TCP SPT=25 DPT=0 WINDOW=5840 RES=0x00 ACK SYN URGP=0

Nov  6 10:13:31 <IP address> kernel: DROP packet:IN= OUT=eth0 SRC=<linux IP
address> DST=<another IP Address> LEN=44 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF
PROTO=TCP SPT=25 DPT=0 WINDOW=5837 RES=0x00 ACK PSH FIN URGP=0

-------------------------------------------------------------------------

As you all can see, the first message is a dropped packet with the ACK and
SYN flags set, so it means it is
an packet in respond to a communication start request, right?

The second message is a dropped packet with the ACK PSH FIN flags set, so it
meas it is a packet
in a respond to a communication finish request, right?

Since those two types of packets are allowed by the rules... why are they
being dropped? Is this some
kind of attack? or maybe it is the "timer" in the connection tracking
system, that expired, so the linux
kernel considered those two packets as invalid?

Those type of drop packet messages appear regulary, about 30-40 in the day.
All the communications
seem working, so I don't understand the messages. And you can notice that
the packets are both outgoing
packets from the Linux server to some other server....


Again, thank you all in advance.


Luis Fernando Barrera
luba@assist.com.gt







