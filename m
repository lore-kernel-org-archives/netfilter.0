From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Squid start problem
Date: Wed, 19 Nov 2003 08:55:19 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311190855.hAJ8tOj23697@agate.rockstone.co.uk>
References: <093501c3ae65$4b0737c0$7700000a@lawrencewin2k>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <093501c3ae65$4b0737c0$7700000a@lawrencewin2k>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Wednesday 19 November 2003 6:20 am, Lawrence Tang wrote:

> Hi,
>
>     I had just finish install RH9.0 and try to activate the SQUID. When I
> activate the service, it showing the following message. Please advice.
> Thanks in advance.
>
> squid failed. The error was: init_cache_dir /var/spool/squid...
> /etc/init.d/squid: line 162: 2098 Aborted $SQUID -z -F -D 2>/dev/null
>
> Starting squid: /etc/init.d/squid: line 162: 2099 Aborted $SQUID
> $SQUID_OPTS 2>/dev/null
>
> [FAILED]

I recommend you ask this question on the Squid mailing list, not the 
Netfilter one - there are likely to be more people there who can answer it :)

By the way, if you do post the question there, include any further details 
which get output in your syslog or squid.log files too.

Antony.

-- 

"I'm doing a (free) operating system (just a hobby, won't be big and 
professional like gnu) for 386(486) AT clones.

It is NOT portable , and it probably never will support anything other than 
AT-harddisks, as that's all I have :-(."

 - Excerpt from posting to comp.os.minix by Linus Torvalds, 25 Aug 1991
                                                     Please reply to the list;
                                                           please don't CC me.

