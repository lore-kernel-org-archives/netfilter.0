From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Squid Accelerator configuration
Date: Mon, 19 Jul 2004 20:47:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407192047.35337.Antony@Soft-Solutions.co.uk>
References: <OF8F6F0E05.8BF4196D-ON85256ED6.00672FE3-85256ED6.006AAB99@banquo.mc.duke.edu >
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF8F6F0E05.8BF4196D-ON85256ED6.00672FE3-85256ED6.006AAB99@banquo.mc.duke.edu >
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

On Monday 19 July 2004 8:25 pm, Jim Matthews wrote:

> Reposting with some more information.  I've set iptables to drop-n-log bad
> packets and here's what I'm getting when I try and connect to my squid
> server.
> I'm not sure why these packets are being dropped as my rules are setup to
> allow and forward connections to port 80.  I'm not sure why port 113 is in
> the mix.

TCP port 113 is the ident service - servers connect back to port 113 at the 
client to get information about the client attempting to connect.

Some ident clients (running on the server being accessed) don't really care 
whether they get an answer or not; others require *some* sort of answer, even 
if it's essentially useless (however, a firewall which simply drops packets 
with no response whatever will upset such clients and possibly deny access to 
the service being requested).

> 192.168.1.1 - squidbox
> 192.168.1.5 - backend WWW server
> 192.168.1.205 - testing box/client
>
> Jul 19 15:18:19 squidbox kernel: drop-n-log:IN= OUT=eth0 SRC=192.168.1.1
> DST=192.168.1.205 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP
> SPT=43600 DPT=113 WINDOW=5840 RES=0x00 SYN URGP=0

Squid machine sends ident request to client.

> Jul 19 15:18:19 squidbox kernel: drop-n-log:IN= OUT=eth0 SRC=192.168.1.1
> DST=192.168.1.5 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=54027 DF PROTO=TCP
> SPT=43601 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0

Squid machine sends http request to web server.

> Jul 19 15:18:19 squidbox kernel: drop-n-log:IN= OUT=eth0 SRC=192.168.1.1
> DST=192.168.1.5 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=54028 DF PROTO=TCP
> SPT=43595 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0

Squid server sends another http request to the web server - same time stamp 
suggest this is a simultaneous request, rather than a repeat of the previous 
one.

> Jul 19 15:18:22 squidbox kernel: drop-n-log:IN= OUT=eth0 SRC=192.168.1.1
> DST=192.168.1.205 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP
> SPT=43600 DPT=113 WINDOW=5840 RES=0x00 SYN URGP=0

Squid server sends another ident request to the client machine.   The fact 
that the time stamp is 3 seconds after the last request, and the source ports 
are the same, indicate that this is a repeat of the last packet (which must 
therefore not have been replied to)

> Jul 19 15:18:22 squidbox kernel: drop-n-log:IN= OUT=eth0 SRC=192.168.1.1
> DST=192.168.1.5 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=54027 DF PROTO=TCP
> SPT=43601 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0

Squid server sends a repeat http request to the web server; again the 3 second 
delay and the duplicated source port identifies this as a repeat packet 
rather than a new one.

> Jul 19 15:18:24 squidbox kernel: drop-n-log:IN= OUT=eth0 SRC=192.168.1.1
> DST=192.168.1.205 LEN=1423 TOS=0x00 PREC=0x00 TTL=64 ID=33313 DF PROTO=TCP
> SPT=80 DPT=42536 WINDOW=6432 RES=0x00 ACK PSH FIN URGP=0

Squid server decides to close the connection to the client which made the 
initial request on port 80.

> Jul 19 15:18:28 squidbox kernel: drop-n-log:IN= OUT=eth0 SRC=192.168.1.1
> DST=192.168.1.205 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP
> SPT=43600 DPT=113 WINDOW=5840 RES=0x00 SYN URGP=0

Squid server retries once more to get an answer on ident from the client.

> Jul 19 15:18:28 squidbox kernel: drop-n-log:IN= OUT=eth0 SRC=192.168.1.1
> DST=192.168.1.5 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=54027 DF PROTO=TCP
> SPT=43601 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0

Squid server still tries to connect to the web server on port 80.

> Jul 19 15:18:41 squidbox kernel: drop-n-log:IN= OUT=eth0 SRC=192.168.1.1
> DST=192.168.1.5 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=54027 DF PROTO=TCP
> SPT=43601 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0

Repeat of the last packet above.

> Jul 19 15:18:45 squidbox kernel: drop-n-log:IN= OUT=eth0 SRC=192.168.1.1
> DST=192.168.1.205 LEN=1423 TOS=0x00 PREC=0x00 TTL=64 ID=33332 DF PROTO=TCP
> SPT=80 DPT=42539 WINDOW=6432 RES=0x00 ACK PSH URGP=0

Finally a reply to the client from port 80.

> Jul 19 15:18:45 squidbox kernel: drop-n-log:IN= OUT=eth0 SRC=192.168.1.1
> DST=192.168.1.205 LEN=1423 TOS=0x00 PREC=0x00 TTL=64 ID=33332 DF PROTO=TCP
> SPT=80 DPT=42539 WINDOW=6432 RES=0x00 ACK PSH FIN URGP=0

Squid server closes the connection to the client (presumably after having said 
"no luck").

Regards,

Antony.

-- 
"Black holes are where God divided by zero."

 - Steven Wright

                                                     Please reply to the list;
                                                           please don't CC me.


