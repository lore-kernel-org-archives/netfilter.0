From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is it possible to forward broadcasting with IPtables?
Date: Wed, 7 Apr 2004 12:14:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404071214.40138.Antony@Soft-Solutions.co.uk>
References: <000001c41c90$8a969810$1664640a@Younger>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c41c90$8a969810$1664640a@Younger>
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

On Wednesday 07 April 2004 12:07 pm, Younger Wang wrote:

> If the broadcast packets traverse the chains, they should be put to
> INPUT chain. Is there a way to transfer a packet from INPUT chain to
> FORWARD chain?

DNAT in PREROUTING?

In theory this would do what you want, however I'm sure it won't work.

Regards,

Antony.

-- 
The idea that Bill Gates appeared like a knight in shining armour to lead all 
customers out of a mire of technological chaos neatly ignores the fact that 
it was he who, by peddling second-rate technology, led them into it in the 
first place.

 - Douglas Adams in The Guardian, 25th August 1995

                                                     Please reply to the list;
                                                           please don't CC me.


