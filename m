From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: how to write different ip sources on a single rule
Date: Thu, 28 Sep 2006 14:46:24 +0200 (CEST)
Message-ID: <59382.193.173.147.3.1159447584.squirrel@webmail.sterenborg.info>
References: <51300.193.173.147.3.1159443754.squirrel@webmail.sterenborg.info>
	<OF19100943.C82981C2-ONC22571F7.00439BBB-C22571F7.004445A5@gunessigorta.com.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OF19100943.C82981C2-ONC22571F7.00439BBB-C22571F7.004445A5@gunessigort
	a.com.tr>
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
To: netfilter@lists.netfilter.org

On Thu, September 28, 2006 14:22, Burak Ozgoren wrote:
> I know about range, and mask but need a rule like for example:
>
> Accept port 22 connections from 192.168.0.5, 10.10.60.163, 212.12.X.X
>
> Now i am writing 3 different rules for these.

You can't with iptables, but although I'm not familiar with it myself, I
thought you could do (something like) this with ipset.

http://ipset.netfilter.org/features.html


Grts,
Rob



