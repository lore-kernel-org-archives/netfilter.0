From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Re-2: Still having problems with forwarding
Date: Mon, 15 Mar 2004 09:16:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403150916.05197.Antony@Soft-Solutions.co.uk>
References: <DIIE.000000FD00002A60@sbgit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DIIE.000000FD00002A60@sbgit.com>
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

On Monday 15 March 2004 9:10 am, peter.gehle@sbgit.com wrote:

> > 1. Can you be more specific about exactly what problems you are having -
> > what
> > does work, what does not work, how are you testing it?
>
> Since i have made some changes i don't get an connection to my VPN Server,
> it seems that iptables don't forwards the vpn tunnel to my internet vpn
> server.

What did you change?

> i can't send any pings to the internet?
>
> also i can't connect to my Terminalserver.
>
> I think the whole forwading don't works?

If it did work before you made the changes, then I think knowing what you 
changed will point quite quickly to the problem.

> > 2. Is it possible that you can simplify your ruleset by removing rules
> > which
> > are nice to have, but have nothing to do with this problem (eg: the
> > rate-limited DROP rules, and the TCP flag matches), so that it is easier
> > to
> >
> > know what to focus on, and what is unimportant?
>
> I think i have to write a complete new firewall script, but at first i will
> try to get all working what i need.

Start simple and add things as you need, don't try to fix something which is 
both complicated and broken.

Regards,

Antony.

-- 
There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

                                                     Please reply to the list;
                                                           please don't CC me.



