From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Selective Masquerading
Date: Sun, 25 Apr 2004 22:49:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404252249.42702.Antony@Soft-Solutions.co.uk>
References: <BAY8-F97Fk2H3b98Ktd0002fb6f@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY8-F97Fk2H3b98Ktd0002fb6f@hotmail.com>
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

On Saturday 24 April 2004 5:14 pm, Edgar Estrada Lopez wrote:

> HI guys:
>
> I have a DSL @ 1mb, and another one @ 256kbps
>
> While giving a deep thought on why I got the 2 dsl, the answer is simple:
> So I could have fast downloads, and fast web browsing also.
>
> So I was thinking: is there a way to masquerade  / direct all web browsing
> to the 256dsl, and leave the rest of the communications (higher ports) to
> the 1 mbps line?

I'm sure you can do this either with iproute2 on its own, or if not then 
certainly by routing packets based on a MARK, and MARKing them in netfilter 
based on destination port number.

However, I have to ask - what sort of traffic are you generating which can use 
a 1Mbps line for "downloads", which is not HTTP?   I realise that you could 
be using FTP, or rsync, however I suspect you mean p2p networking, and you 
should check that this really isn't using TCP port 80 - otherwise there's no 
way of distinguishing the two types of traffic.

Of course the other way to do it would be to use an HTTP proxy such as Squid 
which has a default route pointing up the 256k DSL, and the default gateway 
for other machines going up the 1M DSL...

Regards,

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


