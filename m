From: "Raymond Burkholder" <ray@oneunified.net>
Subject: Symmetric / Asymmetric Connection Tracking
Date: Fri, 19 Jan 2018 09:37:52 -0400
Message-ID: <5e5301d3912a$b4f42730$1edc7590$@oneunified.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

In the Conntrack Tools Manual at
http://conntrack-tools.netfilter.org/manual.html, there is this quote:

" On the other hand, the asymmetric scenario may work if your setup fulfills
several strong assumptions."

I think I almost have the 'several strong assumptions' fulfilled, but  ...
was wondering if those assumptions could be enumerated?

I have refactored my network design to make use of the 'symmetric path
routing' as much as I can.  But there are a few connections, which, if I can
make 'asymmetric multi-path routing' work, that would make my day.

Any comments or suggestions or clarifications on the 'assumptions', or
changes in thinking since that document was written?  I am using nftables
commands to build my structures and would like to use the conntrackd tools
to sync state.

--
Raymond Burkholder
https://blog.raymond.burkholder.net


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

