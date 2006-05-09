From: "Joseph Yannaccone" <jyannaccone@gmail.com>
Subject: Problem with ip_conntrack_sip in kernel 2.6.16
Date: Tue, 9 May 2006 12:42:46 -0400
Message-ID: <000001c67387$9aab61e0$200a10ac@meritusa.local>
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


Does anyone have sip_conntrack_nat working with kernel 2.6.16?  I am trying
to perform basic SIP connection tracking using the ip_conntrack_sip module
with netfilter/iptables to dynamically open RTP ports for VoIP calls (using
SIP signaling, of course).  I do not yet need any SIP NAT functionality.

I have been able to get it to build with a vanilla 2.6.16.14 when using the
latest snapshot of the sip_conntrack_nat patch for 2.6.13 (taken from
patch-o-matic-ng-20060507).  I am also able to successfully load the
ip_conntrack_sip module at iptables startup (I have verified this with
lsmod).  However, the module does not appear to be dynamically opening the
RTP ports specified in the SIP INVITE/200 OK messages.  While SIP is able to
complete the call setup signaling, the RTP media stream is being blocked by
netfilter/iptables and no audio pass through during the call (specifically,
GW1 is dropping the incoming audio media - see my actual configuration
below).

My test setup is as follows (I am sharing exact addresses and configurations
because it is in an isloated lab environment using private addressing):

(Asterisk Server CUST: 172.16.1.31:5060) --- Generates a call to --->
(Asterisk Server GW1: 172.16.1.21:5060)

CUST is running Fedora Core 5 with the default i686-smp kernel.

GW1 is running Fedora Core 5 with a vanilla 2.6.16.14 kernel that has been
patched with sip_conntrack_nat.

CUST is not using the sip_conntrac_nat patch and has the following iptables
configuration

===== BEGIN IPTABLES CONFIGURATION FOR CUST

-A INPUT -i lo -j ACCEPT
-A INPUT -p icmp --icmp-type any -j ACCEPT -A INPUT -p udp -m udp --dport
5060 -j ACCEPT # Asterisk is configured to use ports 10000-20000 for RTP -A
INPUT -p udp -m udp --dport 10000:20000 -j ACCEPT -A INPUT -m state --state
ESTABLISHED,RELATED -j ACCEPT -A INPUT -j REJECT --reject-with
icmp-host-prohibited
 
===== END IPTABLES CONFIGURATION FOR CUST


GW1 is using the sip_conntrac_nat patch and has the following iptables
configuration

===== BEGIN IPTABLES CONFIGURATION FOR GW1

-A INPUT -i lo -j ACCEPT
-A INPUT -p icmp --icmp-type any -j ACCEPT -A INPUT -p udp -m udp --dport
5060 -j ACCEPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT -A
INPUT -j REJECT --reject-with icmp-host-prohibited
 
===== END IPTABLES CONFIGURATION FOR GW1


Below is an ngrep capture of a call setup.

===== BEGIN NGREP CALL SETUP CAPTURE 

U 172.16.1.31:5060 -> 172.16.1.21:5060
INVITE sip:101@172.16.1.21 SIP/2.0.
Via: SIP/2.0/UDP 172.16.1.31:5060;branch=z9hG4bK18179b80;rport.
From: "asterisk" <sip:cust@telsolusa.com>;tag=as591087fd.
To: <sip:101@172.16.1.21>.
Contact: <sip:cust@172.16.1.31>.
Call-ID: 32c7d3fa4ba78af95efd95da1a4d9720@telsolusa.com.
CSeq: 102 INVITE.
User-Agent: Asterisk PBX.
Max-Forwards: 70.
Date: Tue, 09 May 2006 13:51:55 GMT.
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY.
Content-Type: application/sdp.
Content-Length: 259.
.
v=0.
o=root 2785 2785 IN IP4 172.16.1.31.
s=session.
c=IN IP4 172.16.1.31.
t=0 0.
m=audio 16334 RTP/AVP 3 0 8 101.
a=rtpmap:3 GSM/8000.
a=rtpmap:0 PCMU/8000.
a=rtpmap:8 PCMA/8000.
a=rtpmap:101 telephone-event/8000.
a=fmtp:101 0-16.
a=silenceSupp:off - - - -.
 
U 172.16.1.21:5060 -> 172.16.1.31:5060
SIP/2.0 407 Proxy Authentication Required.
Via: SIP/2.0/UDP
172.16.1.31:5060;branch=z9hG4bK18179b80;rport;received=172.16.1.31.
From: "asterisk" <sip:cust@telsolusa.com>;tag=as591087fd.
To: <sip:101@172.16.1.21>;tag=as22c79ede.
Call-ID: 32c7d3fa4ba78af95efd95da1a4d9720@telsolusa.com.
CSeq: 102 INVITE.
User-Agent: Asterisk PBX.
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY.
Contact: <sip:101@172.16.1.21>.
Proxy-Authenticate: Digest realm="asterisk", nonce="3dbfcd8b".
Content-Length: 0.
.

U 172.16.1.31:5060 -> 172.16.1.21:5060
ACK sip:101@172.16.1.21 SIP/2.0.
Via: SIP/2.0/UDP 172.16.1.31:5060;branch=z9hG4bK18179b80;rport.
From: "asterisk" <sip:cust@telsolusa.com>;tag=as591087fd.
To: <sip:101@172.16.1.21>;tag=as22c79ede.
Contact: <sip:cust@172.16.1.31>.
Call-ID: 32c7d3fa4ba78af95efd95da1a4d9720@telsolusa.com.
CSeq: 102 ACK.
User-Agent: Asterisk PBX.
Max-Forwards: 70.
Content-Length: 0.
.

U 172.16.1.31:5060 -> 172.16.1.21:5060
INVITE sip:101@172.16.1.21 SIP/2.0.
Via: SIP/2.0/UDP 172.16.1.31:5060;branch=z9hG4bK10f4900a;rport.
From: "asterisk" <sip:cust@telsolusa.com>;tag=as591087fd.
To: <sip:101@172.16.1.21>.
Contact: <sip:cust@172.16.1.31>.
Call-ID: 32c7d3fa4ba78af95efd95da1a4d9720@telsolusa.com.
CSeq: 103 INVITE.
User-Agent: Asterisk PBX.
Max-Forwards: 70.
Proxy-Authorization: Digest username="cust", realm="asterisk",
algorithm=MD5, uri="sip:101@172.16.1.21", nonce="3dbfcd8b",
response="055e8ec02c3cc2bd33e91627349c469a", opaque="".
Date: Tue, 09 May 2006 13:51:55 GMT.
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY.
Content-Type: application/sdp.
Content-Length: 259.
.
v=0.
o=root 2785 2786 IN IP4 172.16.1.31.
s=session.
c=IN IP4 172.16.1.31.
t=0 0.
m=audio 16334 RTP/AVP 3 0 8 101.
a=rtpmap:3 GSM/8000.
a=rtpmap:0 PCMU/8000.
a=rtpmap:8 PCMA/8000.
a=rtpmap:101 telephone-event/8000.
a=fmtp:101 0-16.
a=silenceSupp:off - - - -.

U 172.16.1.21:5060 -> 172.16.1.31:5060
SIP/2.0 100 Trying.
Via: SIP/2.0/UDP
172.16.1.31:5060;branch=z9hG4bK10f4900a;rport;received=172.16.1.31.
From: "asterisk" <sip:cust@telsolusa.com>;tag=as591087fd.
To: <sip:101@172.16.1.21>.
Call-ID: 32c7d3fa4ba78af95efd95da1a4d9720@telsolusa.com.
CSeq: 103 INVITE.
User-Agent: Asterisk PBX.
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY.
Contact: <sip:101@172.16.1.21>.
Content-Length: 0.
.

U 172.16.1.21:5060 -> 172.16.1.31:5060
SIP/2.0 200 OK.
Via: SIP/2.0/UDP
172.16.1.31:5060;branch=z9hG4bK10f4900a;rport;received=172.16.1.31.
From: "asterisk" <sip:cust@telsolusa.com>;tag=as591087fd.
To: <sip:101@172.16.1.21>;tag=as3883ad34.
Call-ID: 32c7d3fa4ba78af95efd95da1a4d9720@telsolusa.com.
CSeq: 103 INVITE.
User-Agent: Asterisk PBX.
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY.
Contact: <sip:101@172.16.1.21>.
Content-Type: application/sdp.
Content-Length: 261.
.
v=0.
o=root 16973 16973 IN IP4 172.16.1.21.
s=session.
c=IN IP4 172.16.1.21.
t=0 0.
m=audio 17558 RTP/AVP 3 0 8 101.
a=rtpmap:3 GSM/8000.
a=rtpmap:0 PCMU/8000.
a=rtpmap:8 PCMA/8000.
a=rtpmap:101 telephone-event/8000.
a=fmtp:101 0-16.
a=silenceSupp:off - - - -.

U 172.16.1.31:5060 -> 172.16.1.21:5060
ACK sip:101@172.16.1.21 SIP/2.0.
Via: SIP/2.0/UDP 172.16.1.31:5060;branch=z9hG4bK49255af6;rport.
From: "asterisk" <sip:cust@telsolusa.com>;tag=as591087fd.
To: <sip:101@172.16.1.21>;tag=as3883ad34.
Contact: <sip:cust@172.16.1.31>.
Call-ID: 32c7d3fa4ba78af95efd95da1a4d9720@telsolusa.com.
CSeq: 103 ACK.
User-Agent: Asterisk PBX.
Max-Forwards: 70.
Content-Length: 0.
.

U 172.16.1.31:5060 -> 172.16.1.21:5060
BYE sip:101@172.16.1.21 SIP/2.0.
Via: SIP/2.0/UDP 172.16.1.31:5060;branch=z9hG4bK5efcd84e;rport.
From: "asterisk" <sip:cust@telsolusa.com>;tag=as591087fd.
To: <sip:101@172.16.1.21>;tag=as3883ad34.
Contact: <sip:cust@172.16.1.31>.
Call-ID: 32c7d3fa4ba78af95efd95da1a4d9720@telsolusa.com.
CSeq: 104 BYE.
User-Agent: Asterisk PBX.
Max-Forwards: 70.
Proxy-Authorization: Digest username="cust", realm="asterisk",
algorithm=MD5, uri="sip:101@172.16.1.21",
nonce="3dbfcd8b",response="f92da020b9d860e39adae2b4cae6abe9", opaque="".
Content-Length: 0.
.

U 172.16.1.21:5060 -> 172.16.1.31:5060
SIP/2.0 200 OK.
Via: SIP/2.0/UDP
172.16.1.31:5060;branch=z9hG4bK5efcd84e;received=172.16.1.31;rport=5060.
From: "asterisk" <sip:cust@telsolusa.com>;tag=as591087fd.
To: <sip:101@172.16.1.21>;tag=as3883ad34.
Call-ID: 32c7d3fa4ba78af95efd95da1a4d9720@telsolusa.com.
CSeq: 104 BYE.
User-Agent: Asterisk PBX.
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY.
Contact: <sip:101@172.16.1.21>.
Content-Length: 0.
.

===== END NGREP CALL SETUP CAPTURE


I captured the following proc output after the ACK which completed the call
setup and before the BYE (the call lasted approximately 30 seconds - this
information was captured approximately 10 seconds into the call - so the
ports should definitely have been open by this time):

$> cat /proc/net/ip_conntrack
udp      17 3598 src=172.16.1.31 dst=172.16.1.21 sport=5060 dport=5060
packets=9 bytes=5644 src=172.16.1.21 dst=172.16.1.31 sport=5060 dport=5060
packets=7 bytes=3905 [ASSURED] mark=0 use=1

$> cat /proc/net/ip_conntrack_expect
167 proto=17 src=172.16.1.21 dst=172.16.1.31 sport=0 dport=16334

I looks like the module is getting the information from the invite without a
problem, but doesn't seem to get the information (at least the RTP port from
the m= line) from the 200 OK response.  I am hesitant to mess with the code
because I am not familiar with it and only have about a week to get this
working.

Just as a sanity check, when I add the following line to iptables in GW1
(just before the last line that rejects anything else), the media passes
through properly and I can hear the call audio.

-A INPUT -p udp -m udp --dport 10000:20000 -j ACCEPT.  This merely confirms
that my problem IS occuring somewhere in netfilter/iptables/conntrack.

Any assistance or guidance anyone can provide would be greatly appreciated.
Please let me know if I need to provide any additional information.

Thank you,
Joe Yannaccone




