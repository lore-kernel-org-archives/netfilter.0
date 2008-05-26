From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ipt_recent: how long does a violater stay in the bad guys
 list?
Date: Mon, 26 May 2008 14:40:02 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805261437050.19084@fbirervta.pbzchgretzou.qr>
References: <462705.29117.qm@web37105.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <462705.29117.qm@web37105.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Akhil Sharma <goodpriest@yahoo.com>
Cc: netfilter@vger.kernel.org

On Thursday 2008-05-22 17:16, Akhil Sharma wrote:

>Question: in ipt_recent, if a client is added to a hitlist 
>(/proc/net/ipt_recent/hitlist) after having violated a rule of sending 
>over 10 packets in a minute, how long is the entry maintained in the 
>list? Does it ever get removed from the hitlist? Instead, would it just 
>track the last time the packets arrived and never get removed from the 
>hitlist until the PC is rebooted?

The list keeps a number of timestamps the client last sent a packet (at 
least it seems so); when a new timestamp is added to the head of the 
list, one gets evicted at the tail if the list has already reached 
its maximum length.
Whether or not a packet subsequently matches the rule depends not on the 
number of timestamp values recorded, but on the parameter you specified 
in your rule (--seconds, etc.).
