From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Re: iptables help
Date: Thu, 29 Jul 2004 22:28:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407292228.48991.Antony@Soft-Solutions.co.uk>
References: <Pine.LNX.4.44.0407291026030.2121-100000@ivanhoe.pcraft.com> <200407291928.48974.Antony@Soft-Solutions.co.uk> <4109698E.9010703@pcraft.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4109698E.9010703@pcraft.com>
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

On Thursday 29 July 2004 10:18 pm, Ashley M. Kirchner wrote:

> Antony Stone wrote:
> >where w.x.y.z could be 192.168.38.64/29 for example, to block destination
> >addresses 192.168.32.64 to 192.168.38.72
>
>     Heh, I just realized this won't help a whole helluva lot because
> www.yahoo.com's round-robin setup isn't contiguous:
>
>     And neither is www.hotmail.com (which redirects to passport.net anyway:
>
>     Do you suppose there are servers on the missing IPs, but they're
> just not operational at the moment?  (Which wouldn't surprise me to be
> honest.)

One way of looking at this is: "what does it matter anyway?"

Just block all TCP destination port 80 to the entire contiguous blocks - I 
really can't imagine there are going to be any interesting websites in the 
middle of the IPs of the ones you want to block, and restricting the rule to 
port 80 means you don't affect any other services such as DNS or SMTP.

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


