From: "Harrison, Bruce (CXO)" <Bruce.Harrison@hp.com>
Subject: RE: snat to multiple source ip
Date: Tue, 20 Sep 2005 09:25:02 -0600
Message-ID: <2F75680A268354469586578F0712182AC974D5@CXOEXC12.AMERICAS.CPQCORP.NET>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Marco Berizzi <pupilla@hotmail.com>
Cc: netfilter@lists.netfilter.org


Hello Marco,

    You're assuming that the man page accurately describes the behavior
of the code (which normally is the case).  But how about doing a quick
test as suggested by Derick just to be sure.  Could be a bug?

Have a Great Day!


Bruce...

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Marco
Berizzi
Sent: Tuesday, September 20, 2005 9:17 AM
To: netfilter@lists.netfilter.org
Subject: Re: snat to multiple source ip

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



