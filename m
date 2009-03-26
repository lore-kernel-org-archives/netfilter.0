From: aragonx@dcsnow.com
Subject: Identifiying and modifying packets
Date: Thu, 26 Mar 2009 14:24:13 -0400 (EDT)
Message-ID: <e4bd24ae0b0148637ca48bf14e29b27a.squirrel@www.dcsnow.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello all,

I have an application that was written to work on an internal network. 
Now, there is a requirement that we provide access from the Internet.  No
big deal so far.  We setup a Suse Linux box that acts as a gateway and all
works well.

However, this application has certain group accounts that we feel are
dangerous to allow access from the Internet.  We can't get the source code
to the application but the usernames are sent in clear text from the Linux
box to the application server.

Can someone tell me what tools I could use to examine outbound packet data
for the usernames and modify it if it matches a list of accounts we want
to block?

I suggested we just drop them but this causes the application to crash.

Any suggestions would be greatly appreciated.

---
Will Y.



-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

