From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Restricting applications/protocols to use specific ports using
 iptables, is this possible
Date: Mon, 04 Jun 2007 16:18:08 +0200
Message-ID: <46641F20.1080402@freemail.hu>
References: <1814bfe70706040437i34b282d8ocf15b698160e05b5@mail.gmail.com>	<20070604120611.GC28171@torres.zugschlus.de>
	<1814bfe70706040539x61ca3113rb8679da3cc29b304@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Elvir Kuric <omasnjak@gmail.com>
Cc: netfilter@lists.netfilter.org

Elvir Kuric =EDrta:
> On 6/4/07, Marc Haber <mh+netfilter@zugschlus.de> wrote:
>> On Mon, Jun 04, 2007 at 01:37:07PM +0200, Elvir Kuric wrote:
>> > I am interested in one thing, is possible using iptables software
>> > limit particular application/protocol to use/bind to particular port=
s.
>>
I think this is application and not netfilter specific. You may only be=20
able to use the owner match.
But if it is good for you ??? I do not know !!!! :D
You can DROP/REJECT packets that came from an disabled port/application=20
but you can not disable the bind function on a specific port to an=20
application.
>> Why do you want to do that?
>
> :) I want to control which ports are open in output chain. Testing,=20
> exploring.
>
> I know it is not important which ports are open in output chain,
> usually putting output policy to accept.
>
AFAIK, this has only meaning in the lower range of ports... (0-1023)
>>
>> > For example I want to send all reqestes from my machine using ports =
I
>> > specify, not random ones,
>>
>> Why?
>>
>> >  or accept ping echo-replay on specific ports.
>>
>> Pleas get your facts straight. ICMP does not have ports.
>
> ICMP was just example, first on my mind in that moment :)
TCP,UDP... Many things to think about :D
>
> Regards
>
> Elvir Kuric
>>
>> Greetings
>> Marc
>>
>> --=20
>> ----------------------------------------------------------------------=
-------=20
>>
>> Marc Haber         | "I don't trust Computers. They | Mailadresse im=20
>> Header
>> Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621=20
>> 72739834
>> Nordisch by Nature |  How to make an American Quilt | Fax: *49 3221=20
>> 2323190
>>
>>
>
>
Swifty



