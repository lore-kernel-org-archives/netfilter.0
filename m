From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: bug in iptables-restore and "recent" module
Date: Tue, 17 Feb 2015 09:52:54 +0100
Message-ID: <54E30166.1090406@plouf.fr.eu.org>
References: <20150215133147.6fb4589991419ad29180222a@lucassen.org>	<54E126F9.6050609@plouf.fr.eu.org> <20150216235352.56ccff3bb9bfbb568dcdaeb7@lucassen.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150216235352.56ccff3bb9bfbb568dcdaeb7@lucassen.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

richard lucassen a =E9crit :
> On Mon, 16 Feb 2015 00:08:41 +0100
> Pascal Hambourg <pascal@plouf.fr.eu.org> wrote:
>=20
>>> On line 180 there is the "COMMIT" of the filter table.
>> That sounds like expected behaviour. Where's the bug ?
>=20
> I'd say in iptables-restore. Apparently the -t (test) does not notice
> that there is a problem while the real iptables-restore does.

Sorry, my question was not clear enough. Let me rephrase.

As -t does not commit the tables to the kernel, I do not expect it to
detect errors related to the kernel configuration. So I do not see any
bug in your description, it sounds like expected behaviour to me. Where
do you see a bug in that behaviour ?
