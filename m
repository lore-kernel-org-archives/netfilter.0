From: "Rimas" <rmocius@auste.elnet.lt>
Subject: Port forward
Date: Thu, 21 Aug 2003 14:38:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008401c367e9$9eb77550$6e69690a@rimas>
References: <12CC60849165134FB7DF8570B621F4D558B079@mailxserver.euler.com> <20030819105849.GA30971@andrev.homeip.net>
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

Hi folks,

I have some strange problem with IP forwarding.

Recently I did my work Firewall clean update (migrated from RedHat to
Slackware kernel 2.4.21 with the same configuration like RedHat) and after
this
does not work forward of IP 47 (gre) and tcp 1723 (PPTP) to local network.

The error messages you can see below:

tcpdump -i eth0 | grep pptp
tcpdump: listening on eth0
21:02:09.046791 client_Linux_box_server.3801 > server_Linux_box.pptp: S
2100045603:2100045603(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)
21:02:09.047301 server_Linux_box.pptp > client_Linux_box_server.3801: S
3455313091:3455313091(0) ack 2100045604 win 64240 <mss 1460,nop,nop,sackOK>
(DF)
21:02:09.096249 client_Linux_box_server.3801 > server_Linux_box.pptp: P
1:157(156) ack 1 win 64240: pptp CTRL_MSGTYPE=SCCRQ PROTO_VER(1.0)
FRAME_CAP(A) BEARER_CAP(A) MAX_CHAN(0) FIRM_REV(2600) [|pptp] (DF)
21:02:09.096561 server_Linux_box.pptp > client_Linux_box_server.3801: P
1:157(156) ack 157 win 64084: pptp CTRL_MSGTYPE=SCCRP PROTO_VER(1.0)
RESULT_CODE(1) ERR_CODE(0) FRAME_CAP(S) BEARER_CAP(DA) MAX_CHAN(0)
FIRM_REV(2195) [|pptp] (DF)
21:02:09.144887 client_Linux_box_server.3801 > server_Linux_box.pptp: P
157:325(168) ack 157 win 64084: pptp CTRL_MSGTYPE=OCRQ CALL_ID(49152)
CALL_SER_NUM(26411) MIN_BPS(300) MAX_BPS(100000000) BEARER_TYPE(Any)
FRAME_TYPE(E) RECV_WIN(64) PROC_DELAY(0) PHONE_NO_LEN(0) [|pptp] (DF)
21:02:09.146488 server_Linux_box.pptp > client_Linux_box_server.3801: P
157:189(32) ack 325 win 63916: pptp CTRL_MSGTYPE=OCRP CALL_ID(999)
PEER_CALL_ID(49152) RESULT_CODE(1) ERR_CODE(0) CAUSE_CODE(0)
CONN_SPEED(13277755) RECV_WIN(16384) PROC_DELAY(0) PHY_CHAN_ID(0) (DF)
21:02:11.489923 client_Linux_box_server.3801 > server_Linux_box.pptp: P
157:325(168) ack 157 win 64084: pptp CTRL_MSGTYPE=OCRQ CALL_ID(49152)
CALL_SER_NUM(26411) MIN_BPS(300) MAX_BPS(100000000) BEARER_TYPE(Any)
FRAME_TYPE(E) RECV_WIN(64) PROC_DELAY(0) PHONE_NO_LEN(0) [|pptp] (DF)
21:02:11.490227 server_Linux_box.pptp > client_Linux_box_server.3801: . ack
325 win 63916 (DF)
21:02:11.569977 server_Linux_box.pptp > client_Linux_box_server.3801: P
157:189(32) ack 325 win 63916: pptp CTRL_MSGTYPE=OCRP CALL_ID(999)
PEER_CALL_ID(49152) RESULT_CODE(1) ERR_CODE(0) CAUSE_CODE(0)
CONN_SPEED(13277755) RECV_WIN(16384) PROC_DELAY(0) PHY_CHAN_ID(0) (DF)
21:02:11.618680 client_Linux_box_server.3801 > server_Linux_box.pptp: P
325:349(24) ack 189 win 64052: pptp CTRL_MSGTYPE=SLI PEER_CALL_ID(999)
SEND_ACCM(0xffffffff) RECV_ACCM(0xffffffff) (DF)
21:02:11.788688 server_Linux_box.pptp > client_Linux_box_server.3801: . ack
349 win 63892 (DF)
21:02:48.756981 client_Linux_box_server.3801 > server_Linux_box.pptp: P
349:365(16) ack 189 win 64052: pptp CTRL_MSGTYPE=CCRQ CALL_ID(49152) (DF)
21:02:48.975669 server_Linux_box.pptp > client_Linux_box_server.3801: . ack
365 win 63876 (DF)
21:02:49.758111 client_Linux_box_server.3801 > server_Linux_box.pptp: P
365:381(16) ack 189 win 64052: pptp CTRL_MSGTYPE=StopCCRQ REASON(1) (DF)
21:02:49.758413 server_Linux_box.pptp > client_Linux_box_server.3801: P
189:205(16) ack 381 win 63860: pptp CTRL_MSGTYPE=StopCCRP RESULT_CODE(1)
ERR_CODE(0) (DF)
21:02:49.798872 client_Linux_box_server.3801 > server_Linux_box.pptp: F
381:381(0) ack 205 win 64036 (DF)
21:02:49.799120 server_Linux_box.pptp > client_Linux_box_server.3801: F
205:205(0) ack 382 win 63860 (DF)
21:02:49.833800 client_Linux_box_server.3801 > server_Linux_box.pptp: . ack
206 win 64036 (DF)





Any ideas?



Thanks in advance





Remus






