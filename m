From: Sean <sean@helpbytes.co.uk>
Subject: Established Connections Timeout dropping to Unacknowledged Timeout
Date: Sun, 24 Feb 2013 15:13:43 +0000
Message-ID: <CADsND8yd6h+DgM1FuN4mrggJ49t5a+HRT2kb-6MiMB9_bjih+Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On my gateway I am seeing an odd situation in the nf_conntrack output.

I have this scenario:

192.168.1.101 (LAN client) <-> 192.168.1.1 (GATEWAY) <-> 1.2.3.4 (REMOTE server)

IP Masquerading is enabled on the gateway.  I have an established TCP
connection from 192.168.1.101 to an outside IP address, say 1.2.3.4,
sat mostly idle, except that for every 5 minutes the client wakes up
and sends a [PING]\r\n to the server, the other side sends a
[PING]\r\n back and that's it.  Viewing the details in Wireshark,
everything is ACKd.

However, in the nf_conntrack output, the timer resets to 300 seconds
after this little exchange, not 1800.  I don't understand this because
there is nothing unacknowledged?  Am I missing something here as to
why the timer does not reset to 1800?  (1800 is configured, as below)

Wireshark Summary:

109	5171.499249	192.168.1.101	1.2.3.4	TCP	62	51425 > mmcc [PSH, ACK]
Seq=392 Ack=506 Win=66224 Len=8
110	5171.577596	1.2.3.4	192.168.1.101	TCP	62	mmcc > 51425 [PSH, ACK]
Seq=506 Ack=400 Win=65792 Len=8
111	5171.618954	192.168.1.101	1.2.3.4	TCP	54	51425 > mmcc [ACK]
Seq=400 Ack=514 Win=66216 Len=0

cat /proc/net/nf_conntrack (after that last ACK occurred, and before
the next 5 minute wakeup)

ipv4     2 tcp      6 289 ESTABLISHED src=192.168.1.101 dst=1.2.3.4
sport=51425 dport=5050 packets=7 bytes=464 src=1.2.3.4
dst=83.100.201.147 sport=5050 dport=51425 packets=1 bytes=40 [ASSURED]
mark=0 use=2

# cat /proc/version
Linux version 2.6.32.32
# cat /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_unacknowledged
300
# cat /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_established
1800

Could anybody add any explanation?  The 5 minute timer in the client
application is not very accurate, and sometimes this comes a few
seconds late, there are rare scenarios the server sends something in
this few seconds and closes the connection because it doesn't make it
through the gateway (as the entry is no longer there).  Regardless of
this inaccurate timer though, if that was a 10 minute ping, this would
leave a 5 minute gap where if the server was to send a bit of data it
would break the connection.

Thanks,
Sean.
