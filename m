From: trainier@kalsec.com
Subject: Re: irc
Date: Mon, 17 Nov 2003 15:55:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF3489540F.204A1A44-ON85256DE1.0071CE7C-85256DE1.0072EC94@kal.kalsec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

The ident thing is partially true.  EFnet (the network I use), does claim 
to require ident.  If you actually look though, it initiates the 
connection, before it sends out it's ident request. 

I am not concerned at all with dcc.  dcc was a huge mistake and should've 
never been implemented into irc. 
I am, however, interested in the nat irc handlers.  Where do I get them 
and how do I use them? What're they for?

Regards,

Tim




Antony Stone <Antony@Soft-Solutions.co.uk>
Sent by: netfilter-admin@lists.netfilter.org
11/17/2003 03:05 PM

 
        To:     netfilter@lists.netfilter.org
        cc: 
        Subject:        Re: irc


On Monday 17 November 2003 7:56 pm, Alistair Tonner wrote:

>                If you've several systems that want to connect and do DCC 
you
>                will want to make sure you load the conntrack and nat irc
>                handlers from iptables ... they aren't needed for plain 
connections,
>                but are for DCC sends/recieves.

Indeed, however I assumed that anyone interested in the security of having 
a 
firewall wouldn't be using insecure things like DCC.   However, your 
reminder 
that there is a conntrack helper for this protocol is a good one.

>                As a rule these days a LOT of irc servers want an identd 
reply ...
>                identd is a horrible security problem, but you can use 
several
>                alternatives ... I've a python script that acts as a 
chrooted identd
>                server -- works a charm replying with random numbers ....

You mean they actually require an identd response before allowing a 
connection (rather than just making it take a bit longer than usual)?

What's the point in that?   It adds nothing to security, adds very little 
to 
logging opportunities, and only interferes with people trying to keep 
their 
networks to themselves.

Ho Hum; it's a strange world on the Internet....

Antony.

-- 

The idea that Bill Gates appeared like a knight in shining armour
to lead all customers out of a mire of technological chaos
neatly ignores the fact that it was he who, by peddling
second-rate technology, led them into it in the first place.

 - Douglas Adams in The Guardian, August 25, 1995
                                                     Please reply to the 
list;
                                                           please don't CC 
me.





