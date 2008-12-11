From: rigoberto perez <rigo666beast@yahoo.com>
Subject: Why the tcp ckecsum involves the skuff checksum?
Date: Thu, 11 Dec 2008 08:19:04 -0800 (PST)
Message-ID: <264657.32644.qm@web33208.mail.mud.yahoo.com>
Reply-To: rigo666beast@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Friends:

In Linux implementation of the TCP checksum the functions using the checksum of the skbuff. Theoretically the TCP pseudo header only contains the both IP directions, the protocol (6), 1 byte reserved full of zeros and the segment length. So, in what form is used the skbuff checksum in this computation?. 

I suppose that the TCP level is not concern about netfilter modules. It's transparent. I mean, if I change the packet content in out direction and restore it in direction this change should be invisible to the uppers levels - including TCP level.

Thanks


      
