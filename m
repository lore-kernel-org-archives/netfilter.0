From: Werner Maier <maier@fidion.de>
Subject: Re: Netfilter Hooks
Date: Thu, 21 Jun 2007 09:09:57 +0200
Message-ID: <498E8850061D9A008669D70D@[192.168.42.19]>
References: <f9432b90706201841p7cf4cf95u25dcaa0a55124fac@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f9432b90706201841p7cf4cf95u25dcaa0a55124fac@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org


Hi,

> Imagine that I want to create a filter, that blocks/allow every packet
> that contains the word, for example, "GOOGLE" in it. I don't want to
> block a packet deriving from some IP, or something like that, I want
> to filter the content. For example, be able to parse a XML file in a
> packet, or parse some protocol, something like that.

look for "string" in the manpage to iptables.

iptables ... -m string --string "GOOGLE" --algo bm ...

should be the right pointer for you.

regards

Werner Maier
--
Werner Maier, Dipl.-Ing. Univ.         Friedrich-Bergius-Ring 15
fidion GmbH                            97076 W=FCrzburg


