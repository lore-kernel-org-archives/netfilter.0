From: =?UTF-8?B?QmrDtnJuIFNjaG1pZHQ=?= <bj-schmidt@uni-paderborn.de>
Subject: Re: state: INVALID
Date: Sun, 21 Nov 2004 00:18:21 +0100
Message-ID: <419FD0BD.6000906@uni-paderborn.de>
References: <419E75B1.3030406@uni-paderborn.de>
	<1100990773.3501.9.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1100990773.3501.9.camel@hubcap.ljm.dom>
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

Jason Opperisano wrote:
>>the ulogd logfile of my server shows many "INVALID state" packets. What could
>>be the reason for that?
> 
> my guess would be because you have a log rule that logs on "-m state
> --state INVALID"

Yes, of course. ;)

>>The server has one cardbus nic (eth0), one dsl-interface (ppp0) and, of course
>>lo. The client has only eth0 and lo. The kernel version of both computers is
>>2.6.10-rc2
>>
>>syslogemu.log:Nov 19 20:31:52 kilobyte INPUT_INVALID IN=eth0 OUT= 
>>MAC=00:d0:b7:01:ce:2a:00:04:e2:7f:90:41:08:00  SRC=192.168.0.2 DST=192.168.0.1 
>>LEN=52 TOS=00 PREC=0x00 TTL=64 ID=1680 DF PROTO=TCP SPT=32899 DPT=3130 
>>SEQ=4260699581 ACK=510793293 WINDOW=5080 ACK FIN URGP=0
 >
 > this is a FIN-ACK packet from the client to the server for an ICP
 > session.

Ooops, i picked exactly the entries from the log which are _really_ invalid.
Sorry for that (it was to late at night...).

Here is a(n older) packet that is _falsely_ classified as INVALID (should be
ESTABLISHED). I changed the IP-adress and hostname in the meantime:

Oct 29 13:51:05 skyron ILLEGAL_PACKET IN= OUT=eth0 MAC= SRC=192.168.1.1 
DST=192.168.1.2 LEN=60 TOS=00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=22 
DPT=33085 SEQ=1048000056 ACK=1050690244 WINDOW=5792 ACK SYN URGP=0

Besides I forgot to mention that i only get "false INVALID" states with
activated IPsec (esp in transport mode, kernel 2.6). With IPsec _AND_ iptables
it es NOT possible to establish a new tcp connection due to these "INVALID
state packets".
There is also a (german) thread at debian-users-german where we tried to solve 
this problem, without success:
  http://lists.debian.org/debian-user-german/2004/10/msg02735.html

> the definition of an INVALID packet is simply a packet that is neither
> ESTABLISHED nor RELATED.  depending on the specific communication in
> question and the timeout values on the firewall for the CLOSE-WAIT
> state--you can see a *ton* of FIN-ACK packets that will be considered
> "invalid" as they arrive after the firewall has removed the connection
> in question from conntrack.  port-unreachables should normally match as
> "related," but there could have been something funny going on.

-- 
Greetings
Bjoern Schmidt


