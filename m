From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: TCM MSS control over OUTPUT chain
Date: Sat, 3 May 2003 13:31:55 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030503053155.GA27503@floyd>
References: <000101c3111c$db9d9540$100aa8c0@bwhwangnotepc>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000101c3111c$db9d9540$100aa8c0@bwhwangnotepc>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sat, May 03, 2003 at 11:36:53AM +0900, Hwang, Byoung Woo spoke thusly:
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

13:19:38.943278 219.94.59.140.33071 > 204.152.189.116.http: S [tcp sum ok]
3437729883:3437729883(0) win 5808 <mss 700,sackOK,timestamp 919615
0,nop,wscale 0> (DF) (ttl 64, id 36964, len 60)

13:19:39.183301 204.152.189.116.http > 219.94.59.140.33071: S [tcp sum ok]
3432899063:3432899063(0) ack 3437729884 win 5792 <mss 1412,sackOK,timestamp
141630295 919615,nop,wscale 0> (DF) (ttl 53, id 0, len 60)

[ snip the rest of 3-way handshake output gibberish ]

13:19:39.499854 204.152.189.116.http > 219.94.59.140.33071: . 689:1377(688)
ack 142 win 5792 <nop,nop,timestamp 141630322 919639> (DF) (ttl 53, id
64152, len 740)

The above is return traffic from kernel.org -> my PPPoE connection. Based
on another tcpdump trace from another webserver download, I am presuming
the 12 bytes difference (700-688 bytes) is actually overhead (PPPoE ?).

References : Section 18.4 Maximum Segment Size; TCP/IP Illustrated, Volume
             1, Richard Stevens.

