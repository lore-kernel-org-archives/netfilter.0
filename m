From: "Hwang, Byoung Woo" <bwh@net-safe.co.kr>
Subject: RE: TCM MSS control over OUTPUT chain
Date: Sat, 3 May 2003 20:18:28 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c31165$b8cfc8a0$100aa8c0@bwhwangnotepc>
References: <20030503053155.GA27503@floyd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030503053155.GA27503@floyd>
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

Hi,
The machine where I want to try to control the size of TCP MSS
is a gateway. eth0 is connected to the internal lan which use
virtual IPs and eth1 is connected to ADSL modem and uses PPPOE.
After the command "iptables -A OUTPUT -p tcp --tcp-flags SYN,RST SYN -j
TCPMSS --set-mss 1400"
packets from gateway itself to outside are controlled on TCP MSS size
but
packets from Internal LAN to Internet which are NATed by Masquerading
are
not controlled on TCP MSS size.
I have a reason why I cannot control on FORWARD chain.

Please, help

Reguards,

Hwang, Byoung Woo.
-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Julian Gomez
Sent: Saturday, May 03, 2003 2:32 PM
To: netfilter@lists.netfilter.org
Subject: Re: TCM MSS control over OUTPUT chain

On Sat, May 03, 2003 at 11:36:53AM +0900, Hwang, Byoung Woo spoke
thusly:
>Hi, all
>I tried to control the size of TCP MSS but failed by
>following command. I have a reason to contorl TCP MSS size on OUPUT
>chain
>not FORWARD chain.
>
>iptables -A OUTPUT -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss
>1400

Works fine for me, on a RH errata 2.4.18-27.8.0 kernel, all patched up.

iptables -A OUTPUT -p tcp --tcp-flags SYN,RST SYN -j TCPMSS \
--set-mss 700

wget http://www.kernel.org/pub/linux/kernel/v2.4/linux-2.4.0.tar.gz

[root@floyd sysconfig]# tcpdump -i ppp0 -n -vvv port 80 and host
www.kernel.org
tcpdump: listening on ppp0

13:19:38.943278 219.94.59.140.33071 > 204.152.189.116.http: S [tcp sum
ok]
3437729883:3437729883(0) win 5808 <mss 700,sackOK,timestamp 919615
0,nop,wscale 0> (DF) (ttl 64, id 36964, len 60)

13:19:39.183301 204.152.189.116.http > 219.94.59.140.33071: S [tcp sum
ok]
3432899063:3432899063(0) ack 3437729884 win 5792 <mss
1412,sackOK,timestamp
141630295 919615,nop,wscale 0> (DF) (ttl 53, id 0, len 60)

[ snip the rest of 3-way handshake output gibberish ]

13:19:39.499854 204.152.189.116.http > 219.94.59.140.33071: .
689:1377(688)
ack 142 win 5792 <nop,nop,timestamp 141630322 919639> (DF) (ttl 53, id
64152, len 740)

The above is return traffic from kernel.org -> my PPPoE connection.
Based
on another tcpdump trace from another webserver download, I am presuming
the 12 bytes difference (700-688 bytes) is actually overhead (PPPoE ?).

References : Section 18.4 Maximum Segment Size; TCP/IP Illustrated,
Volume
             1, Richard Stevens.



