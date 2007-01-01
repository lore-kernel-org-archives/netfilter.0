From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: chaostables-0.2 & 2.6.19.1
Date: Mon, 1 Jan 2007 16:23:53 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701011622040.21491@yvahk01.tjqt.qr>
References: <20070101143812.GA7816@vanheusden.com>
	<Pine.LNX.4.61.0701011541130.21491@yvahk01.tjqt.qr>
	<20070101151505.GE7816@vanheusden.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070101151505.GE7816@vanheusden.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Folkert van Heusden <folkert@vanheusden.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


On Jan 1 2007 16:15, Folkert van Heusden wrote:

>> >I'm trying to compile chaostables v0.2 on a system with kernel 2.6.19.1
>> >and c-compiler 3.4.6:
>> >/usr/src/chaostables-0.2/kernel/xt_CHAOS.c: In function `xt_chaos_target':
>> >/usr/src/chaostables-0.2/kernel/xt_CHAOS.c:53: error: too many arguments to function
>>
>> Yes I found this one this morning. The issue is simple: function 
>> signatures have changed in 2.6.19 and 2.6.20 which I did not all catch 
>> yet. chaostables compiles fine with 2.6.18 however. I shall have it 
>> workarounded in the next release. Thanks for noticing! (cc to 
>> linuxkernel and netfilter before more people run into the same problem)
>
>Not wanting to put you under pressure but when is that version expected?

Just about now, I just made a snapshot.
http://jengelh.hopto.org/f/chaostables/chaostables-0.3.tar.bz2
(The new (note above: snapshot) SREJECT is not complete. Just fixed the 2.6.19
and 2.6.20 compiles.)


	-`J'
-- 

