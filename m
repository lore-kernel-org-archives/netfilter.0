From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: irc
Date: Mon, 17 Nov 2003 20:05:53 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311172005.hAHK5uj22443@agate.rockstone.co.uk>
References: <OF35D63A47.696E0D67-ON85256DE1.0066888E-85256DE1.0066CA71@kal.kalsec.com> <200311171929.hAHJTrj22410@agate.rockstone.co.uk> <200311171456.22866.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311171456.22866.Alistair@nerdnet.ca>
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

On Monday 17 November 2003 7:56 pm, Alistair Tonner wrote:

> 	If you've several systems that want to connect and do DCC you
> 	will want to make sure you load the conntrack and nat irc
> 	handlers from iptables ... they aren't needed for plain connections,
> 	but are for DCC sends/recieves.

Indeed, however I assumed that anyone interested in the security of having a 
firewall wouldn't be using insecure things like DCC.   However, your reminder 
that there is a conntrack helper for this protocol is a good one.

> 	As a rule these days a LOT of irc servers want an identd reply ...
> 	identd is a horrible security problem, but you can use several
> 	alternatives ... I've a python script that acts as a chrooted identd
> 	server -- works a charm replying with random numbers ....

You mean they actually require an identd response before allowing a 
connection (rather than just making it take a bit longer than usual)?

What's the point in that?   It adds nothing to security, adds very little to 
logging opportunities, and only interferes with people trying to keep their 
networks to themselves.

Ho Hum; it's a strange world on the Internet....

Antony.

-- 

The idea that Bill Gates appeared like a knight in shining armour
to lead all customers out of a mire of technological chaos
neatly ignores the fact that it was he who, by peddling
second-rate technology, led them into it in the first place.

 - Douglas Adams in The Guardian, August 25, 1995
                                                     Please reply to the list;
                                                           please don't CC me.

