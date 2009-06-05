From: william fitzgerald <wfitzgerald@tssg.org>
Subject: Query: implicit TCP flag settings when filtering in a stateless manner
Date: Fri, 05 Jun 2009 22:37:33 +0100
Message-ID: <4A29901D.104@tssg.org>
Reply-To: wfitzgerald@tssg.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi all,

What is the default tcp flag settings after the 3-way handshake?

Are all flag bits zero when connection is established or am I write in saying that both ack 
and psh flags are set?

Imagine I wanted to have stateless rules to access a web server. Rules 1 and 2 form part of 
the 3 way handshake by allowing external users to start a conversation (SYN flag). Rules 4 
and 5 ignore filtering for flags and are used after connection has be established.

Rule 1:
iptables -A INPUT -s 0/0 -d 192.168.1.2 --dport 80 -p tcp --tcp-flags SYN -j ACCEPT
Rule 2:
iptables -A INPUT -s 192.168.1.2 -d 0/0 --sport 80 -p tcp --tcp-flags ACK -j ACCEPT
Rule 4:
iptables -A INPUT -s 0/0 -d 192.168.1.2 --dport 80 -p tcp -j ACCEPT
Rule 5:
iptables -A INPUT -s 192.168.1.2 -d 0/0 --sport 80 -p tcp  -j ACCEPT
Rule 6:
iptables -A INPUT -s 0/0 -d 192.168.1.2 --dport 80 -p tcp --tcp-flags ACK PSH -j ACCEPT
Rule 7:
iptables -A INPUT -s 192.168.1.2 -d 0/0 --sport 80 -p tcp  --tcp-flags ACK PSH -j ACCEPT

What I would like to know, is what tcp flags are implicitly set when fetching or delivering 
a webpage?

Ideally I am trying to work out if one rule is redundant to another. There are 2 scenarios 
depending of what the answer to my query is.

1) All flags set to zero for ongoing tcp communication thus there is no redundant firewall 
rules. And there is no apparent use for rules 6 and 7

2) The ack-psh flags are set for ongoing tcp communication thus rule 4 is redundant to rule 
6 and rule 5 is redundant to rule 7 and vice versa. That is rule 4 = rule 6 and rule 5 = rule 7.

I understand I can use the state match etc to handle these concerns but never the less I am 
interested to know for stateless situations. My gut feeling is that when no tcp flags are 
stated then PSH and ACK are set to true.

Actually this raises another question!

If I only had rules 4 and 5 above then what is the implicit tcp flag setting now? How does 
the filter implicitly infer the default setting is syn and ack during the handshake and then 
ack and psh thereafter?

Perhaps there is a 3rd scenario to above:

3) With rules 4 and 5 you do not check flags implicitly never mind explicitly (like rules 
1,2,5 and 6). Thus you get a similar scenario to 1) in that, there is no commonality between 
any of the rules, whereby rules 6 and 7 are not redundant to 3 and 4 by ack-psh flags nor 
rules 1 and 2 by syn and ack flags respectively.


regards,
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
