From: "Jason Neurohr" <Jason.Neurohr@uniqueworld.net>
Subject: PPTP issue
Date: Mon, 6 Nov 2006 10:38:26 +1100
Message-ID: <4D82EB5486E2904A912F7A3A2089B54801683979@sydexch.sydney.uw.local>
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


Hello, trying to connect to pptp server through linux iptables firewall.
I have the ip_conntrack_pptp and ip_nat_pptp modules loaded. Anyone know
what the below means and how to fix it?

20:10:28.569271 IP pptpserver.pptp > xxxxxxxx.4131: . ack 349 win 8820
20:10:28.569322 IP xxxxxxxx > pptpserver: GREv1, call 0, seq 0, ack 1,
length 38: LCP, Conf-Request (0x01), id 0, length 20
20:10:28.569471 IP xxxxxxxx > pptpserver: GREv1, call 0, seq 1, length
45: LCP, Conf-Ack (0x02), id 34, length 31
20:10:28.574955 IP pptpserver > xxxxxxxx: GREv1, call 4131, ack 1,
no-payload, length 12
20:10:30.569253 IP xxxxxxxx > pptpserver: GREv1, call 0, seq 2, length
34: LCP, Conf-Request (0x01), id 1, length 20
20:10:30.902135 IP pptpserver > xxxxxxxx: GREv1, call 4131, ack 2,
no-payload, length 12
20:10:31.036259 IP pptpserver > xxxxxxxx: GREv1, call 4131, seq 2,
length 34: LCP, Conf-Ack (0x02), id 1, length 20
20:10:31.074693 IP xxxxxxxx.4131 > pptpserver.pptp: P 349:373(24) ack
189 win 65347: pptp CTRL_MSGTYPE=3DSLI PEER_CALL_ID(0)
SEND_ACCM(0x000a0000) RECV_ACCM(0xffffffff)
20:10:31.168891 IP pptpserver.pptp > xxxxxxxx.4131: . ack 373 win 8820
20:10:31.175664 IP xxxxxxxx > pptpserver: GREv1, call 0, ack 2,
no-payload, length 12
20:10:31.180676 IP pptpserver > xxxxxxxx: GREv1, call 4131, seq 3,
length 48: CHAP, Challenge (0x01), id 2, Value
bf1e69be064b99fd81c1810a9d05b0e5, Name 192.168.10.22
20:10:31.219988 IP xxxxxxxx > pptpserver: GREv1, call 0, seq 3, ack 3,
length 55: CHAP, Response (0x02), id 2, Value
50e507db3f5f8330dc3622846e7ffbb3, Name aaa__aaaaaaa
20:10:31.249508 IP pptpserver > xxxxxxxx: GREv1, call 4131, seq 4, ack
3, length 64: CHAP, Fail (0x04), id 2, Msg CHAP authentication failure,
unit 578938[|chap]
20:10:31.250493 IP pptpserver > xxxxxxxx: GREv1, call 4131, seq 5,
length 20: LCP, Term-Request (0x05), id 35, length 6
20:10:31.294624 IP xxxxxxxx.4131 > pptpserver.pptp: P 373:397(24) ack
189 win 65347: pptp CTRL_MSGTYPE=3DSLI PEER_CALL_ID(0)
SEND_ACCM(0xffffffff) RECV_ACCM(0xffffffff)
20:10:31.296630 IP xxxxxxxx > pptpserver: GREv1, call 0, seq 4, ack 5,
length 24: LCP, Term-Ack (0x06), id 35, length 6
20:10:31.368868 IP pptpserver.pptp > xxxxxxxx.4131: . ack 397 win 8820
20:10:31.407057 IP xxxxxxxx.4131 > pptpserver.pptp: P 397:413(16) ack
189 win 65347: pptp CTRL_MSGTYPE=3DCCRQ CALL_ID(4131)
20:10:31.412502 IP pptpserver.pptp > xxxxxxxx.4131: P 189:337(148) ack
413 win 8820: pptp CTRL_MSGTYPE=3DCDN CALL_ID(0) RESULT_CODE(3)
ERR_CODE(0) CAUSE_CODE(0) [|pptp]
20:10:31.451146 IP xxxxxxxx.4131 > pptpserver.pptp: P 413:429(16) ack
337 win 65199: pptp CTRL_MSGTYPE=3DStopCCRQ REASON(1)
20:10:31.455487 IP pptpserver.pptp > xxxxxxxx.4131: P 337:353(16) ack
429 win 8820: pptp CTRL_MSGTYPE=3DStopCCRP RESULT_CODE(1) ERR_CODE(0)
20:10:31.456444 IP pptpserver.pptp > xxxxxxxx.4131: F 353:353(0) ack 429
win 8820
20:10:31.494050 IP xxxxxxxx.4131 > pptpserver.pptp: F 429:429(0) ack 353
win 65183
20:10:31.494672 IP xxxxxxxx.4131 > pptpserver.pptp: . ack 354 win 65183
20:10:31.499242 IP pptpserver.pptp > xxxxxxxx.4131: F 353:353(0) ack 430
win 8820

My website -- https://www.whitehat.net.au Alternate --
https://linux.dnsdojo.net=20


