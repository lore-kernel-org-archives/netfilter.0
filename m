From: dE <de.techno@gmail.com>
Subject: DROP policy, serious vulnerability?
Date: Thu, 19 Mar 2015 11:21:44 +0530
Message-ID: <550A63F0.2030400@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=7F0DJ686cR96cH8RBxZDiJq8cZK5Un54U/Ombz6qv44=;
        b=v7vKGx+Z5rydRKSDq+Qvmmry0kUtC9ae9JpoL6MHqq47iCmS6SBcJJ8MIOWqW/icTs
         rVYEK4KQsXj9W3QL34oISkxi5uLDFwft97mCYd8JSPlWq/UQHvhHv0aIbhlHSRH3XVml
         rq1oEehAK8iAxI6zNMD06pBUpQtsY6zEvIhMN822hBa3aellGjCvdfynHXU1JeN0w0uL
         RtJL0QpAc7/XYRKQtOgSGZCH84ZgPt2jMmkdQ9v36vMcPWTu2TD2EBCqHGsoTla7vwQk
         UY3kblwOASQyzVCbczz5q9tYMRZUuvpBqruHHW/0KG3PI8fu6SFQZE1k9dPdhxNF/7Xo
         A3aQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi!

I'm using the drop policy for iptables using the following --

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -p tcp -j ACCEPT
iptables -A INPUT -p udp -j ACCEPT
iptables -A INPUT -p tcp ! -i lo -m multiport --dports 0:79,81:65535 -m 
state --state NEW -j DROP

Unfortunately, in this configuration, none of the ports get blocks.

This implies that after an ACCEPT, further rules are not matched. Is 
this a bug or intended by design?

If this is by design, how am I supposed to use modules like connlimit 
with DROP policy.

Thanks for any help!
