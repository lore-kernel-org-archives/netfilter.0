From: Daniel Dorau <daniel.dorau@alumni.tu-berlin.de>
Subject: QUEUE target question
Date: Sat, 17 Apr 2004 16:04:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082210643.10961.6.camel@haktar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello list,

I played around with the QUEUE target but am not sure if it fits my
needs. What I would like to do is to process certain packets in user
space but then processing the next rules on the list as if the QUEUE
target rule wouldn't have matched. For me it looks as if there are only
NF_ACCEPT and NF_DROP foreseen as QUEUE result (at least that's what the
man page reads) but I would like to have something like
NF_PROCEED_WITH_NEXT_RULE.
I have seen there are other NF_ values like NF_QUEUE, NF_STOLEN and
NF_REPEAT, but I didn't understand what they actually do.
Did I miss something or how can I resume rule processing after
processing my QUEUE rule?

Thank you,
Daniel Dorau

P.S. Please CC me as I'm not on the list.

-- 
Daniel Dorau
daniel.dorau@alumni.tu-berlin.de



