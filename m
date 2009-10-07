From: Fabio Marcone <fabio.marcone@duet.it>
Subject: CONNMARK howto
Date: Wed, 07 Oct 2009 10:15:18 +0200
Message-ID: <4ACC4E16.3050001@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,
I'm looking for some docs to understand how to use restore-mark and 
save-mark in details.

Google search didn't help me: I found only simple examples, but I need 
to understand how use restore-mark and save-mark on traffic through a 
router (with lan and wan interface). I need to mark packets in 
PREROUTING on LAN interface because I need to filter by workstation mac 
addresses.

Thanks in advance,
Fabio
