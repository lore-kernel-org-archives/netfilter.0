From: "Amit Kumar Gupta" <amitkumar.gupta@wipro.com>
Subject: IPTables Logging Problem.
Date: Tue, 3 Dec 2002 13:55:18 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4223A04BF7D1B941A25246ADD0462FF5562B49@blr-m3-msg.wipro.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPartTM-000-c0b56df7-7505-4583-bb55-c44668f6ba06"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

------=_NextPartTM-000-c0b56df7-7505-4583-bb55-c44668f6ba06
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Hi List,

I am having a problem reg IPtables Logging. Suppose I want to LOG all
the packets for a particular session. How I can do that? (Here, Session
say telnet is established b/w 2 hosts and I want to Log all the packets
on host A (say) i.e. the outgoing and incoming packets).=20
I know abt the commans :-

Iptables -A INPUT -s HOSTA -d HOSTB -p tcp -sport 21 -j LOG=20

But it logs only packets from HostA to HostB while I want the reverse
also. I don't want to replicate the rule.

Any suggestions will be appreciated.

Regards,
Amit

------=_NextPartTM-000-c0b56df7-7505-4583-bb55-c44668f6ba06
Content-Type: text/plain;
	name="Wipro_Disclaimer.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="Wipro_Disclaimer.txt"

**************************Disclaimer**************************************************    
 
 Information contained in this E-MAIL being proprietary to Wipro Limited is 'privileged' 
and 'confidential' and intended for use only by the individual or entity to which it is 
addressed. You are notified that any use, copying or dissemination of the information 
contained in the E-MAIL in any manner whatsoever is strictly prohibited.

****************************************************************************************

------=_NextPartTM-000-c0b56df7-7505-4583-bb55-c44668f6ba06--

