From: "Sascha Reissner" <sascha.reissner@toxicnet.de>
Subject: Re: iptables-save file syntax
Date: Thu, 10 Oct 2002 20:41:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007701c2708c$b4c42140$026410ac@honor>
References: <385DA3327471554CA86AACAA2BBB813025141C@plstnexc01.corp.networkrobots.com>
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
To: Yogini Parkhi <yparkhi@bivio.net>, Nicolas Cadilhac <cadilhac@cae.com>, netfilter@lists.netfilter.org

From: "Yogini Parkhi" <yparkhi@bivio.net>

> Hi Nicolas,
> Those are packet and byte counters. But I think they are ignored while
doing a restore.
> These lines are setting default policies for the default chains.
> [0:0] means packet and byte counters are zeros.

nope, those actually do get restored ;).. and thats why they are saved for..

if you want to do packet/byte counting via netfilter you would be busted
once you reboot the machine, since they'd be lost, if you save/restore the
ruleset they will still be instact.. this doesnt mean that netfilter is the
sollution for such couting problems (there are actually other tools that are
meant for that purpose). but its a nice goodie



