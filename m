From: Jason Opperisano <opie@817west.com>
Subject: Re: I need a clever solution for two Bittorrent machines behind a
	firewall
Date: Thu, 18 Nov 2004 12:43:09 -0500
Message-ID: <20041118174309.GA16065@bender.817west.com>
References: <00c801c4cd90$8980f090$0400a8c0@bradmorgan>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <00c801c4cd90$8980f090$0400a8c0@bradmorgan>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Nov 18, 2004 at 10:03:33AM -0700, Brad Morgan wrote:
> I'm using a Linux firewall with IPTables as my home firewall.  Both my son
> and I are gamers and my son actually has a couple of machines so he and his
> friends can game together.
> 
> Blizzard's new World of Warcraft uses a custom Bittorrent for their patches
> and it looks like both my son and I will be playing this one.  At the
> moment, I manually switch the target computer before going online (we only
> had one login during the open beta) but since you don't know until you login
> if there's a patch and we may buy two copies for simultaneous use, I'd like
> to figure out how a clever way to switch the target machine "on the fly" so
> we both take advantage of the increased download speed of a cooperating
> Bittorrent client.  I've experienced the speed difference because our first
> install didn't have any ports open and it was SLOW (over an hour).  The
> second install took maybe 10 minutes to download patches with the proper
> ports open and forwarded.
> 
> Anyone have any suggestions?  Pointers to solutions or other places to ask
> the question will be gladly accepted.

i suppose it depends on the flexibility of the bittorrent client.  the
one i use has the option to specify my "incoming TCP listen port."
so each machine behind the firewall just needs to specify a different
port, and you can forward accordingly.

i'm not familiar with the game your talking about or how it implements
its BT client.

-j

--
"The only monster here is the gambling monster that has enslaved your
 mother! I call him Gamblor, and it's time to snatch your mother from
 his neon claws!"
        --The Simpsons

