From: "Wilson, Richard E" <richard.wilson@eds.com>
Subject: SMTP Traffic and NOTRACK
Date: Fri, 21 Sep 2007 17:40:38 -0500
Message-ID: <DE0BDC6DCC1F724882C0828AD2D3E684019E9389@usplm203.amer.corp.eds.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On some heavily hit mail servers we have recently run into several
occurrences of the ip_conntrack table overflowing and I am wondering if
anyone on the list can advise of any issues with adding the following
rule:

	iptables -t raw -A OUTPUT -p tcp --dport 25 -j NOTRACK

There are no NAT issues with SMTP traffic to these servers, so the
connection tracking shouldn't be required.

If there's a better rule to stop inbound SMTP traffic from getting added
to the conntrack table, please let me know.

For now I've increased the size of the conntrack table and decreased the
TCP timeout value, but the situation is getting worse, so I'm looking at
other approaches.

Details: RHEL 4, Kernel 2.6.9, iptables 1.2.11

Thanks in advance,

Richard Wilson
EDS
Richard dot Wilson at EDS dot com
