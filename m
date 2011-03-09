From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Log lines from the CLI, was  [ANNOUNCE] conntrack-tools 1.0.0
 released
Date: Wed, 09 Mar 2011 14:39:55 +0100
Message-ID: <4D77832B.3090803@netfilter.org>
References: <4D69B6BB.7020309@netfilter.org> <4D74DDEA.5060207@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D74DDEA.5060207@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org

On 07/03/11 14:30, Alessandro Vesely wrote:
> Hi!
> 
> On 27/Feb/11 03:28, Pablo Neira Ayuso wrote:
>> - The command line interface (CLI) conntrack that provides an interface
>> to add, delete and update flow entries, list current active flows in
>> plain text/XML, current IPv4 NAT'ed flows, reset counters, and flush the
>> complete connection tracking table among many other.
> 
> Although this is a command line tool, I guess it is mostly used in
> scripts, or execv'ed by other command line utilities according to some
> parameters, possibly non-interactively.  Thus, there is a usability
> concern about its output.
> 
> I would like to see regular lines such as "NNN flow entries have been
> deleted" at LOG_INFO, while something like "Operation failed: %s"
> possibly deserves LOG_CRIT.  Would it be possible to use dlog in
> conntrack.c?

The command line tool is not designed for logging. For that purpose you
can use ulogd2.
