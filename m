From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NATed and direct connection to one server
Date: Tue, 17 Feb 2004 20:45:38 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402172045.38969.Antony@Soft-Solutions.co.uk>
References: <40326B8E.10303@gmx.net> <200402171949.02795.Antony@Soft-Solutions.co.uk> <40327A98.1010603@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40327A98.1010603@gmx.net>
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

On Tuesday 17 February 2004 8:33 pm, Ben Goedeke wrote:

> Ok, thanks Antony.
>
> It's been bugging me for a few days now cause I just couldn't imagine
> the software being "intelligent" enough to make this so easy.

netfilter remembers the packets which it translates on the way out (source + 
destination IP address, source + destination port (if TCP or UDP)), and looks 
for packets coming back which match the other way round (source vs. 
destination).

When it sees such matching packets, it knows they must be replies to 
previously translated ones, so it automagically applies the reverse 
translation on the way back in.   Any packets which don't match ones 
previously sent, don't get automagically translated.

Antony.

-- 
How I want a drink, alcoholic of course, after the heavy chapters involving 
quantum mechanics.

 - 3.14159265358979

                                                     Please reply to the list;
                                                           please don't CC me.


