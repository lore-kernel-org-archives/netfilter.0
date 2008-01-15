From: DI Roman Fiedler <roman.fiedler@telbiomed.at>
Subject: Connection intercept
Date: Tue, 15 Jan 2008 17:43:29 +0100
Message-ID: <478CE2B1.2000806@telbiomed.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

I want to create an iptables setup that routes all packets that would be 
dropped to a gateway on a separate interface. I try to do it by marking 
these packets with a INTERCEPT connmark (and ACCEPT them) and use a 
different routing table (std. policy routing) with a default route to 
the separate interface.  The problem: I want to use the filter tables to 
do the filtering, but the packets are already routed when they reach the 
filter tables. So I cannot route the first packet of a connection to 
this special interface, hence no real connection intercept is possible.

Setup:

Inet  - Firewall - Internal Zone
                 |
              Intercept host


The intercept host will answer for all IPs (Honeypot like), so that 
connections that would have been refused are openen and can be analysed. 
Example: Host xxxx from internal zone tries to reach nonstandard mail 
exchange, mail connection is automatically routed to the intercept host 
and mail is captured to see if xxxxx is just malconfigured or if some 
malware tries to send out some data.


Any ideas for workarounds to realise such an fw setup, e.g. exotic 
netfilter targets that can push back a packet to the beginning of the 
filter process so that it runs through the whole filter again, this time 
with the correct connmark so that it uses the alternate interface

greets, Roman






