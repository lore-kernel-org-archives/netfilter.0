From: Dimitri Yioulos <dyioulos@onpointfc.com>
Subject: Dual WAN set-up
Date: Thu, 12 Jan 2012 16:51:18 -0500
Message-ID: <201201121651.18887.dyioulos@onpointfc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, folks.

Please bear with me.  I may have asked something similar in the 
way-back, but am going to ask again, because I really need to get 
this set up, have absolutely no idea how, and am pertrified at 
the prospect:

I currently have an iptables/Netfilter firewall router configured 
thusly:

                               WAN
                                  |
 (192.168.x.x) LAN --  fw -- DMZ (10.x.x.x)

OK, pretty basic.  And, it has worked well for a long time.

Now, I need to add a second WAN (provided by a second provider).  
I need it to serve specific boxes in the DMZ, both inbound and 
outbound.  Currently, all boxes in the DMZ are served by the 
single WAN connection.  I'm not sure what other information I 
need to provide you, but I'm hoping you all can help with very 
specific instructions or a very detailed how-to so I can get this 
accomplished.  And, of course, I need to get this done yesterday.

Many thanks.

Dimitri

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

