From: jwlargent <jwlargent@vlsmaps.com>
Subject: Re: Restricting applications/protocols to use specific ports using
 iptables, is this possible
Date: Tue, 05 Jun 2007 11:00:30 -0500
Message-ID: <4665889E.2030201@vlsmaps.com>
References: <1814bfe70706040437i34b282d8ocf15b698160e05b5@mail.gmail.com>	<20070604120611.GC28171@torres.zugschlus.de>
	<1814bfe70706040539x61ca3113rb8679da3cc29b304@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1814bfe70706040539x61ca3113rb8679da3cc29b304@mail.gmail.com>
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
To: Elvir Kuric <omasnjak@gmail.com>
Cc: Marc Haber <mh+netfilter@zugschlus.de>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Elvir Kuric wrote:
> On 6/4/07, Marc Haber <mh+netfilter@zugschlus.de> wrote:
>> On Mon, Jun 04, 2007 at 01:37:07PM +0200, Elvir Kuric wrote:
>> > I am interested in one thing, is possible using iptables software
>> > limit particular application/protocol to use/bind to particular
>> ports.
>>
>> Why do you want to do that?
>
> :) I want to control which ports are open in output chain. Testing,
> exploring.
>
> I know it is not important which ports are open in output chain,
> usually putting output policy to accept.

It is important to know what ports are open in the output chain.  This
is exactly the attitude
that helps the spread of Trojans and Viruses.
You should only open ports you need, for example a user brings in
a Trojan that tries to infect other systems and connects back to a monitor
somewhere to let it know about the host it just took over.  If you are
blocking the ports it
uses to infect other systems you limit the damage it does.  Now there
is nothing that keeps it
from using a port you have open, say port 80 http., but at least you
have tried to limit your exposure.

>
>>
>> > For example I want to send all reqestes from my machine using
>> ports I
>> > specify, not random ones,
>>
>> Why?
>>
>> >  or accept ping echo-replay on specific ports.
>>
>> Pleas get your facts straight. ICMP does not have ports.
>
> ICMP was just example, first on my mind in that moment :)
>
> Regards
>
> Elvir Kuric
>>
>> Greetings
>> Marc
>>
>> --
>>
-----------------------------------------------------------------------------
>>
>> Marc Haber         | "I don't trust Computers. They | Mailadresse
>> im Header
>> Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621
>> 72739834
>> Nordisch by Nature |  How to make an American Quilt | Fax: *49 3221
>> 2323190
>>
>>


- --
Jeff Largent
System Administrator
Visual Lease Services Inc.
http://www.vlsmaps.com
(405) 379-5280
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGZYidd02kARNrtZkRAnIpAJ9DaulTYHRPSX4SWrwhH6n00LcxUQCg4qug
41YEjFzdoMVSJaBKJyfg15Q=
=dTnF
-----END PGP SIGNATURE-----


