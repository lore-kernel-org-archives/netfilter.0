From: "P.Srihari" <srihari.par@wipro.com>
Subject: packet matching problem
Date: Mon, 12 May 2003 19:59:11 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EBFAFB7.3D78BFDE@wipro.com>
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


hi,

i am facing what i think is a peculiar problem. i have a set of rules as
follows

iptables -I FORWARD -p tcp --tcp-flags SYN,RST,ACK SYN -m limit --limit
1/s --limit-burst 1024 -j ACCEPT
iptables -A FORWARD -p tcp --tcp-flags SYN,RST,ACK SYN -j LOG
--log-prefix "SYN ATTACK"
iptables -A FORWARD -p tcp --tcp-flags SYN,RST,ACK SYN  -j DROP
iptables -A FORWARD -p tcp -m state --state RELATED,ESTABLISHED -j
ACCEPT

now i started an FTP session from the host to an FTP server. in this
session, i turn off the prompt and do an mget * ( multiple files ).
the files are in order of about 4 MB or so. as soon as the first file
is completed, it prints the message SYN ATTACK - with the SRC port as
ftp-data port (20) - no other traffic is coming into the firewall host. 
TCPDUMP on the firewall machine shows that about 8 or 9 SYN packets 
having been received by the firewall host. 

now in the netfilter framework in 2.4.5 kernel, i found the following

a. for some strange reason, the packet-matching code in the kernel
for limit is being invoked for even non-SYN packets and as the traffic
to ftp data port flows into firewall, the credit associated with the
entry for 1st rule in the above mentioned rule is getting reduced and
finally the SYN attack is printed. 

i am not saying that there is a bug in the netfilter code, but there
could be something wrong in the rules that i have framed.

the above observations are accurate as i have done the test quite a
few times.

the iptables version that i am using is 1.2.6a

can anyone suggest some solution

thanks
srihari

**************************Disclaimer************************************

Information contained in this E-MAIL being proprietary to Wipro Limited is 
'privileged' and 'confidential' and intended for use only by the individual
 or entity to which it is addressed. You are notified that any use, copying 
or dissemination of the information contained in the E-MAIL in any manner 
whatsoever is strictly prohibited.

***************************************************************************

