From: Wladimir Mutel <mwg@mwg.dp.ua>
Subject: Asymmetric/reverse NAT q :
Date: Mon, 27 Jun 2005 19:37:50 +0300
Message-ID: <20050627163750.GA5984@mwg.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

	Hi,

	We have quite complicated network setup.

	(1) Windows server with private IP.

	(2) Linux NAT box with two interfaces, private and
	public, that translates outgoing Windows (1) traffic to its 
	public Inet IP. It should serve as back channel (outgoing) 
	in satellite reception. And it seems it serves this purpose 
	well enough. (there is just -j MASQUERADE rule on 
	'nat'/PREROUTING chain)

	(3) satellite reception terminal that bridges
	incoming satellite packets to the specified Ethernet mac address
	through its outgoing Ethernet port. And here is the problem.
	Returned packets have destination IP equal to the public IP of 
	NAT box (2). They could not be streamed back to Windows (1)
	directly.

	So we decided to bring in (4) Linux host for reverse 
	NAT from satellite terminal (3) to Windows (1). But then an unpleasant
	feature was discovered: 'nat' PREROUTING chain is used only in
	initial TCP/IP packets. So, the first syn packet coming from
	Windows (1) through NAT box (2) gets translated well; but then 
	syn/ack	reply coming from satellite terminal (3) does not get 
	translated back by (4).

	The main complication is that (1), (3) and (4) are near, but (2)
	which have ISP connection for back-channel is far from them and
	could not be brought close enough. Were our back-channel ISP and
	satellite reception point in one place, I would not have this
	problem at all.

	And so, dear people, I want to ask your advise. How to get
	through this situation ? Should I use ct_sync, or ebtables, or
	what else ? Is there a hack to mark incoming packets as 'new' while 
	they are not ? Is it possible to force 'nat'/PREROUTING chain to 
	do DNAT on incoming packets that are not 'new' ?

	Thank you in advance for your replies. Hope some of you had
	solved similar problems.

