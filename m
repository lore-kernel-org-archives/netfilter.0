From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Log question
Date: Mon, 7 Jun 2004 16:06:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406071606.37187.Antony@Soft-Solutions.co.uk>
References: <40C48126.9030003@whitehallcanada.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40C48126.9030003@whitehallcanada.com>
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

On Monday 07 June 2004 3:52 pm, Michael Sams wrote:

> Hi there... I am sorry if this questions has already been asked. I am
> try to understand some iptables logs. The one I have attached I don't
> really understand. Could someone point me in the right direction?
>
> Any help is greatly appreciated!
>
> 1.2.3.4 = My server
>
> Jun 7 02:23:48

Date & time - pretty obvious :)

> myserver

Your server's hostname.

> kernel:

Kernel log message

> INVALID STATE:

The string you specified for "log-prefix"

> IN=lo

Packet came in on loopback interface

> OUT=

Packet is not going to go out on any interface

> MAC=00:00:00:00:00:00

Destination MAC address is blank (loopback doesn't use it).

> :00:00:00:00:00:00:

Source MAC address is blank (loopback doesn't use it)

>08:00

Protocol is IP over ethernet

> SRC=1.2.3.4

Source IP address

> DST=1.2.3.4

Destination IP address

> LEN=68

Packet length including headers.

> TOS=0x00

Type Of Service flags not set (= 0000 0000)

> PREC=0xC0

Precedence bits = 1100 0000

> TTL=64

Time to live = 64: another 64 hops to go before the packet expires

> ID=13447

ICMP ID number = 13447

> PROTO=ICMP

This is an ICMP packet

> TYPE=3

ICMP type = 3 (Destination Unreachable)

> CODE=1

ICMP code = 1 (Host Unreachable)

> [SRC=1.2.3.4 DST=219.141.107.<snip> LEN=40 TOS=0x00 PREC=0x00 TTL=255
> ID=0 DF PROTO=TCP SPT=5554 DPT=4715 WINDOW=0 RES=0x00 ACK RST URGP=0 ]

Snippet of the original packet which this ICMP error is referring to (a TCP 
packet from 1.2.3.4 to 219.141.107.<snip>, from source port 5554 to 
destination port 4715, with the reset flag set, therefore something was 
obviously trying to terminate an already-established connection).

See http://logi.cc/linux/netfilter-log-format.php3 for more details on 
netfilter's logging format.

Regards,

Antony.

-- 
There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

                                                     Please reply to the list;
                                                           please don't CC me.


