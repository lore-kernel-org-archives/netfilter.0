From: Akhil Sharma <goodpriest@yahoo.com>
Subject: ipt_recent: how long does a violater stay in the bad guys list?
Date: Thu, 22 May 2008 08:16:35 -0700 (PDT)
Message-ID: <462705.29117.qm@web37105.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Question: in ipt_recent, if a client is added to a
hitlist
(/proc/net/ipt_recent/hitlist) after having violated a
rule of sending over 10
packets in a minute, how long is the entry maintained
in the list? Does it ever
get removed from the hitlist? Instead, would it just
track the last time the
packets arrived and never get removed from the hitlist
until the PC is
rebooted?


      
