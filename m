From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewall Script Help
Date: Mon, 8 Mar 2004 20:32:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403082032.57107.Antony@Soft-Solutions.co.uk>
References: <JKELJHHMDHPOLKFBOEGHMECLFDAA.cldavis@speakeasy.net> <200403082012.34162.lists@edeca.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403082012.34162.lists@edeca.net>
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

On Monday 08 March 2004 8:12 pm, David Cannings wrote:

> >     0     0 DROP       tcp  --  any    any     anywhere
> > anywhere           tcp flags:FIN,ACK/FIN
>
> As I understand it, this means "check the flags FIN and ACK, only match if
> FIN is set and ACK isn't".  This would match packets that only have the
> FIN flag set, which I am fairly sure are valid.  I may need correcting on
> this issue, however.

You are correct.

TCP connections start with:
packet 1: SYN (only) from the client
packet 2: SYN/ACK from the server
packet 3: ACK from the client
all further packets have the ACK flag set from both client and server

and then they end with
packet n-3: FIN (only) from the side which wants to stop talking
packet n-2: FIN/ACK from the other side
packet n-1: FIN (only) from the other side (to confirm it will stop talking 
too)
packet n: FIN/ACK from the side which ended the communication

(Although note that the final two packets are optional and often not seen, 
indeed often blocked by netfilter because by that time it thinks the 
connection is no longer ESTABLSIHED.)

Regards,

Antony.

-- 
What is this talk of "software release"?
Our software evolves and matures until it is capable of escape, leaving a 
bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the list;
                                                           please don't CC me.


