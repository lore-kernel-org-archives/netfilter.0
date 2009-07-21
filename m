From: Fabio Marcone <fabio.marcone@duet.it>
Subject: IMQ and marking
Date: Tue, 21 Jul 2009 13:08:20 +0200
Message-ID: <4A65A1A4.4020805@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi!
I'm studying how to introduce traffic shaping in a linux router 
(debian). I mark packets in prerouting using mac source to forward 
packets on a selected WAN interface.
I need to use mangle in PREROUTING to send packects (in input) to a imqX 
interface.
Is there a conflict between mark and IMQ?
If so, how it can be solved?

Thanks in advance,
Fabio Marcone
