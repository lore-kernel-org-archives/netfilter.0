From: Dax Kelson <Dax.Kelson@gurulabs.com>
Subject: Re: SNAT & Squence Numbers
Date: 12 Nov 2002 01:22:42 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037089362.16667.13.camel@thud>
References: <3DCFE7AC.9867DF43@bomberjacketproductions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DCFE7AC.9867DF43@bomberjacketproductions.com>
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
To: mike bramm <mike.bramm@bomberjacketproductions.com>
Cc: netfilter@lists.netfilter.org

On Mon, 2002-11-11 at 10:23, mike bramm wrote:
> Hi, 
>     I'm a Router/PIX guy that is just getting into the Linux/IPTables
> scene. I've read the man pages and searched the web for information on
> IPTables. And I'm not able to find answers to some of my questions.
> Maybe you can help? 
>       * If SNAT is configured for many to one (PAT), then I would
>         presume that the connections are tracked by sequence numbers.
>         Are the sequence numbers picked randomly, like the PIX? And is
>         there a range in with they are picked from? What mod does
>         this?

AFAIK, the sequence numbers are left intact. I could be wrong though. A
quick check with a packet sniffer should answer this.

>       * A syntax question. I've looked at alot of syntax examples and
>         I've noticed one character that I can't seem to match up with
>         any of the tutorials or man
>         pages.                                                                                                         $IPTABLES -A INPUT $WAN_IFACE \ -j DROP   What the heck is "\"? It looks like it would be used to separate the match and the target, but is not really necessary. Is this just a personal preference or is it needed?

This isn't iptables syntax at all. 

The "\" at the end of a line is known as the continuation character.
This is bourne shell syntax. It means that the next line should be
treated as a continuation of the current line. The "\" character NOT at
the end of the line, is the escape character and removes any special
treatment of the following character and causes it to be treated
literally.

Dax


