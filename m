From: Ed W <lists@wildgooses.com>
Subject: Need help with dialup connection (and syn packets)
Date: Sat, 23 Mar 2013 16:33:43 +0000
Message-ID: <514DD967.1080501@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi, I have a dialup connection (yes they still exist) and PPP with 
demand dial.  I have a problem with the exponential backoff sending new 
SYN packets when creating a new tcp connection. The problem is that the 
dialup connection takes around 23 seconds to complete (and then hangs up 
10 seconds later due to inactivitity), but by then the gaps between SYN 
packets is very long...

Unfortunately most operating systems send an initial SYN, then 
exponentially backoff with intermittent resends, say after 1 sec, 2 
secs, 4 secs, 8 secs, 16 secs, etc.  So what we observe is that because 
the dialup connection takes so long to complete, by then the tcp 
connection is only trying quite intermittently to connect, eg you might 
well wait another 8+ seconds before the next syn is resent, quite easily 
my demand dial connection will hangup before the retransmit is even fired...

Does anyone have any suggestions on how I might fake this a little? I 
effectively desire to simulate buffering syn packets before the PPP 
connection comes up?

Thanks for any off the wall thoughts...

Ed W
