From: "Dennis J." <dennisml@conversis.de>
Subject: best approach for blocklist
Date: Fri, 05 Mar 2010 17:17:36 +0100
Message-ID: <4B912EA0.1060604@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
I'm wondering what the most efficient way to implement a blocklist is. We 
are basically talking about blocking a few thousand IPs. Does iptables do 
some internal optimizations when blocking based on a source address or 
would it be better to, say, create a chain for each class A net (e.g. 
83.0.0.0/8) and then add the IPs in that range to that class to make the 
matching more efficient?

Regards,
   Dennis
