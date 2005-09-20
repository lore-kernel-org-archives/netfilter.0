From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: snat to multiple source ip
Date: Tue, 20 Sep 2005 17:16:37 +0200
Message-ID: <BAY103-DAV75C3E4AD57493EED86A5BB2950@phx.gbl>
References: <E656E2CC1C5AEB42ACB00EB83122C7742E2CBD@farmer.vikus.com>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Derick Anderson wrote:

> Uneducated, lazy guess: the SNAT target supports only one "--to [IP]"
> and the command parser ignores the extraneous "--to [IP2]". You can
test
> this by switching the two IPs and see if you go out on a different
> address.

Nope!

From "man iptables":

"...You  can  add  several --to-source options.  If you
specify more than one source address, either
via an address range or multiple --to-source options, a
simple round-robin (one after another in
cycle) takes place between these adresses."


