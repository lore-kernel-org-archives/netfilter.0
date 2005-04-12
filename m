From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: TCP packets with RST flag set but **not** ACK flag OK??
Date: Mon, 11 Apr 2005 23:22:02 -0500
Message-ID: <425B4CEA.3080303@riverviewtech.net>
References: <1113247121.3544.118.camel@seberino.spawar.navy.mil>	<425AF2B7.2050402@riverviewtech.net>
	<1113266214.2111.46.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113266214.2111.46.camel@grendel>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter <netfilter@lists.netfilter.org>

> RFC's define dropping packets as "A Bad Idea" (TM). See RFC 1812 for
> more details.

Are you sure that it's RFC 1812 "Requirements for IP Version 4 Routers"?  I'm finding more information in RFC 793 "Transmission Control Protocol Functional Specification".  Namely it is possible to see packets with the RST flag both with ACK set and ACK unset, depending on the situation.  Primarily having to do with what state the TCP conversation is in, established or not.

According to the "Half-Open Connections and Other Anomalies" section of RFC 793 the following seems to be the case.  Half-Open Connections are defined as follows, per RFC.  Half-Open Connections are defined as one end of the TCP conversation having closed the connection while the other still has it open.  Here is the text from the RFC, "An established connection is said to be  "half-open" if one of the TCPs has closed or aborted the connection at its end without the knowledge of the other, or if the two ends of the connection have become desynchronized owing to a crash that resulted in loss of memory.".

(Sorry, this could get rather lengthy.)

<RFC 793 - Half-Open Connections - paragraph 3>
...In an attempt to establish the connection, A's TCP  will send a segment containing SYN.  This scenario leads to the example shown in figure 10.  After TCP A crashes, the user attempts to re-open the connection.  TCP B, in the meantime, thinks the connection is open.

      TCP A                                           TCP B

  1.  (CRASH)                               (send 300,receive 100)

  2.  CLOSED                                           ESTABLISHED

  3.  SYN-SENT --> <SEQ=400><CTL=SYN>              --> (??)

  4.  (!!)     <-- <SEQ=300><ACK=100><CTL=ACK>     <-- ESTABLISHED

  5.  SYN-SENT --> <SEQ=100><CTL=RST>              --> (Abort!!)

  6.  SYN-SENT                                         CLOSED

  7.  SYN-SENT --> <SEQ=400><CTL=SYN>              -->

                     Half-Open Connection Discovery

                               Figure 10.

  When the SYN arrives at line 3, TCP B, being in a synchronized state,
  and the incoming segment outside the window, responds with an
  acknowledgment indicating what sequence it next expects to hear (ACK
  100).  TCP A sees that this segment does not acknowledge anything it
  sent and, being unsynchronized, sends a reset (RST) because it has
  detected a half-open connection.  TCP B aborts at line 5.  TCP A will
  continue to try to establish the connection; the problem is now
  reduced to the basic 3-way handshake of figure 7.

  An interesting alternative case occurs when TCP A crashes and TCP B
  tries to send data on what it thinks is a synchronized connection.
  This is illustrated in figure 11.  In this case, the data arriving at
  TCP A from TCP B (line 2) is unacceptable because no such connection
  exists, so TCP A sends a RST.  The RST is acceptable so TCP B
  processes it and aborts the connection.

  

        TCP A                                              TCP B

  1.  (CRASH)                                   (send 300,receive 100)

  2.  (??)    <-- <SEQ=300><ACK=100><DATA=10><CTL=ACK> <-- ESTABLISHED

  3.          --> <SEQ=100><CTL=RST>                   --> (ABORT!!)

           Active Side Causes Half-Open Connection Discovery

                               Figure 11.

  In figure 12, we find the two TCPs A and B with passive connections
  waiting for SYN.  An old duplicate arriving at TCP B (line 2) stirs B
  into action.  A SYN-ACK is returned (line 3) and causes TCP A to
  generate a RST (the ACK in line 3 is not acceptable).  TCP B accepts
  the reset and returns to its passive LISTEN state.

  

      TCP A                                         TCP B

  1.  LISTEN                                        LISTEN

  2.       ... <SEQ=Z><CTL=SYN>                -->  SYN-RECEIVED

  3.  (??) <-- <SEQ=X><ACK=Z+1><CTL=SYN,ACK>   <--  SYN-RECEIVED

  4.       --> <SEQ=Z+1><CTL=RST>              -->  (return to LISTEN!)

  5.  LISTEN                                        LISTEN

       Old Duplicate SYN Initiates a Reset on two Passive Sockets

                               Figure 12.

