From: "Nadav Har'El" <nyh@math.technion.ac.il>
Subject: ip_conntrack bug and patchomatic question
Date: Tue, 8 Apr 2003 18:52:02 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030408155202.GA18273@fermat.math.technion.ac.il>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Running on Redhat 8.0, I noticed an apparent bug in connection tracking:

When a connection closes, conntrack moves it to the TIME_WAIT state that it
holds for 2 minutes, even if TIME_WAIT is not justified and the kernel
didn't actually go to a TIME_WAIT state in this case (i.e., the remote server
closed the connection first).

Looking at the code, I saw that ip_conntrack_proto_tcp.c simple contains a
wrong state table (at least to my understanding)! For example, here is the
state changes on outgoing packets:

   /*        sNO, sES, sSS, sSR, sFW, sTW, sCL, sCW, sLA, sLI      */
   /*syn*/ {sSS, sES, sSS, sSR, sSS, sSS, sSS, sSS, sSS, sLI },
   /*fin*/ {sTW, sFW, sSS, sTW, sFW, sTW, sCL, sTW, sLA, sLI },
   /*ack*/ {sES, sES, sSS, sES, sFW, sTW, sCL, sCW, sLA, sES },
   /*rst*/ {sCL, sCL, sSS, sCL, sCL, sTW, sCL, sCL, sCL, sCL },
   /*none*/{sIV, sIV, sIV, sIV, sIV, sIV, sIV, sIV, sIV, sIV }

Now, this says that when we're in the CLOSE_WAIT (sCW) state and sending
our FIN (i.e., we finally did close()), the state goes to TIME_WAIT (sTW).
This is *wrong*, to the best of my knowledge (and books I consulted to see
I am not imagining things) - the state should have been LAST_ACK (sLA).
In fact, in the table in the aforementioned code no state can ever lead
to LAST_ACK, which makes this state completely useless - which to me is
almost a proof there's an error somewhere in that table.

I checked in Redhat 9 that came out last week, and their kernel also
appears to include this error.

I'm a netfilter development newbie, but I saw on your site that there is a
tar of patches called "patchomatic". I wasn't exactly sure what these patches
apply to, but I thought I'd take a look and see if any patch fixes this
wrong state machine. I believe I found that extra/tcp-window-tracking.patch
modifies the state machine. Indeed, the table in that patch has a CW->LA
transition; That patch also has a lot of comments explaining this table,
which weren't present in the code I saw in Redhat 9. But I'm afraid that the
new state machine might have errors too, because I saw there that when we are
in LAST_ACK state, getting an ACK changes to TIME_WAIT, but I believe the
right new state is CLOSE...

So my questions are:

 1. Is there someone working on conntrack that I should send this question
    to, or is this list the correct address?

 2. Can the state table be corrected in conntrack in the vanilla kernel,
    rather than being (half-)corrected inside a big patch doing other things,
    and worse, a patch that Redhat doesn't seem to be picking up?

 3. When this problem is finally fixed, my connection will wind up in the
    CLOSE state in conntrack. In that state, the conntrack entry is kept for
    10 seconds. Why is that??? The CLOSE entries are meaningless, waste memory
    and worse, I'm afraid that perhaps they might prevent NAT from reusing
    the same addresses again... Can't entries moved to CLOSE state be
    removed immediately?

Thanks,
	Nadav.

-- 
Nadav Har'El                        |        Tuesday, Apr 8 2003, 7 Nisan 5763
nyh@math.technion.ac.il             |-----------------------------------------
Phone: +972-53-245868, ICQ 13349191 |Always remember you're unique, just like
http://nadav.harel.org.il           |everyone else.

