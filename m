From: Jim Cliver <jclive@mtaonline.net>
Subject: Re: bridge logging
Date: Thu, 18 Mar 2004 11:00:05 -0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4059FFC5.5040008@mtaonline.net>
References: <AD8D39C727CBD411BB2C0090273A727408F9F09C@mortimer.law.uconn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <AD8D39C727CBD411BB2C0090273A727408F9F09C@mortimer.law.uconn.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Hurley, Michael" <MHurley@law.uconn.edu>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hurley, Michael wrote:

> I've run into an odd snag. 
> Set up a bridge to protect a box that can't protect itself. Kernel 2.6.0,
> iptables 1.2.9. I'm trying to log some client-server interaction, so I
> created this rule:
> 
> iptables -A FORWARD -s $client -LOG --log-level 7 --log-prefix "IPT CLIENT:
> "
> iptables -A FORWARD -d $client -LOG --log-level 7 --log-prefix "IPT CLIENT:
> "
> 
> FORWARD policy is ACCEPT. There are *no* other rules or chains.
> 
> I redirect kern.7 messages into its own log. But no info is getting captured
> in there at all. tcpdump sees packets w/ client ip. 
> 
> What am I doing wrong and how can I log info going over the bridge to/from a
> particular ip?
> 
Hello Michael,

If you are attempting to perform this logging on a layer two (bridging) 
device then your logging rules will need to be based upon layer two 
addresses and not layer three (IP).  A bridge ordinarily does not see 
layer three addresses.

Regards,
jim


> 
> 
> /***************************************     .-"""-.
> Michael Hurley                              '       \ 
> Webmaster/SysAdmin                         |,.  ,-.  |
> University of Connecticut School of Law    |()L( ()| |
> mhurley@law.uconn.edu                      |,'  `".| |
> (860) 570-5233                             |.___.',| `
> ***************************************/  .j `--"' `  `.
>                                          / '        '   \
>                                         / /          `   `.
>                                        / /            `    .
>                                       / /              l   |
>                                      . ,               |   |
>                                      ,"`.             .|   |
>                                   _.'   ``.          | `..-'l
>                                  |       `.`,        |      `.
>                                  |         `.    __.j         )
>                                  |__        |--""___|      ,-'
>                                     `"--...,+""""   `._,.-' mh
> 
> 



