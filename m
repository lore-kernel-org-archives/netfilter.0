From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables local port forwarding
Date: Mon, 5 Apr 2004 18:44:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404051844.35289.Antony@Soft-Solutions.co.uk>
References: <20040403095005.GA4511@scholars.home> <200404031127.02648.Antony@Soft-Solutions.co.uk> <20040404110341.GA13605@scholars.home>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040404110341.GA13605@scholars.home>
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

On Sunday 04 April 2004 12:03 pm, Mark Ord wrote:

> On Sat, Apr 03, 2004 at 11:27:02AM +0100, Antony Stone wrote:
>
> > The only thing I can think to ask is whether "iptables -L -t nat -nvx"
> > shows the packet/byte counters for this rule incrementing when you do try
> > to access port 81?
>
> They're not. External connections do (elsewhere on the LAN, or from the
> internet, but we already know that, as those redirects work), but
> connections from the iptables machine never show up in the nat table.

Hey - wait a minute - did I miss something there?   You're trying to NAT 
packets from the netfilter machine itself in the PREROUTING chain???

No - won't work.

Sorry, I thought you were trying to get this working from the Internet - I 
must have missed something in a previous posting about trying to do it from 
the machine itself.

> Now that I have a bit more of an idea what is going on, I've done
> another search, can hit this, which says that this actually isn't
> possible, as the PREROUTING table is bypassed on local connections.

I agree.   You have to do it in the nat table of the OUTPUT chain (that's why 
it's there).

Regards,

Antony.

-- 
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the list;
                                                           please don't CC me.


