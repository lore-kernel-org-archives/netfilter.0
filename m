From: Jason Opperisano <Jopperisano@alphanumeric.com>
Subject: RE: Netfilter vs commercial
Date: Mon, 9 Aug 2004 14:24:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051255@asimail2.alphanumeric.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> Sure, although it may reflect more of my ignorance than my sagacity :-)
>
> >From what I understand, the out of the box netfilter connection tracking
> sets timers for the dataflow and matches source and destination
> information and, for TCP, session states.  It does not match the
> acknowledgment and sequence numbers for TCP packets unless one adds the
> window tracking patch.  Someone please correct me if I am wrong.
>
> I cannot say so authoritatively but I believe out of the box Checkpoint
> does match ACK and SEQ - John

"out-of-the-box" check point fw-1 does not track seq/ack numbers.  the
"sequence verifier" can be enabled if one chooses to; however, it is
mutually exclusive with some other features (such as their connection
acceleration feature).  i meant to mention the tcp-window-tracking patch for
netfilter in my original reply.

just to reiterate--as far as responses to, "oh yeah?  well can your firewall
do this?" questions go--netfilter can hold up to check point extremely well.
maybe if the OP has some specific issues the higher-ups need addressed--we
can answer those in a new "can netfilter do X" thread.

and as an aside--i find it hard to believe that there are people out there
saying something along the lines of "we use commercial software becuase we
can sue the manufacturer if it breaks."  i know no one actual reads those
EULA's that are presented at install time--but they say "if this software
breaks, you can't sue us."  where was that big lawsuit against microsoft for
damages resulting from <insert favorite ms exploit here>?

-j

ps - IANAL

