From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables user defined chains disappear after a few hours ...
Date: Tue, 10 Feb 2004 12:36:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402101236.57066.Antony@Soft-Solutions.co.uk>
References: <1076413370.2747.23.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1076413370.2747.23.camel@raylinux.internal>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Tuesday 10 February 2004 11:42 am, Ray Leach wrote:

> Hi
>
> Has anyone encountered the above before?

Do you perhaps have some cron job running on your system which periodically 
reloads some standard ruleset, and this ruleset doesn't include the 
user-defined chains which you've added by hand?

Make a careful note of the exact time the chains disappear, put them back in, 
and see when they disappear again.   The two times may give you a clue as to 
what to look for on your system.

I'd be pretty certain this is not netfilter losing chains all by itself.

Antony.

-- 
G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

                                                     Please reply to the list;
                                                           please don't CC me.


