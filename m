From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: Change iptables log format (would be a nice feature)
Date: Tue, 7 Oct 2003 13:11:55 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <021901c38ced$ba4cd0c0$49caa8c0@caris.priv>
References: <Pine.LNX.4.56L0.0310021637520.11122@sutsko.kollegie.dk> <1065456746.1189.32.camel@valhalla>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Chris Brenton <cbrenton@chrisbrenton.org>, "Lasse B. Jensen" <gymer@odense.kollegienet.dk>
Cc: netfilter@lists.netfilter.org

I wrote a sed script to make my logs viewable ( however I had to download a
newer version of sed than the one that came with rh8 as the precompiled
version of sed would not support the ability to pipe the output of a tail -f
to sed.  See my command line command below.

----------------------------------------------------------------------------
-----------------------------
#!/bin/sh
dirc=/var/log/messages
msed="/usr/local/bin/sed -e"
tail -f $dirc |$msed 's/ kernel[^ ]*//;s/ MAC[^ ]*//;s/ LEN=.*PROTO/
PROTO/;s/ CODE=.*//;s/ WINDOW=.*//;G'
----------------------------------------------------------------------------
--------------------------------

When you run this script you will get output something like this
Oct  7 12:42:03 myserver DROP cnet-cdmz: IN=eth2 OUT=eth1 SRC=209.6.195.178
DST=192.168.10.2 PROTO=TCP SPT=3033 DPT=135

----- Original Message ----- 
From: "Chris Brenton" <cbrenton@chrisbrenton.org>
To: "Lasse B. Jensen" <gymer@odense.kollegienet.dk>
Cc: <netfilter@lists.netfilter.org>
Sent: Monday, October 06, 2003 1:12 PM
Subject: Re: Change iptables log format (would be a nice feature)


> On Thu, 2003-10-02 at 10:40, Lasse B. Jensen wrote:
> >
> > Is it possible to change the log format of iptables?
>
> As others have pointed out this is not possible, however it might make a
> nice feature to be added in. I've noticed that in high bandwidth
> environments what chokes throughput the most is logging. This
> materializes as the boxes throughput topping out quicker as well as
> garbled/partial log entries being written.
>
> I *strongly* feel that one of Netfilter's biggest strengths is the level
> of detail in the logs and would hate to see that change. When your
> pushing high speeds however, your choices come down to collecting
> verbose info (and thus limiting throughput) or not collecting log
> entries. An option that permits a terse log format (say IPs, ports &
> transport only) might be a nice balance.
>
> Just my $.02,
> Chris
>
>
>


