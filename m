From: Jason Opperisano <opie@817west.com>
Subject: Re: "No chain/target/match by that name" when using -m state
Date: Wed, 22 Jun 2005 11:26:43 -0400
Message-ID: <20050622152643.GA12373@bender.817west.com>
References: <87eeecff050622080541743401@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <87eeecff050622080541743401@mail.gmail.com>
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

On Wed, Jun 22, 2005 at 06:05:21PM +0300, Ami Ganguli wrote:
> Hi all,
> 
> I've been searching around for the answer to this and I've finally
> given up trying to solve it on my own.  Any hints would be much
> appreciated.
> 
> I'm entering the following command (cut and paste from the command line):
> 
>      iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> which appears in various docs.  It looks pretty straightforward, but I
> get this error:
> 
>     iptables: No chain/target/match by that name
> 
> If I enter the same command without  "-m state --state
> ESTABLISHED,RELATED" it's accepted, so I figure my problem is there
> somewhere.
> 
> I thought that maybe my kernel (2.6.11.10, ARCH=xen) was compiled
> without connection tracking, but dmesg includes the following:
> 
>     ip_tables: (C) 2000-2002 Netfilter core team
>     ip_conntrack version 2.1 (1024 buckets, 8192 max) - 244 bytes per conntrack
> 
> also, if I enter "iptables -m state --help" I get the normal help with
> this at the end:
> 
>      state v1.2.11 options:
>           [!] --state [INVALID|ESTABLISHED|NEW|RELATED|UNTRACKED][,...]
>                                 State(s) to match
> 
> so I figure I must have the necessary bits installed.
> 
> Any ideas or hints on what I should do next to debug this?

it sounds like your kernel doesn't have support for the state match,
which would be...rather odd.

i'd start by checking:

  cat /proc/net/ip_tables_matches 
    (specifically:  grep state /proc/net/ip_tables_matches)
  cat /proc/net/ip_tables_names
  cat /proc/net/ip_tables_targets

and

  lsmod | grep ^ip
    (specifically:  look for ipt_state)

and

  grep _NF_ /path/to/running/kernel/config
    (specifically:  look for CONFIG_IP_NF_MATCH_STATE)

-j

--
"Dennis Miller: I don't want to go on a rant, here, but America's
 foreign policy makes about as much sense as Beowulf having sex
 with Robert Fulton at the first battle of Antietam. I mean when
 a neo-conservative defenestrates it's like Raskolnikov filibuster
 deoxymonohydroxinate...
 Peter: What the hell does rant mean?"
        --Family Guy

