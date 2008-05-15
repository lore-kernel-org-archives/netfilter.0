From: Christophe Painchaud <dash@ionblast.net>
Subject: conntrackd synchronisation at startup
Date: Thu, 15 May 2008 14:50:35 +0200
Message-ID: <20080515145035.ecbpgmdr8cg0o80o@webmail.ionblast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

  I managed to create a cluster of 2 firewalls that share their  
conntrack tables ; but I've got a little problem/question:

  When I restart a node to simulate a failure, it won't request  
existing connections, it will only get news ones. I am forced to do a  
'conntrackd -n' to resync it all. I tried to start conntrackd with  
'conntrackd -d -n' or 'conntrackd -dn' . No success here. Is there a  
proper way to do this ? should I create a startup script that run -d  
command line, and then -n ?


Thank you in advance for your replies (and this great piece of software!)

Regards,

-- 
Christophe Painchaud
email: dash@ionblast.net
jabber: dash@im.ionblast.net


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

