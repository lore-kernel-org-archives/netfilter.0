From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: FTP Connection problems.
Date: Wed, 25 Aug 2004 10:14:28 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512D7@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Here you are ...
>
> tcpdump.firewall.log
>
> 15:59:24.071217 IP 192.168.124.1.32796 > 192.168.125.1.ftp: S
> 3496999441:3496999441(0) win 5840 <mss 1460,sackOK,timestamp
> 16200055[|tcp]>
> 15:59:24.072144 arp who-has 192.168.124.1 tell pix1
> 15:59:24.072464 arp reply 192.168.124.1 is-at 00:50:ba:e2:a9:ed
> 15:59:24.072499 IP 192.168.125.1.ftp > 192.168.124.1.32796: S
> 4161421847:4161421847(0) ack 3496999442 win 5792 <mss
> 1460,sackOK,timestamp 1692753[|tcp]>
> 15:59:24.072847 IP 192.168.124.1.32796 > 192.168.125.1.ftp: . ack 1 =
win
> 5840 <nop,nop,timestamp 16200057 1692753>
> 15:59:34.085569 IP 192.168.125.1.ftp > 192.168.124.1.32796: P 1:66(65)
> ack 1 win 5792 <nop,nop,timestamp 1693755 16200057>
> 15:59:34.085984 IP 192.168.124.1.32796 > 192.168.125.1.ftp: . ack 66 =
win
> 5840 <nop,nop,timestamp 16210073 1693755>
>
> tcpdump.ftp.log
>
> 15:52:48.574738 192.168.124.1.32796 > iptables.ftp: S
> 3496999441:3496999441(0) win 5840 <mss 1460,sackOK,timestamp 16200055
> 0,nop,wscale 0>
> 15:52:48.574908 arp who-has 192.168.125.240 tell iptables
> 15:52:48.575204 arp reply 192.168.125.240 is-at 0:30:4f:5:74:39
> 15:52:48.575226 iptables.ftp > 192.168.124.1.32796: S
> 4161421847:4161421847(0) ack 3496999442 win 5792 <mss
> 1460,sackOK,timestamp 1692753 16200055,nop,wscale 0> (DF)
> 15:52:48.576318 192.168.124.1.32796 > iptables.ftp: . ack 1 win 5840
> <nop,nop,timestamp 16200057 1692753>
> 15:52:48.597025 iptables.33254 > 192.168.124.1.auth: S
> 4154447273:4154447273(0) win 5840 <mss 1460,sackOK,timestamp 1692755
> 0,nop,wscale 0> (DF)
> 15:52:51.587881 iptables.33254 > 192.168.124.1.auth: S
> 4154447273:4154447273(0) win 5840 <mss 1460,sackOK,timestamp 1693055
> 0,nop,wscale 0> (DF)

IDENT request...bingo...

iptables -I FORWARD -p tcp --syn --dport 113 -j REJECT --reject-with =
tcp-reset

-j

