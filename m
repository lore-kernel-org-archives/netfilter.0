From: Fabrice MARIE <fabrice@netfilter.org>
Subject: Re: using iptables for poor-man's load balancing?
Date: Fri, 21 Feb 2003 16:48:16 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302211648.16894.fabrice@netfilter.org>
References: <HMEBKOCKLOOEJGIOMFAPAEGOFJAA.ian@icreditvision.com>
Reply-To: fabrice@netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HMEBKOCKLOOEJGIOMFAPAEGOFJAA.ian@icreditvision.com>
Content-Disposition: inline
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
To: Ian Douglas <ian@icreditvision.com>, netfilter@lists.netfilter.org


Hello Ian,

On Wednesday 19 February 2003 05:53, Ian Douglas wrote:
> We currently have two machines (soon to be 4) that we'd like to balance our
> web traffic to. Say for argument's sake that our public IP is 1.2.3.4 and
> our internal LAN machines are:
>   192.168.1.1
>   192.168.1.12
>   192.168.1.16
>   192.168.1.17
> Just curious if the following rules would work to round-robin the
> connections:
> [...]
> Thanks for any feedback or suggestions.

I believe you can do that with the nth patch:
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO-3.html#ss3.9
Even though I wrote the original patch, it's been greatly improved by Richard Wagner
<rwagner AT cloudnet.com> who added support for multiple counters and support for
matching on individual packets. [That's why I say "I believe" the match can do it].
It should work. Let us know of the outcome.

Have a nice day,

Fabrice.
--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown

