From: william fitzgerald <wfitzgerald@tssg.org>
Subject: Can Blocking Reserved RFC1918 and RFC3330 Spoofing be simplified?
Date: Wed, 03 Jun 2009 14:30:28 +0100
Message-ID: <4A267AF4.9030103@tssg.org>
Reply-To: wfitzgerald@tssg.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dear all,

If I wanted to block incoming IP address ranges from RFC1918 and RFC3330 
must I create rules for each of the reserved addresses along the INPUT 
and FORWARD chains?

(It would be around 30plus rules when applying to both INPUT and FORWARD 
chains)

Would the following equally work?

Suppose I have an internal class C network 192.168.1.* and imagine I was 
running a web server for public use. Interface eth1 is the internet 
facing NIC port and eth0 is the internal port NIC.

Could I not just have 2 kinds of rules to block all RFC1918 and RFC3330 
spoofed packets.

First KIND: DROP EVERYTHING BY DEFAULT VIA CHAIN POLICY

iptables -P INPUT DROP
iptables -P FORWARD DROP

SECOND KIND: DROP INDIVIDUAL PACKET TYPES

% Rule 1: Drop everything from outside.
iptables -A INPUT -i eth1 -j DROP

% Rule 2: Drop my internal IP range arriving from outside
iptables -A FORWARD -i eth1 -s 192.168.1.0/24 -j DROP

% Rule 3: allow access to web server from all IP addresses.
% note this rule must come after Rule 2.
iptables -A FORWARD -i eth1 -s 0/0 -d 192.168.1.2 -j ACCEPT

% Rule 4: Drop all other packets arriving on the FORWARD chain port eth1
% The default FORWARD Policy SHOULD cover this! But add it just in case.
iptables -A FORWARD -i eth1 -j DROP

kind regards,
Will.

-- 
________________________________________
William M. Fitzgerald (MSc, BSc)
PhD Student,
Cork Constraint Computation Centre,
Computer Science Dept.,
University College Cork,
Cork,
Ireland.
----------------------------------------
www.williamfitzgerald.net
www.williamfitzgerald.info
www.linkedin.com/in/williamfitzgerald
http://4c.ucc.ie/web/people.jsp?id=143
www.tssg.org/people/wfitzgerald/
________________________________________
