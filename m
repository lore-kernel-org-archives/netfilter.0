From: Gioele Barabucci <dev@gioelebarabucci.com>
Subject: Re: ESTABILISHED connections are not that estabilished
Date: Wed, 27 Jul 2005 20:52:26 +0200
Message-ID: <dc8l5h$qf8$1@sea.gmane.org>
References: <dc8blc$p5s$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Gioele Barabucci wrote:
> In my logs I often find reports of dropped input packets from my DNS:53 or
> dropped output packets generated from localhost:25 to other mail servers.
An example of the DNS issue. I think that the SMTP issue is identical.

This is what happens when I launch 

  $ dig -x 66.70.178.103
  ;; Warning: Message parser reports malformed message packet.
  ;; Truncated, retrying in TCP mode.
  ;; Connection to 209.51.143.76#53(209.51.143.76) for
103.178.70.66.in-addr.arpa. failed: connection refused.
  ;; Connection to 69.93.28.254#53(69.93.28.254) for
103.178.70.66.in-addr.arpa. failed: connection refused.

  iptables OUTPUT DROP IN= OUT=eth0 SRC=myIP DST=209.51.143.76 LEN=60
TOS=0x00 PREC=0x00 TTL=64 ID=2747 DF PROTO=TCP SPT=1025 DPT=53 WINDOW=5840
RES=0x00 SYN URGP=0 OPT (020405B40402080A00008F8F0000000001030301)
  iptables OUTPUT DROP IN= OUT=eth0 SRC=myIP DST=69.93.28.254 LEN=60
TOS=0x00 PREC=0x00 TTL=64 ID=8196 DF PROTO=TCP SPT=1026 DPT=53 WINDOW=5840
RES=0x00 SYN URGP=0 OPT (020405B40402080A00008FF40000000001030301)
  iptables OUTPUT DROP IN= OUT=eth0 SRC=myIP DST=209.51.143.76 LEN=60
TOS=0x00 PREC=0x00 TTL=64 ID=2749 DF PROTO=TCP SPT=1025 DPT=53 WINDOW=5840
RES=0x00 SYN URGP=0 OPT (020405B40402080A000090BB0000000001030301)
  iptables OUTPUT DROP IN= OUT=eth0 SRC=myIP DST=69.93.28.254 LEN=60
TOS=0x00 PREC=0x00 TTL=64 ID=8198 DF PROTO=TCP SPT=1026 DPT=53 WINDOW=5840
RES=0x00 SYN URGP=0 OPT (020405B40402080A000091200000000001030301)


but then
  $ dig netfilter.org
  ;; QUESTION SECTION:
  ;netfilter.org.                 IN      A
  
  ;; ANSWER SECTION:
  netfilter.org.          43200   IN      A       213.95.27.115

and iptables don't drop any packets.

Obviously I have these broad rules for output

iptables -A OUTPUT -p udp --dport nameserver -j ACCEPT
iptables -A OUTPUT -p tcp --dport nameserver -j ACCEPT

-- 
Gioele <dev@gioelebarabucci.com>


