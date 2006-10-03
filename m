From: "Jason Neurohr" <Jason.Neurohr@uniqueworld.net>
Subject: PPTP ISSUE
Date: Tue, 3 Oct 2006 13:41:26 +1000
Message-ID: <4D82EB5486E2904A912F7A3A2089B548015455CE@sydexch.sydney.uw.local>
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

Hello,=20

We are having a problem with a pptp connection from internal
workstations to a remote pptp server through linux firewall running
iptables.

Tcp dump on the firewall shows this:

[root@firewall ~]# tcpdump host 203.41.135.162
tcpdump: verbose output suppressed, use -v or -vv for full protocol
decode
listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
13:23:55.604900 IP ourip.1648 > 203.41.135.162.1723: S
3351021274:3351021274(0) win 65535 <mss 1260,nop,nop,sackOK>
13:23:55.611369 IP 203.41.135.162.1723 > ourip.1648: S
3618448323:3618448323(0) ack 3351021275 win 8820 <mss 1460>
13:23:55.617619 IP ourip.1648 > 203.41.135.162.1723: P 1:157(156) ack 1
win 65535: pptp CTRL_MSGTYPE=3DSCCRQ PROTO_VER(1.0) FRAME_CAP(A)
BEARER_CAP(A) MAX_CHAN(0) FIRM_REV(2600) [|pptp]
13:23:55.624110 IP 203.41.135.162.1723 > ourip.1648: P 1:157(156) ack
157 win 8820: pptp CTRL_MSGTYPE=3DSCCRP PROTO_VER(1.0) RESULT_CODE(1)
ERR_CODE(0) FRAME_CAP(AS) BEARER_CAP(DA) MAX_CHAN(100) FIRM_REV(1)
[|pptp]
13:23:55.630607 IP ourip.1648 > 203.41.135.162.1723: P 157:325(168) ack
157 win 65379: pptp CTRL_MSGTYPE=3DOCRQ CALL_ID(16384) =
CALL_SER_NUM(58240)
MIN_BPS(300) MAX_BPS(100000000) BEARER_TYPE(Any) FRAME_TYPE(E)
RECV_WIN(64) PROC_DELAY(0) PHONE_NO_LEN(0) [|pptp]
13:23:55.636850 IP 203.41.135.162.1723 > ourip.1648: P 157:189(32) ack
325 win 8820: pptp CTRL_MSGTYPE=3DOCRP CALL_ID(0) PEER_CALL_ID(16384)
RESULT_CODE(1) ERR_CODE(0) CAUSE_CODE(0) CONN_SPEED(100000000)
RECV_WIN(3) PROC_DELAY(0) PHY_CHAN_ID(0)
13:23:55.638724 IP 203.41.135.162 > ourip: call 16384 seq 1
gre-ppp-payload
13:23:55.780617 IP ourip.1648 > 203.41.135.162.1723: . ack 189 win 65347
13:23:55.784488 IP ourip.1648 > 203.41.135.162.1723: P 325:349(24) ack
189 win 65347: pptp CTRL_MSGTYPE=3DSLI PEER_CALL_ID(0)
SEND_ACCM(0xffffffff) RECV_ACCM(0xffffffff)
13:23:55.871054 IP 203.41.135.162.1723 > ourip.1648: . ack 349 win 8820
13:23:58.986263 IP 203.41.135.162 > ourip: call 16384 seq 2
gre-ppp-payload
13:24:01.919107 IP 203.41.135.162 > ourip: call 16384 seq 3
gre-ppp-payload
13:24:04.851702 IP 203.41.135.162 > ourip: call 16384 seq 4
gre-ppp-payload
13:24:07.787543 IP 203.41.135.162 > ourip: call 16384 seq 5
gre-ppp-payload
13:24:10.988065 IP 203.41.135.162 > ourip: call 16384 seq 6
gre-ppp-payload
13:24:13.917661 IP 203.41.135.162 > ourip: call 16384 seq 7
gre-ppp-payload
13:24:16.849381 IP 203.41.135.162 > ourip: call 16384 seq 8
gre-ppp-payload
13:24:19.782475 IP 203.41.135.162 > ourip: call 16384 seq 9
gre-ppp-payload
13:24:22.981124 IP 203.41.135.162 > ourip: call 16384 seq 10
gre-ppp-payload
13:24:25.897355 IP 203.41.135.162.1723 > ourip.1648: P 189:337(148) ack
349 win 8820: pptp CTRL_MSGTYPE=3DCDN CALL_ID(0) RESULT_CODE(3)
ERR_CODE(0) CAUSE_CODE(0) [|pptp]
13:24:25.903600 IP ourip.1648 > 203.41.135.162.1723: P 349:365(16) ack
337 win 65199: pptp CTRL_MSGTYPE=3DStopCCRQ REASON(1)
13:24:25.910471 IP 203.41.135.162.1723 > ourip.1648: P 337:353(16) ack
365 win 8820: pptp CTRL_MSGTYPE=3DStopCCRP RESULT_CODE(1) ERR_CODE(0)
13:24:25.910596 IP 203.41.135.162.1723 > ourip.1648: F 353:353(0) ack
365 win 8820
13:24:25.916715 IP ourip.1648 > 203.41.135.162.1723: F 365:365(0) ack
354 win 65183
13:24:25.921213 IP 203.41.135.162.1723 > ourip.1648: . ack 366 win 8820

25 packets captured
25 packets received by filter
0 packets dropped by kernel

Any help with this would be greatly apprectiated.


Regards

Jason Neurohr

------------------------------------------------------------------------
------------------
Jason Neurohr | Network Engineer | PH 02 8001 7777 |
https://www.whitehat.net.au


