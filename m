From: "Chris Partsenidis" <Chris@globetechsolutions.com>
Subject: Understanding the Forward and Postrouting chain
Date: Tue, 15 Apr 2003 12:52:04 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <PFEDLCHOEGFHBPOGGFGBGEMCCAAA.Chris@globetechsolutions.com>
Reply-To: <Chris@globetechsolutions.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0000_01C3034D.D0E9E360"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0000_01C3034D.D0E9E360
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Greetings everyone,

While building a complex set a rules for my firewall I have stumbbled
accross a few problems and would like to know if there is anyone to help me
clear a few things in my mind.

If I was to set the Forward chain default policy to DROP, what rules would I
be required to enter in order to allow e.g my internal network hosts to
telnet anywhere on the internet ?

For example take this setup:

LAN -----------------FIREWALL------------------------ Internet
192.168.1.0/24		 public ip: 200.0.0.1
				
In this simple setup, my guess is that Im required to create 3 rules for the
telnet to work.
One for the packets travelling from the Lan to the firewall, one for the
oppisite (internet to the firewall) and then one more
for the postrouting chain to masquerade the packets. Here is what I've done:

1) iptables -P FORWARD DROP
2) iptables -A FORWARD -s 192.168.1.0/24 -p tcp -d 0/0 --dport 23 -j ACCEPT
3) iptables -A FORWARD -p tcp -s 0/0 --sport 23 -d  200.0.0.1 -j ACCEPT
4) iptables -A POSTROUTING -t nat -s 192.168.1.0/24 -p tcp -d 0/0 --dport 23
-j MASQUERADE

Would this be correct, and if not, can you please explain why. I'm not to
sure if loading ip_conntrack would eliminate the need for rule no. 3.

Regards, 

Chris Partsenidis

------=_NextPart_000_0000_01C3034D.D0E9E360
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

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
AAAAAABGAAAAAIKFAAABAAAAAgH4DwEAAAAQAAAAqTzL0gZy9UOyfu9r1DRjEwIB+g8BAAAAEAAA
AKk8y9IGcvVDsn7va9Q0YxMCAfsPAQAAAJ8AAAAAAAAAOKG7EAXlEBqhuwgAKypWwgAAUFNUUFJY
LkRMTAAAAAAAAAAATklUQfm/uAEAqgA32W4AAABDOlxEb2N1bWVudHMgYW5kIFNldHRpbmdzXEFk
bWluaXN0cmF0b3JcTG9jYWwgU2V0dGluZ3NcQXBwbGljYXRpb24gRGF0YVxNaWNyb3NvZnRcT3V0
bG9va1xvdXRsb29rLnBzdAAAAwD+DwUAAAADAA00/TcAAAIBfwABAAAAPAAAADxQRkVETENIT0VH
RkhCUE9HR0ZHQkdFTUNDQUFBLkNocmlzQGdsb2JldGVjaHNvbHV0aW9ucy5jb20+AAMABhAYwyNW
AwAHEOUDAAADABAQAAAAAAMAERAAAAAAHgAIEAEAAABlAAAAR1JFRVRJTkdTRVZFUllPTkUsV0hJ
TEVCVUlMRElOR0FDT01QTEVYU0VUQVJVTEVTRk9STVlGSVJFV0FMTElIQVZFU1RVTUJCTEVEQUND
Uk9TU0FGRVdQUk9CTEVNU0FORFdPVQAAAABqEA==

------=_NextPart_000_0000_01C3034D.D0E9E360--


