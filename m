From: william fitzgerald <wfitzgerald@tssg.org>
Subject: Query: stateless versus statefull best practice choices
Date: Wed, 03 Jun 2009 17:31:42 +0100
Message-ID: <4A26A56E.3080404@tssg.org>
Reply-To: wfitzgerald@tssg.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Dear all,

What is *best practice* when it comes to choosing either stateless 
versus statefull rules (or perhaps combinations) to protect services.

For example:

Internet --> Firewall --> Web server

STATELESS
% allow anyone initiate access to web server

% Rule 1
iptables -A FORWARD -i eth1 -s 0/0 -d 192.168.1.2 -p tcp --dport 80 
--tcp-flags !SYN -j DROP

%Rule 2
iptables -A FORWARD -i eth1 -s 0/0 -d 192.168.1.2 -p tcp --dport 80 -j 
ACCEPT

% allow web server to reply back to internet

% Rule 3: filter for ACK flag, web server should not send a SYN
iptables -A FORWARD -o eth0 -s 192.168.1.2 -d 0/0 -p tcp --sport 80 
--tcp-flags !ACK -j DROP

% Rule 4: used after 3-way handshake established
iptables -A FORWARD -o eth0 -s 192.168.1.2 -d 0/0 -p tcp --sport 80 -j 
ACCEPT

(Note maybe rules 1 and 3 above are ineffective but I guess rules 2 and 
4 provide simplistic stateless access after the 3-way handshake)

STATEFULL
% allow anyone initiate access to web server

% Rule 1
iptables -A FORWARD -i eth1 -s 0/0 -d 192.168.1.2 -p tcp --dport 80 -m 
state --state NEW -j ACCEPT

% Rule 2: allow on going communication after 3 way handshake.
% note: sure if this rule is even needed given Rule 1 is part of the 
state match process
iptables -A FORWARD -i eth1 -s 0/0 -d 192.168.1.2 -p tcp --dport 80 -m 
state --state ESTABLISHED -j ACCEPT

% allow web server to reply back to internet
% Rule 3
iptables -A FORWARD -o eth0 -s 192.168.1.2 -d 0/0 -p tcp --sport 80 -m 
state --state ESTABLISHED -j ACCEPT


So why would I choose one over the other here?
regards,
Will.
