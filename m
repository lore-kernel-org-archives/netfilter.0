From: Helge Jensen <helge.jensen@slog.dk>
Subject: trouble with RTCP dst-address with ip_conntrack_sip, ip_nat_sip and
 RTCP to non-SIP address
Date: Wed, 15 Nov 2006 20:02:36 +0100
Message-ID: <455B644C.4060404@slog.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I have a linux-box doing NAT and I have tried to setup ip_conntrack_sip
 to be able to dynamicly use soft-phones from inside the NAT.

However, it seems that there *might* be a bug when the RTCP connections.
This prevents me from using the cheap (and nerdy) musimi.dk as my VoIP
provider :(

I get an INVITE from 87.54.25.114, with Connection Information "IN IP4
87.54.25.116", and without ip_conntrack_sip the Receiver report goes to
87.54.25.116, but with ip_conntrack_sip it goes to 87.54.25.114 (the SIP
conversation address)

I have included the relevant wireshark dumps of the relevant packages below.

I have complete logs of all network traffic, including the login process
if that's interesting?

=============== Without ip_conntrack_sip: ==============================

----------------- The INVITE -------------------------------------------
--- connect-info + media-description on G.711U: 87.54.25.116 port 12126:

No.     Time        Source                Destination           Protocol
Info
    188 27.955558   87.54.25.114          85.81.159.186         SIP/SDP
 Request: INVITE
sip:36947299@85.81.159.186:20280;rinstance=a731cc86fcd93577, with
session description

Frame 188 (918 bytes on wire, 918 bytes captured)
    Arrival Time: Nov 15, 2006 19:25:43.645522000
    [Time delta from previous packet: 0.645775000 seconds]
    [Time since reference or first frame: 27.955558000 seconds]
    Frame Number: 188
    Packet Length: 918 bytes
    Capture Length: 918 bytes
    [Frame is marked: False]
    [Protocols in frame: sll:ip:udp:sip:sdp]
    [Coloring Rule Name: UDP]
    [Coloring Rule String: udp]
Linux cooked capture
    Packet type: Unicast to us (0)
    Link-layer address type: 1
    Link-layer address length: 6
    Source: ZyxelCom_39:05:7c (00:13:49:39:05:7c)
    Protocol: IP (0x0800)
Internet Protocol, Src: 87.54.25.114 (87.54.25.114), Dst: 85.81.159.186
(85.81.159.186)
    Version: 4
    Header length: 20 bytes
    Differentiated Services Field: 0x10 (DSCP 0x04: Unknown DSCP; ECN: 0x00)
        0001 00.. = Differentiated Services Codepoint: Unknown (0x04)
        .... ..0. = ECN-Capable Transport (ECT): 0
        .... ...0 = ECN-CE: 0
    Total Length: 902
    Identification: 0x3373 (13171)
    Flags: 0x04 (Don't Fragment)
        0... = Reserved bit: Not set
        .1.. = Don't fragment: Set
        ..0. = More fragments: Not set
    Fragment offset: 0
    Time to live: 58
    Protocol: UDP (0x11)
    Header checksum: 0xa430 [correct]
        [Good: True]
        [Bad : False]
    Source: 87.54.25.114 (87.54.25.114)
    Destination: 85.81.159.186 (85.81.159.186)
User Datagram Protocol, Src Port: sip (5060), Dst Port: 20280 (20280)
    Source port: sip (5060)
    Destination port: 20280 (20280)
    Length: 882
    Checksum: 0x98b8 [correct]
Session Initiation Protocol
    Request-Line: INVITE
sip:36947299@85.81.159.186:20280;rinstance=a731cc86fcd93577 SIP/2.0
        Method: INVITE
        [Resent Packet: False]
    Message Header
        Record-Route: <sip:87.54.25.114;ftag=as53044165;lr=on>
        Via: SIP/2.0/UDP 87.54.25.114;branch=z9hG4bK0048.4001de5.0
            Transport: UDP
            Sent-by Address: 87.54.25.114
            Branch: z9hG4bK0048.4001de5.0
        Via: SIP/2.0/UDP 87.54.25.116:5060;branch=z9hG4bK6567a86f;rport=5060
            Transport: UDP
            Sent-by Address: 87.54.25.116
            Sent-by port: 5060
            Branch: z9hG4bK6567a86f
            RPort: 5060
        From: "60355070" <sip:60355070@87.54.25.116>;tag=as53044165
            SIP Display info: "60355070"
            SIP from address: sip:60355070@87.54.25.116
            SIP tag: as53044165
        To: <sip:36947299@musimi.dk>
            SIP to address: sip:36947299@musimi.dk
        Contact: <sip:60355070@87.54.25.116>
            Contact Binding: <sip:60355070@87.54.25.116>
                URI: <sip:60355070@87.54.25.116>
                    SIP contact address: sip:60355070@87.54.25.116
        Call-ID: 41ca659a1dba51e54c56c65e253db961@87.54.25.116
        CSeq: 102 INVITE
            Sequence Number: 102
            Method: INVITE
        User-Agent: no
        Max-Forwards: 16
        Date: Wed, 15 Nov 2006 18:25:41 GMT
        Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY
        Content-Type: application/sdp
        Content-Length: 216
    Message body
        Session Description Protocol
            Session Description Protocol Version (v): 0
            Owner/Creator, Session Id (o): root 21804 21804 IN IP4
87.54.25.116
                Owner Username: root
                Session ID: 21804
                Session Version: 21804
                Owner Network Type: IN
                Owner Address Type: IP4
                Owner Address: 87.54.25.116
            Session Name (s): session
            Connection Information (c): IN IP4 87.54.25.116
                Connection Network Type: IN
                Connection Address Type: IP4
                Connection Address: 87.54.25.116
            Time Description, active time (t): 0 0
                Session Start Time: 0
                Session Stop Time: 0
            Media Description, name and address (m): audio 12126 RTP/AVP
0 101
                Media Type: audio
                Media Port: 12126
                Media Proto: RTP/AVP
                Media Format: ITU-T G.711 PCMU
                Media Format: 101
            Media Attribute (a): rtpmap:0 PCMU/8000
                Media Attribute Fieldname: rtpmap
                Media Format: 0
                MIME Type: PCMU
            Media Attribute (a): rtpmap:101 telephone-event/8000
                Media Attribute Fieldname: rtpmap
                Media Format: 101
                MIME Type: telephone-event
            Media Attribute (a): fmtp:101 0-16
                Media Attribute Fieldname: fmtp
                Media Format: 101 [telephone-event]
                Media format specific parameters: 0-16
            Media Attribute (a): silenceSupp:off - - - -
                Media Attribute Fieldname: silenceSupp
                Media Attribute Value: off - - - -

----------------- RTCP: Receiver report --------------------------------
--- sending to 87.54.25.116, port 12127

No.     Time        Source                Destination           Protocol
Info
    219 31.841460   85.81.159.186         87.54.25.116          RTCP
 Receiver Report

Frame 219 (176 bytes on wire, 176 bytes captured)
    Arrival Time: Nov 15, 2006 19:25:47.531424000
    [Time delta from previous packet: 3.777827000 seconds]
    [Time since reference or first frame: 31.841460000 seconds]
    Frame Number: 219
    Packet Length: 176 bytes
    Capture Length: 176 bytes
    [Frame is marked: False]
    [Protocols in frame: sll:ip:udp:rtcp]
    [Coloring Rule Name: UDP]
    [Coloring Rule String: udp]
Linux cooked capture
    Packet type: Sent by us (4)
    Link-layer address type: 1
    Link-layer address length: 6
    Source: Micro-St_c5:d2:d3 (00:11:09:c5:d2:d3)
    Protocol: IP (0x0800)
Internet Protocol, Src: 85.81.159.186 (85.81.159.186), Dst: 87.54.25.116
(87.54.25.116)
    Version: 4
    Header length: 20 bytes
    Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
        0000 00.. = Differentiated Services Codepoint: Default (0x00)
        .... ..0. = ECN-Capable Transport (ECT): 0
        .... ...0 = ECN-CE: 0
    Total Length: 160
    Identification: 0x5de6 (24038)
    Flags: 0x00
        0... = Reserved bit: Not set
        .0.. = Don't fragment: Not set
        ..0. = More fragments: Not set
    Fragment offset: 0
    Time to live: 127
    Protocol: UDP (0x11)
    Header checksum: 0x77b1 [correct]
        [Good: True]
        [Bad : False]
    Source: 85.81.159.186 (85.81.159.186)
    Destination: 87.54.25.116 (87.54.25.116)
User Datagram Protocol, Src Port: 36929 (36929), Dst Port: 12127 (12127)
    Source port: 36929 (36929)
    Destination port: 12127 (12127)
    Length: 140
    Checksum: 0x3dd7 [correct]
Real-time Transport Control Protocol (Receiver Report)
    [Stream setup by SDP (frame 188)]
        [Setup frame: 188]
        [Setup Method: SDP]
    10.. .... = Version: RFC 1889 Version (2)
    ..0. .... = Padding: False
    ...0 0000 = Reception report count: 0
    Packet type: Receiver Report (201)
    Length: 1
    Sender SSRC: 1876760333
Real-time Transport Control Protocol (Source description)
    [Stream setup by SDP (frame 188)]
        [Setup frame: 188]
        [Setup Method: SDP]
    10.. .... = Version: RFC 1889 Version (2)
    ..0. .... = Padding: False
    ...0 0001 = Source count: 1
    Packet type: Source description (202)
    Length: 30
    Chunk 1, SSRC/CSRC 1876760333
        Identifier: 1876760333
        SDES items
            Type: CNAME (user and domain) (1)
            Length: 61
            Text:
F285ED51A1B74A3E9C04998FB60E9D59@unique.z087589BAE2294387.org
            Type: PRIV (private extensions) (8)
            Length: 49
            Prefix length: 16
            Prefix string: x-rtp-session-id
            Text: 5610AC4508CD44F5A132528BD583BB85
            Type: END (0)
[RTCP frame length check: OK - 132 bytes]

=============== With    ip_conntrack_sip: ==============================

----------------- The INVITE -------------------------------------------
--- connect-info + media-description on G.711U: 87.54.25.116 port 15878:

No.     Time        Source                Destination           Protocol
Info
    833 27.893913   87.54.25.114          85.81.159.186         SIP/SDP
 Request: INVITE
sip:36947299@85.81.159.186:31656;rinstance=7800be4d6c7e0465, with
session description

Frame 833 (918 bytes on wire, 918 bytes captured)
    Arrival Time: Nov 15, 2006 18:55:05.084255000
    [Time delta from previous packet: 11.191292000 seconds]
    [Time since reference or first frame: 27.893913000 seconds]
    Frame Number: 833
    Packet Length: 918 bytes
    Capture Length: 918 bytes
    [Frame is marked: False]
    [Protocols in frame: sll:ip:udp:sip:sdp]
    [Coloring Rule Name: UDP]
    [Coloring Rule String: udp]
Linux cooked capture
    Packet type: Unicast to us (0)
    Link-layer address type: 1
    Link-layer address length: 6
    Source: ZyxelCom_39:05:7c (00:13:49:39:05:7c)
    Protocol: IP (0x0800)
Internet Protocol, Src: 87.54.25.114 (87.54.25.114), Dst: 85.81.159.186
(85.81.159.186)
    Version: 4
    Header length: 20 bytes
    Differentiated Services Field: 0x10 (DSCP 0x04: Unknown DSCP; ECN: 0x00)
        0001 00.. = Differentiated Services Codepoint: Unknown (0x04)
        .... ..0. = ECN-Capable Transport (ECT): 0
        .... ...0 = ECN-CE: 0
    Total Length: 902
    Identification: 0x4388 (17288)
    Flags: 0x04 (Don't Fragment)
        0... = Reserved bit: Not set
        .1.. = Don't fragment: Set
        ..0. = More fragments: Not set
    Fragment offset: 0
    Time to live: 58
    Protocol: UDP (0x11)
    Header checksum: 0x941b [correct]
        [Good: True]
        [Bad : False]
    Source: 87.54.25.114 (87.54.25.114)
    Destination: 85.81.159.186 (85.81.159.186)
User Datagram Protocol, Src Port: sip (5060), Dst Port: 31656 (31656)
    Source port: sip (5060)
    Destination port: 31656 (31656)
    Length: 882
    Checksum: 0xe61a [correct]
Session Initiation Protocol
    Request-Line: INVITE
sip:36947299@85.81.159.186:31656;rinstance=7800be4d6c7e0465 SIP/2.0
        Method: INVITE
        [Resent Packet: False]
    Message Header
        Record-Route: <sip:87.54.25.114;ftag=as3e9c7ff3;lr=on>
        Via: SIP/2.0/UDP 87.54.25.114;branch=z9hG4bKcc6.4c2d1a85.0
            Transport: UDP
            Sent-by Address: 87.54.25.114
            Branch: z9hG4bKcc6.4c2d1a85.0
        Via: SIP/2.0/UDP 87.54.25.116:5060;branch=z9hG4bK4f89e199;rport=5060
            Transport: UDP
            Sent-by Address: 87.54.25.116
            Sent-by port: 5060
            Branch: z9hG4bK4f89e199
            RPort: 5060
        From: "60355070" <sip:60355070@87.54.25.116>;tag=as3e9c7ff3
            SIP Display info: "60355070"
            SIP from address: sip:60355070@87.54.25.116
            SIP tag: as3e9c7ff3
        To: <sip:36947299@musimi.dk>
            SIP to address: sip:36947299@musimi.dk
        Contact: <sip:60355070@87.54.25.116>
            Contact Binding: <sip:60355070@87.54.25.116>
                URI: <sip:60355070@87.54.25.116>
                    SIP contact address: sip:60355070@87.54.25.116
        Call-ID: 60585ef575856ea834ba3fc52b145034@87.54.25.116
        CSeq: 102 INVITE
            Sequence Number: 102
            Method: INVITE
        User-Agent: no
        Max-Forwards: 16
        Date: Wed, 15 Nov 2006 17:55:02 GMT
        Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY
        Content-Type: application/sdp
        Content-Length: 216
    Message body
        Session Description Protocol
            Session Description Protocol Version (v): 0
            Owner/Creator, Session Id (o): root 18984 18984 IN IP4
87.54.25.116
                Owner Username: root
                Session ID: 18984
                Session Version: 18984
                Owner Network Type: IN
                Owner Address Type: IP4
                Owner Address: 87.54.25.116
            Session Name (s): session
            Connection Information (c): IN IP4 87.54.25.116
                Connection Network Type: IN
                Connection Address Type: IP4
                Connection Address: 87.54.25.116
            Time Description, active time (t): 0 0
                Session Start Time: 0
                Session Stop Time: 0
            Media Description, name and address (m): audio 15878 RTP/AVP
0 101
                Media Type: audio
                Media Port: 15878
                Media Proto: RTP/AVP
                Media Format: ITU-T G.711 PCMU
                Media Format: 101
            Media Attribute (a): rtpmap:0 PCMU/8000
                Media Attribute Fieldname: rtpmap
                Media Format: 0
                MIME Type: PCMU
            Media Attribute (a): rtpmap:101 telephone-event/8000
                Media Attribute Fieldname: rtpmap
                Media Format: 101
                MIME Type: telephone-event
            Media Attribute (a): fmtp:101 0-16
                Media Attribute Fieldname: fmtp
                Media Format: 101 [telephone-event]
                Media format specific parameters: 0-16
            Media Attribute (a): silenceSupp:off - - - -
                Media Attribute Fieldname: silenceSupp
                Media Attribute Value: off - - - -

----------------- RTCP: Receiver report --------------------------------
--- sending to 87.54.25.114, port 15879
--- expected 87.54.25.116 (not 114)

No.     Time        Source                Destination           Protocol
Info
   1463 31.828032   85.81.159.186         87.54.25.114          RTCP
 Receiver Report

Frame 1463 (176 bytes on wire, 176 bytes captured)
    Arrival Time: Nov 15, 2006 18:55:09.018374000
    [Time delta from previous packet: 3.810211000 seconds]
    [Time since reference or first frame: 31.828032000 seconds]
    Frame Number: 1463
    Packet Length: 176 bytes
    Capture Length: 176 bytes
    [Frame is marked: False]
    [Protocols in frame: sll:ip:udp:rtcp]
    [Coloring Rule Name: UDP]
    [Coloring Rule String: udp]
Linux cooked capture
    Packet type: Sent by us (4)
    Link-layer address type: 1
    Link-layer address length: 6
    Source: Micro-St_c5:d2:d3 (00:11:09:c5:d2:d3)
    Protocol: IP (0x0800)
Internet Protocol, Src: 85.81.159.186 (85.81.159.186), Dst: 87.54.25.114
(87.54.25.114)
    Version: 4
    Header length: 20 bytes
    Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
        0000 00.. = Differentiated Services Codepoint: Default (0x00)
        .... ..0. = ECN-Capable Transport (ECT): 0
        .... ...0 = ECN-CE: 0
    Total Length: 160
    Identification: 0xb74c (46924)
    Flags: 0x00
        0... = Reserved bit: Not set
        .0.. = Don't fragment: Not set
        ..0. = More fragments: Not set
    Fragment offset: 0
    Time to live: 127
    Protocol: UDP (0x11)
    Header checksum: 0x1e4d [correct]
        [Good: True]
        [Bad : False]
    Source: 85.81.159.186 (85.81.159.186)
    Destination: 87.54.25.114 (87.54.25.114)
User Datagram Protocol, Src Port: 22299 (22299), Dst Port: 15879 (15879)
    Source port: 22299 (22299)
    Destination port: 15879 (15879)
    Length: 140
    Checksum: 0xc12e [correct]
Real-time Transport Control Protocol (Receiver Report)
    [Stream setup by SDP (frame 1464)]
        [Setup frame: 1464]
        [Setup Method: SDP]
    10.. .... = Version: RFC 1889 Version (2)
    ..0. .... = Padding: False
    ...0 0000 = Reception report count: 0
    Packet type: Receiver Report (201)
    Length: 1
    Sender SSRC: 1083641640
Real-time Transport Control Protocol (Source description)
    [Stream setup by SDP (frame 1464)]
        [Setup frame: 1464]
        [Setup Method: SDP]
    10.. .... = Version: RFC 1889 Version (2)
    ..0. .... = Padding: False
    ...0 0001 = Source count: 1
    Packet type: Source description (202)
    Length: 30
    Chunk 1, SSRC/CSRC 1083641640
        Identifier: 1083641640
        SDES items
            Type: CNAME (user and domain) (1)
            Length: 61
            Text:
FF3B86667EA64176BE3BF27E491AB9DA@unique.z166853F764CE4ED7.org
            Type: PRIV (private extensions) (8)
            Length: 49
            Prefix length: 16
            Prefix string: x-rtp-session-id
            Text: 109CE61BD7264FAAAE5D01DDFF9A430B
            Type: END (0)
[RTCP frame length check: OK - 132 bytes]



