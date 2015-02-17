From: Dennis Jacobfeuerborn <dennisml@conversis.de>
Subject: Re: bug in iptables-restore and "recent" module
Date: Tue, 17 Feb 2015 12:12:30 +0100
Message-ID: <54E3221E.5050909@conversis.de>
References: <20150215133147.6fb4589991419ad29180222a@lucassen.org>	<54E126F9.6050609@plouf.fr.eu.org> <20150216235352.56ccff3bb9bfbb568dcdaeb7@lucassen.org> <54E30166.1090406@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54E30166.1090406@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>, netfilter@vger.kernel.org

On 17.02.2015 09:52, Pascal Hambourg wrote:
> richard lucassen a =E9crit :
>> On Mon, 16 Feb 2015 00:08:41 +0100
>> Pascal Hambourg <pascal@plouf.fr.eu.org> wrote:
>>
>>>> On line 180 there is the "COMMIT" of the filter table.
>>> That sounds like expected behaviour. Where's the bug ?
>>
>> I'd say in iptables-restore. Apparently the -t (test) does not notic=
e
>> that there is a problem while the real iptables-restore does.
>=20
> Sorry, my question was not clear enough. Let me rephrase.
>=20
> As -t does not commit the tables to the kernel, I do not expect it to
> detect errors related to the kernel configuration. So I do not see an=
y
> bug in your description, it sounds like expected behaviour to me. Whe=
re
> do you see a bug in that behaviour ?

This should probably be mentioned in the man page. Most people would
think that if the ruleset passes a test with -t this means the ruleset
can be activated. Which part specifically of the mentioned rule is it
that cannot be tested without being committed the rule in the kernel?

Regards,
  Dennis
