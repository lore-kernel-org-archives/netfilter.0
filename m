From: Luigi Rizzo <rizzo@iet.unipi.it>
Subject: new ipfw/dummynet releases available (also netmap enabled)
Date: Mon, 13 Aug 2012 13:06:51 +0200
Message-ID: <20120813110651.GA79223@onelab2.iet.unipi.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have updated the ipfw/dummynet code for Linux, which should now compile
cleanly also on recent version of the OS. You can find it at

	http://info.iet.unipi.it/~luigi/dummynet/

(dummynet is a packet scheduler/link emulator that works together
with ipfw, a flexible packet classifier).

Also of possible interest, I just finished a netmap-enabled version
of the above, which runs in userspace and is able to process over
6 million packets per second (Mpps) with simple rulesets, and over
2.2 Mpps through dummynet pipes (tested on an i7-3400 connected to
VALE ports -- VALE is a software switch part of netmap).

	http://info.iet.unipi.it/~luigi/dummynet/#8696

To run this you might want to use the most recent version of netmap,
also recently updated so it works with recent kernels

	http://info.iet.unipi.it/~luigi/netmap/

cheers
luigi
