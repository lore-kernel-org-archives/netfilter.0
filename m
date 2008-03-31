From: "ml@bortal.de" <ml@bortal.de>
Subject: Testing netfilter rules
Date: Mon, 31 Mar 2008 11:30:46 +0200
Message-ID: <47F0AF46.2040502@bortal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello List,

i would like to test my netfilter firewall. I am currently using ftester 
(http://dev.inversepath.com/trac/ftester) but i am not happy with that 
tool.
Has anyone got some alternatives? I want a client/server or slave/master 
to test my open ports.

Nmap, netcat or telnet does not do the job since i need to have 
something to listen at the other end. (with hundreds hosts and ports)

Is anyone using ftester or something similar?
As far as i can tell ftester does not make a valid tcp handshake, it 
just fakes it.

My aim is to check if my needed/wanted ports actually are allowed.

Thanks, Mario
