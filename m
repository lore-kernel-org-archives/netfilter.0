From: Peter Warasin <peter@endian.com>
Subject: rules matching whether or not connection passed through QUEUE
Date: Tue, 09 Feb 2010 18:28:05 +0100
Message-ID: <4B719B25.1030800@endian.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

hi guys,

recently I run into a problem using the QUEUE target and I wonder if
there's a simple solution for it.

Is there an easier way for matching packets of a connection whose
initiation packet (NEW) has been QUEUE'd?
Something like -m queue --syn-passed-through-queue 0?




I have a snort-inline running which grabs packets from QUEUE target,
which is working fine.

Now, I have also an accept-all for ESTABLISHED and RELATED in INPUT and
FORWARD, which is one of the first rules in order to bypass all other
(many and complex) rules which handle only state NEW.
Quiet standard setup I would say.

Now I would like to pass some connections through QUEUE and other not.
That's the problem.
The accept-all should pass all consecutive packets of those connections
which went through QUEUE, also through QUEUE and other packets whose
initiating packet has been ACCEPT'ed previously should still be
ACCEPT'ed without sending through QUEUE.

Ok, I could remove that accept-all and ACCEPT or QUEUE
ESTABLISHED/RELATED packets before every single NEW accepting rule, but
then every packet of an accepted connection has to pass through all
those rules.


Thank you in advance

peter

-- 
:: e n d i a n
:: open source - open minds

:: peter warasin
:: http://www.endian.com   :: peter@endian.com
