From: Rodolfo Siviero Stein <rstein@persogo.com.br>
Subject: Strange Problem - IPTables or Hardware related ????
Date: Fri, 18 Oct 2002 11:56:31 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.1.6.0.20021018113106.00a91488@webmail.persogo.com.br>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

	Hello Guys,

	I have a strange problem here that I want to share with you.

	Here it is:

	I have three NICS
	eth0 -> LAN  HWaddr 00:06:29:2E:EA:1C
	eth1 -> DMZ  HWaddr 00:A0:C9:9E:A0:7C
	eth2 -> INTERNET   HWaddr 00:50:DA:27:5A:41

	Kernel 2.4.19
	iptables v1.2.7a-20021015
	patch-o-matic-20021015 ( with pending patches applied )

	in the eth2  I have several IPs  assigned thru ifconfig running inside the 
rc.local file.

	I am receiving packets from the internet, destined to one of the aliases 
of the ETH2 as if they come from the LAN.  See the log tha follows:

Oct 13 08:42:43 firewall kernel: IP_LAN_BLOCKED:IN=eth0 OUT= 
MAC=00:06:29:2e:ea:1c:00:b0:c2:89:9d:a1:08:00 SRC=216.81.218.193 
DST=200.XXX.XXX.58 LEN=48 TOS=0x00 PREC=0x00 TTL=112 ID=2388 DF PROTO=TCP 
SPT=4928 DPT=1080 SEQ=2076289920 ACK=0 WINDOW=64240 RES=0x00 SYN URGP=0 OPT 
(020405B401010402)
Oct 13 08:46:43 firewall kernel: IPT_LAN_BLOCKED:IN=eth0 OUT= 
MAC=00:06:29:2e:ea:1c:00:b0:c2:89:9d:a1:08:00 SRC=210.113.239.50 
DST=200.XXX.XXX.51 LEN=48 TOS=0x00 PREC=0x00 TTL=109 ID=64046 DF PROTO=TCP 
SPT=2542 DPT=80 SEQ=3750889304 ACK=0 WINDOW=16384 RES=0x00 SYN URGP=0 OPT 
(020405B401010402)

	How a packet from internet appears to me as "IN=eth0" ????

	In the OUT=  we have an MAC address where the initial part is the ETH0 
mac.  What is the other numbers ?
	
	The machine is a IBM Netfinity 3000  with an etherexpress pro lan onboard, 
and 2 3com 3x59x boards.  And if I take out the eth0 RJ-45 cable, all the 
others NICs  stop working.

	I have tried several iptables releases in the branch 1.2.6 thu 1.2.7a.

	Anyone had a problem like this ?  Any comments ?  Is this hardware related 
or software ?

	I will appreciate some ideas.

	Thx

	Rodolfo


