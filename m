From: Tim Evans <tkevans@tkevans.com>
Subject: SUMMARY: Log Entries with multiple PROTO fields?
Date: Thu, 25 Mar 2004 17:53:49 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403252253.i2PMrnCO007979@osprey.tkevans.com>
Reply-To: Tim Evans <tkevans@tkevans.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-MD5: GX39qiisA29QMgSHQbgM2Q==
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org, markee@bandwidthco.com, raymondl@knowledgefactory.co.za

Thanks to Mark for his explanation, and to Ray Leach for a similar one.
========================
>X-POP3-Rcpt: tkevans@tkevans.com
>From: "Mark E. Donaldson" <markee@bandwidthco.com>
>To: <tkevans@tkevans.com>, <netfilter@lists.netfilter.org>
>Subject: RE: Log Entries with multiple PROTO fields?
>Date: Wed, 17 Mar 2004 19:14:25 -0800
>Thread-Index: AcQMKygn/FZrUlcTSZO3QHxcViaAMAAa0D/w
>X-Bandwidthco-MailScanner-Information: Please contact the ISP for more 
information
>X-Bandwidthco-MailScanner: Found to be clean
>X-Bandwidthco-MailScanner-SpamScore: s
>X-Spam-Checker-Version: SpamAssassin 2.63 (2004-01-11) on osprey.tkevans.com
>X-Spam-Level: *
>X-Spam-Status: No, hits=1.0 required=5.0 tests=MSGID_FROM_MTA_HEADER, 
UPPERCASE_25_50 autolearn=no version=2.63
>
>These packets are ICMP error messages and this is the behavior that results
>from them.  ICMP error messages consist of the ICMP packet itself, plus they
>quote the IP Header and first 8 bytes of the message that generated the
>error in the first place.  Hence, you duplicate protocol fields.  In this
>case, you have ICMP type 11 code 0 error messages, which are TTL exceeded in
>transit messages.  This is typical of someone running a trace route.
>However, since the original messages were TCP, and not UDP or ICMP, this
>could be a crafted TCP trace route of some type.
>
>-----Original Message-----
>From: netfilter-admin@lists.netfilter.org
>[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Tim Evans
>Sent: Wednesday, March 17, 2004 6:11 AM
>To: netfilter@lists.netfilter.org
>Subject: Log Entries with multiple PROTO fields?
>
>What do these kind of log message mean?  Note there are two PROTO fields:
>
>Mar  8 08:19:43 kernel: IPT OUT_ICMP: IN= OUT=eth1 SRC=x.x.x.xDST=x.x.x.
>.x LEN=76 TOS=0x00 PREC=0xC0 TTL=64 ID=54844 PROTO=ICMP TYPE=11 CODE=0
>[SRC=x.x.x.x DST=x.x.x.x LEN=48 TOS=0x00 PREC=0x00 TTL=1 ID=0 DF PROTO=TCP
>SPT=110 DPT=4312 WINDOW=5840 RES=0x00 ACK SYN URGP=0 ]
>
>Mar  8 09:24:14 kernel: IPT OUT_ICMP: IN= OUT=eth1 SRC=x.x.x.xDST=x.x.x.x
>  LEN=80 TOS=0x00 PREC=0xC0 TTL=64 ID=24045 PROTO=ICMP TYPE=11 CODE=0
>[SRC=x.x.x.x DST=x.x.x.x LEN=52 TOS=0x00 PREC=0x00 TTL=1 ID=27964 DF
>PROTO=TCP SPT=80 DPT=60884 WINDOW=57920 RES=0x00 ACK FIN URGP=0 ]
>
>
>
>--
>Tim Evans, TKEvans.com, Inc.    |    5 Chestnut Court
>tkevans@tkevans.com             |    Owings Mills, MD 21117
>http://www.tkevans.com/         |    443-394-3864
>http://www.come-here.com/News/  |    
>

Tim Evans, TKEvans.com, Inc.	|    5 Chestnut Court
tkevans@tkevans.com		|    Owings Mills, MD 21117
http://www.tkevans.com/		|    443-394-3864
http://www.come-here.com/News/	|    


