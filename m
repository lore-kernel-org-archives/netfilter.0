From: "Robert LeBlanc" <robert@leblancnet.us>
Subject: Target SAME not working
Date: Thu, 19 Jul 2007 08:13:14 -0600
Message-ID: <BBDDF0B7CFFFCE4FB5110F0A37CE6003E77E@q.leblancnet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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


I've set-up a NAT pool using SAME with the -nodst option and it works
well, but every now and then it seems to cough and not function
correctly. A user is trying to sign into sharepoint services using port
80 and most of the traffic comes from the same source IP address and
then it changes source IP for abouta dozen packets then goes back to the
original source IP address. I think this is causing a failure during the
login process.

Stock Debian kernel 2.6.18-4-686 (etch)
iptables v1.3.6

22:35:27.127468 IP 65.121.23.28.80 > 67.128.39.174.4303: F 2129:2129(0)
ack 597 win 64940 <nop,nop,timestamp 6747637 698698053>
22:35:27.127530 IP 67.128.39.174.4303 > 65.121.23.28.80: . ack 2130 win
1092 <nop,nop,timestamp 698698060 6747637>
22:35:27.128368 IP 67.128.39.134.1430 > 65.121.23.28.80: S
3143683502:3143683502(0) win 5840 <mss 1460,sackOK,timestamp 698698060
0,nop,wscale 3>
22:35:27.143836 IP 65.121.23.28.80 > 67.128.39.134.1430: S
1823111154:1823111154(0) ack 3143683503 win 16384 <mss 1460,nop,wscale
0,nop,nop,timestamp 0 0,nop,nop,sackOK>
22:35:27.143911 IP 67.128.39.134.1430 > 65.121.23.28.80: . ack 1 win 730
<nop,nop,timestamp 698698064 0>

Thanks,
Robert


