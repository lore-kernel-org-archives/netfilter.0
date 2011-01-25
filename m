From: Dennis Jacobfeuerborn <dennisml@conversis.de>
Subject: conntrack table limits
Date: Tue, 25 Jan 2011 12:45:52 +0100
Message-ID: <4D3EB7F0.5020702@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
I'm trying to find out how high I can set conntrack_max on a 2GB 64 bit 
system. On the net I found different ways of calculating this but they seem 
to end up with different results. One forumla tells me that I can fit a 
maximum of 65535 connections into 2GB of RAM but the other says that with 
304 bytes per connection (plus a bit of slab allocation overhead) I can 
easily fit more than a million connections into the table.
Also even with the current limit 65535 and the table having ca. 30.000 
entries I've almost 1.8GB ram free/cached which leads me to believe the 
second way of calculating this is more accurate.
What is the proper way to calculate this?

Regards,
   Dennis
