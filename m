From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: port scan identification
Date: Wed, 9 Jun 2004 18:04:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406091804.01068.Antony@Soft-Solutions.co.uk>
References: <40C6D987.9050805@wanadoo.fr> <40C73CCA.4070804@wanadoo.fr> <1086799860.14435.49.camel@localhost>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1086799860.14435.49.camel@localhost>
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

On Wednesday 09 June 2004 5:51 pm, John A. Sullivan III wrote:

> Hmmm . . . I assume what you are trying to do is pick up all packets
> with the RST flag on that are not part of a current session, such as
> those used to probe a site.
>
> I'm a little rusty on when RSTs are sent.  If they are part of the
> packet stream, then I would think conntrack will pick it up and the
> legitimate RSTs would never hit your rule.  I assume you are using
> conntrack.  However, are RSTs sent when a stream is broken and thus sent
> as a separate data stream? I'd have to pull out an IP book to review the
> RST flag and why it would not be matched in conntrack.  Does anyone else
> know off the top of their head?

A RST packet *is* part of a data stream, in the sense that it contains a 
correct acknowledgement number in response to a previously-seen sequence 
number (otherwise anybody could send a RST with a spoofed source address and 
cut off your connections).

RST packets can be sent by either end of the connection (or for that matter by 
any router in between, which has access to the sequence numbers) at any time, 
and are intended to cut off the data flow abruptly, without going through the 
"FIN/ACK - ACK - FIN/ACK - ACK" which is defined for the normal end of a TCP 
connection.

Netfilter understands RST packets and will remove an entry from the connection 
tracking table as soon as it sees one, therefore any further packets which 
are seen between that client and server will no longer be regarded as part of 
an ESTABLISHED connection.

The reason it is common to see RST packets in logfile output from port scan 
detectors etc (or anything else which logs packets not part of established 
connections) is because many systems send three RST packets in a row, just to 
make sure at least one gets through to the other end.   The first one seen by 
netfilter will remove the conntrack table entry, so either of the other two, 
if seen, will be recorded as invalid packets.

Regards,

Antony.

-- 
The lottery is a tax for people who can't do maths.

                                                     Please reply to the list;
                                                           please don't CC me.


