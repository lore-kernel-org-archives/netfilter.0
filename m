From: Pablo Neira <pablo@eurodev.net>
Subject: Re: iptables-restore: commit not at end of table
Date: Wed, 09 Mar 2005 14:45:20 +0100
Message-ID: <422EFDF0.7000302@eurodev.net>
References: <422EE146.1070808@geert.triple-it.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <422EE146.1070808@geert.triple-it.nl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Geert van der Ploeg <netfilter@geert.triple-it.nl>
Cc: netfilter@lists.netfilter.org

Geert van der Ploeg wrote:
> Hi all,
> 
> After updating a firewall from iptables 1.2.7a to a later version, my
> ruleset doesn't work anymore.
> It fails on COMMIT-lines that are not at the end of a table definition.
> I used commits for cutting my (sometimes quite large) rulesets into
> smaller parts and make sure I always keep a working configuration, even
> if some rules fail.
> 
> For example:
>  - define management-access definitions (allow SSH from
> management-stations, etc)
>  - COMMIT
>  - define other rules that get changed a lot and thus have a larger
> chance of containing errors.
> 
> 
> Having looked at the source-code, I discovered that it is caused by some
> extra checks on 'in_table' (in iptables-restore.c), which got inserted
> between 1.2.7a and 1.2.8. The changelog doesn't say why.


Could you try to reproduce such error with lastest iptables 1.3.1? If 
so, please post the complaining section of rules, it could be useful for 
debugging.

--
Pablo

