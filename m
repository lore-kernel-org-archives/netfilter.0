From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Odd question with source based blocking
Date: Thu, 26 Aug 2004 18:49:07 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC906420A@asimail2.alphanumeric.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> I have a brief (hopefully) question.
>
> I currently have a box that sits inline with a firewall setup similiar
> to the following
>
> FORWARD - Policy - DROP
>  * allow DNS
>  * allow DHCP
>  * all WEB
>  * allow all from 192.168.1.0/24 -> BLOCKED
>  * allow all to 192.168.1.0/24 -> BLOCKED
>
> BLOCKED
>  * Block this IP
>  * Block this other IP
>  * etc ...
>
> I've tried setting the default policy of BLOCKED to accept, however it
> doesn't seem to let traffic through that doesn't match any one of the
> 'block this IP rule'.

i'm assuming by all this you mean you have a custom chain named BLOCKED, =
and your rules are something along the lines of:

iptables -A FORWARD -s 192.168.1.0/24 -j BLOCKED
iptables -A FORWARD -d 192.168.1.0/24 -j BLOCKED

you cannot set the "policy" of a custom chain, policies only apply to =
the built-in chains; i.e., iptables -P FORWARD DROP...etc...so i'm not =
sure what you mean by this.

> The only catch is, I remove the 'block this IP' rules from the BLOCKED
> list, so it makes it hard to ensure an ALLOW rule remains at the
> bottom.  Any ideas on how I can do this (default allow traffic not
> hitting a rule on BLOCKED to be ALLOWED?

if a packets jumps to a custom chain, and reaches the end of it--it =
returns to the calling chain where it left off.  in the above example--a =
packet with a destination ip of 192.168.1.1 and a src ip of 1.2.3.4 =
would match the second rule; traverse the BLOCKED chain, and if no rule =
matches return to the FORWARD chain at the next rule.

without seeing the output of:

iptables -vnL && iptables -t nat -vnL && iptables -t mangle -vnL

it is very difficult to answer your question.

-j
