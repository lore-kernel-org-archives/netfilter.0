From: "Jiwei Wang" <jiwei@taralnetworks.com>
Subject: Is it possible connecting to a forwarded port from inside the network?
Date: Sun, 16 Mar 2003 14:18:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!AAAAAO0Ci8RCKNNHt538Ob9jsx6kk0gA@taralnetworks.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_05AB_01C2EBC6.F7528EB0"
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

------=_NextPart_000_05AB_01C2EBC6.F7528EB0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

 

I'm using iptables on a RedHat 8.0 box to do firewalling and port
forwarding. The port-forwarding works perfectly when accessed from outside
my internal networks.   However, I cannot access the forwarded ports from
inside the network. 

 

I tried to use two IP addresses to do this. That is, I have public IP
addresses a.b.c.x and a.b.c.y both assigned to my Internet facing eth0; I
use a.b.c.x for SNAT and a.b.c.y for DNAT port forwarding (a.b.c.y:80 is
forwarded to an internal host port 80); from the Internet a.b.c.y:80 works
ok, but I still cannot access a.b.c.y:80 from any of my internal box.

 

This setup worked before with ipchains + ipvsadmin on Redhat 6.2.  

 

I'd appreciate any suggestions.

 

Jiwei


------=_NextPart_000_05AB_01C2EBC6.F7528EB0
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

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
AQAeAAaACCAGAAAAAADAAAAAAAAARgAAAABUhQAAAQAAAAUAAAAxMC4wAAAAAAsAB4AIIAYAAAAA
AMAAAAAAAABGAAAAAIKFAAABAAAACwAIgAggBgAAAAAAwAAAAAAAAEYAAAAABoUAAAAAAAADAAmA
CCAGAAAAAADAAAAAAAAARgAAAAABhQAAAAAAAEAAC4AIIAYAAAAAAMAAAAAAAABGAAAAAGCFAAAA
CNboKQAAAAsADoAIIAYAAAAAAMAAAAAAAABGAAAAAA6FAAAAAAAAAwAQgAggBgAAAAAAwAAAAAAA
AEYAAAAAGIUAAAAAAAAeAGmACCAGAAAAAADAAAAAAAAARgAAAACDhQAAAQAAABMAAAAwMzk1NjQ0
MDktMTYwMzIwMDMAAAIB+A8BAAAAEAAAAO0Ci8RCKNNHt538Ob9jsx4CAfoPAQAAABAAAADtAovE
QijTR7ed/Dm/Y7MeAgH7DwEAAABSAAAAAAAAADihuxAF5RAaobsIACsqVsIAAG1zcHN0LmRsbAAA
AAAATklUQfm/uAEAqgA32W4AAABDOlxKaXdlaVxvdXRsb29rXGN1cnJlbnQucHN0AAAAAwD+DwUA
AAADAA00/TcCAAIBFDQBAAAAEAAAAE5JVEH5v7gBAKoAN9luAAACAX8AAQAAADEAAAAwMDAwMDAw
MEVEMDI4QkM0NDIyOEQzNDdCNzlERkMzOUJGNjNCMzFFMjQ5NjQ4MDAAAAAAAwAGECyvTEcDAAcQ
LAIAAAMAEBAAAAAAAwAREAAAAAAeAAgQAQAAAGUAAABIRUxMTyxJTVVTSU5HSVBUQUJMRVNPTkFS
RURIQVQ4MEJPWFRPRE9GSVJFV0FMTElOR0FORFBPUlRGT1JXQVJESU5HVEhFUE9SVC1GT1JXQVJE
SU5HV09SS1NQRVJGRUNUTFlXAAAAAJiB

------=_NextPart_000_05AB_01C2EBC6.F7528EB0--


