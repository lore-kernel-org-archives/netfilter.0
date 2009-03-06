From: "Andrew O. Zhukov" <andre@telegroup.com.ua>
Subject: conntrack_sip
Date: Fri, 06 Mar 2009 15:18:24 +0200
Message-ID: <49B122A0.7080905@telegroup.com.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

=EBernel 2.6.25.14-69.fc8
iptables-1.4.1.1-1.fc8.x86_64.rpm

followed trouble:

SIP gw                  Fedora               SipProxy      =E1sterisk
192.168.2.24   192.168.2.1 666.666.34.46  555.555.184.13  555.555.184.1=
3

Sip proxy without RTP proxy for not nat cusomers. It considetate SIP GW=
=20
as 666.666.34.46 and do not switch on RTP proxy.

call from SIP GW to Asterisk. Dump from Fedor=C1:

U 2009/03/05 21:00:11.899191 555.555.184.13:5060 -> 192.168.2.24:5060
   SIP/2.0 183 Session Progress..Via: SIP/2.0/UDP=20
555.555.184.13:5060;branch=3Dz9hG4bK878912355;rport=3D1025..From: "212u=
a1" <sip
   :101563@xxx.com>;tag=3D66346232..To:=20
<sip:2292694@xxx.com>;tag=3Das41f52f95..Call-ID:=20
1295544592-5060-4@192.168.2.24..
=2E....
=2E.Contact: <sip:2292694@555.555.184.2>..Content-Type:=20
application/sdp..Content-Length: 263....v=3D0..o=3Droot 277
   97 27797 IN IP4 555.555.184.2..s=3Dsession..c=3DIN IP4 555.555.184.2=
=2E.t=3D0

---
180 Ringing without sdp
---

U 2009/03/05 21:00:20.753646 555.555.184.13:5060 -> 192.168.2.24:5060
   SIP/2.0 200 OK..Via: SIP/2.0/UDP=20
555.555.184.13:5060;branch=3Dz9hG4bK878912355;rport=3D1025..Record-Rout=
e:=20
<sip:555.555.184.13;
   lr=3Don;ftag=3D66346232>..From: "212ua1"=20
<sip:101563@xxx.com>;tag=3D66346232..To:=20
<sip:2292694@xxx.com>;tag=3Das41f52f95..C
   all-ID: 1295544592-5060-4@192.168.2.24..CSeq: 31 INVITE..User-Agent:=
=20
Telegroup Ukraine..Allow: INVITE, ACK, CANCEL, OPTIO
   NS, BYE, REFER, SUBSCRIBE, NOTIFY..Supported: replaces..Contact:=20
<sip:2292694@555.555.184.2>..Content-Type: application/sd
   p..Content-Length: 265....v=3D0..o=3Droot 27797 27798 IN IP4=20
555.555.184.13..s=3Dsession..c=3DIN IP4 555.555.184.13..t=3D0 0..m=3Dau=
dio
    29444 RTP/AVP 18 101..a=3Drtpmap:18 G729/8000..a=3Dfmtp:18=20
annexb=3Dno..a=3Drtpmap:101 telephone-event/8000..a=3Dfmtp:101 0-16..a=3D
   silenceSupp:off - - - -..a=3Dptime:20..a=3Dsendrecv..

in the "OK" message =E1sterisk ip addresses in SDP changed to the ip=20
addresses of SipProxy by sip_conntrack. I can provide DUMP from the=20
SipProxy and the complete set of dumps for developers.

Thanks in advance.


--=20
Andrew O. Zhukov
Telegroup Ukraine

