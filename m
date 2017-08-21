From: Jeff Kletsky <netfilter@allycomm.com>
Subject: Re: "Test" mode for nft?
Date: Mon, 21 Aug 2017 10:54:17 -0700
Message-ID: <a8dbbb49-6583-f670-78ed-4208b0689288@wagsky.com>
References: <27b5c43e-a173-b292-3878-e655f53a2dc2@allycomm.com>
 <A9D44313-3B7A-4BD0-A308-AFA150BA50A1@nativemethods.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <A9D44313-3B7A-4BD0-A308-AFA150BA50A1@nativemethods.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org
Cc: J Doe <general@nativemethods.com>

Thanks, good to know I wasn't missing anything.

The cron job certainly works in a development environment. There is also=20
the approach to use a script that captures the current state, loads the=20
new rules, then waits for keyboard input for a length of time. If there=20
isn't a "yes, keep these" response, it reverts to the previous state.

It's not under GPL, but one example of this can be found in FreeBSD,=20
tailored for use with ipfw:

https://svnweb.freebsd.org/base/releng/11.1/share/examples/ipfw/change_rule=
s.sh


Jeff



On 8/21/17 9:09 AM, J Doe wrote:
> Hi Jeff,
>
> As far as I know there is not a command line option for nft to parse=20
> the syntax to check that it is correct and then NOT apply the ruleset.=20
> =C2=A0I know pf (Mac OS X and OpenBSD), has this and it's quite handy.
>
> The wiki does have documentation for how to debug the rules (testing=20
> what rule fires on what packet, etc.), at [1] but doesn't mention=20
> syntax checking.
>
> If you are accidentally locking yourself out you could create a cron=20
> job that calls "nft rule flush ruleset" to drop the firewall and=20
> schedule it to run every few minutes or so.
>
> - J
>
> Sources:
> [1]=20
> https://wiki.nftables.org/wiki-nftables/index.php/Ruleset_debug/tracing

