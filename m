From: Djalma Fadel Junior <fadel@ferasoft.com.br>
Subject: spoof attack
Date: Tue, 17 Feb 2004 19:46:49 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040217194649.25aae312.fadel@ferasoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

hi there,

I got the following log in my /var/messages:

----
zeus kernel: sp00f attempt: IN=eth0 OUT= MAC=00:04:75:a0:c8:51:00:c0:df:ee:1d:dd:08:00 SRC=192.168.0.189 DST=XXX.XXX.XXX.XXX LEN=1500 TOS=0x00 PREC=0x00 TTL=43 ID=17351 DF PROTO=TCP SPT=80 DPT=41971 WINDOW=57920 RES=0x00 ACK URGP=0
----

where:
       XXX.XXX.XXX.XXX is my public IP.
       eth0 is my EXTERNAL_DEVICE
       eth1 is my INTERNAL_DEVICE
       192.168.0.0/24 is my network

the attack duration was about 10 minutes. It happens 2 times in the last 3 months.


my firewall rules to prevent this are as below:

----
$iptables -A PREROUTING -t nat -i ${EXTERNAL_DEVICE} -s ${INTER_IPADDR} -j LOG --log-level ${LOGLEVEL} --log-prefix "sp00f attempt: "

$iptables -A PREROUTING -t nat -i ${EXTERNAL_DEVICE} -s ${INTER_IPADDR} -j DROP
----

My questions:

1) How to understand the MAC logged by iptables since MAC has 6 bytes long?
   00:04:75:a0:c8:51:00:c0:df:ee:1d:dd:08:00

2) Is there some way to get the real IP where its come from?

3) Are my rules enough to avoid spoof?



thanks in advance,

D. Fadel Jr.
Computing Science Student



