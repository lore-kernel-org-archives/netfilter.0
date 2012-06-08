From: Stefan Keller <sk@open.ch>
Subject: Virtual packet tracer for iptables
Date: Fri, 08 Jun 2012 13:32:01 +0200
Message-ID: <4FD1E2B1.80801@open.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi

I'm quite sure that I'm not the first guy asking for such a
functionality but I could not find anything in the Internet
nor in the netfilter mailing list.

Is there any tool or iptables extension to query the iptables
rule base? What I mean is something that needs input parameters
such as

- source IP address
- destination IP address
- source Port
- destination Port
- incoming interface
- outgoing interface
- ToS
- FWMARK
- ...

and the output is the matching rules of all tables (mangle, raw,
nat and filter table).
I know that the output only shows half of the truth for traffic that
needs a helper such as FTP and SIP but it would be perfect for
off-line analysis and for debugging purposes of our large environment.

Thank you for sharing your experiences!

Best regards
Stefan Keller

