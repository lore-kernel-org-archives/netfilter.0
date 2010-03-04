From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: how to harden iptables rules?
Date: Thu, 04 Mar 2010 13:34:52 +0100
Message-ID: <4B8FA8EC.3020100@chello.at>
References: <20100303172001.149912au9jha5s8g@webmail.physik.uni-muenchen.de> <4B8E9F4A.9080706@plouf.fr.eu.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B8E9F4A.9080706@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On 03.03.2010 18:41, Pascal Hambourg wrote:

> Christoph Anton Mitterer a =E9crit :

>> if I block it completely (except echo-request) I also dont't get any=
 =20
>> ICMP error messages,
>=20
> No, valid ICMP error messages have the ESTABLISHED state.

http://www.frozentux.net/iptables-tutorial/iptables-tutorial.html#ICMPC=
ONNECTIONS
and the man page say different.

They don't talk about an icmp error message as a reply to a icmp
message, but just guessing, where's the differenece? why should
netfilter suddenly switch to ESTABLISHED for a icmp error reply?

Best regards

Mart
