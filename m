From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Determine the netfilter load
Date: Tue, 9 Jan 2007 16:03:11 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701091602230.31427@yvahk01.tjqt.qr>
References: <64de5c8b0701072336q6ff16d57ra2ba56cde9cbf0dd@mail.gmail.com>
	<Pine.LNX.4.61.0701082125430.23737@yvahk01.tjqt.qr>
	<64de5c8b0701082122t2fcd4d9bh6850a20769faf901@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <64de5c8b0701082122t2fcd4d9bh6850a20769faf901@mail.gmail.com>
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
To: Rajkumar S <rajkumars@gmail.com>
Cc: netfilter@lists.netfilter.org


> On 1/9/07, Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
>> On Jan 8 2007 13:06, Rajkumar S wrote:
>> > importantly how do I know if this packet rate is hitting or about to
>> > hit any limits? How much more pps will my system take?
>> 
>> If any packets you feed in don't come out again (two network cards - a
>> forwarding setup)
>
> Exactly the scenario I want to avoid :)

Nah, the suggestion was: flood your box, and see when it drops, then you 
know the packet rate your cpu+ruleset can handle.


	-`J'
-- 

