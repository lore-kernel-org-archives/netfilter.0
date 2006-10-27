From: =?windows-1252?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: how to filter on applications?
Date: Fri, 27 Oct 2006 10:53:33 +0200
Message-ID: <4541C90D.3050000@freemail.hu>
References: <20061026185357.GA4832@trane.vulkor.net>
	<46522.136.1.1.154.1161890722.squirrel@mail.addictz.org>
	<20061027082201.GA4298@trane.vulkor.net>
	<4541C2D4.1030903@freemail.hu>
	<20061027083635.GA4518@trane.vulkor.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061027083635.GA4518@trane.vulkor.net>
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
To: vwf <vwf@vulkor.net>
Cc: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>


vwf =EDrta:
> On Fri, Oct 27, 2006 at 10:27:00AM +0200, G=E1sp=E1r Lajos wrote:
>  =20
>> vwf =EDrta:
>>    =20
>>> On Thu, Oct 26, 2006 at 03:25:22PM -0400, Mike wrote:
>>> =20
>>>      =20
>>>> vwf wrote:
>>>>   =20
>>>>        =20
>>>>> Hello,
>>>>>
>>>>> I want to filter outgoing traffic based on the originating applicat=
ion.
>>>>> How do I do this? Please tell me iptables can do this. If not, how =
can I
>>>>> lock down my system?
>>>>>     =20
>>>>>          =20
>>> =20
>>>      =20
>>>> http://l7-filter.sourceforge.net/
>>>>   =20
>>>>        =20
>>> This filters on protocol, not on application.
>>>
>>> =20
>>>      =20
>> Yes! Because APPLICATIONS use PROTOCOLS to communicate with....
>>
>> What do you do not understand?
>>    =20
>
> My question was how to filter on application. Filtering on protocol doe=
s
> not suffice.
>
>  =20
Okay... You want to filter on APPLICATION...
Let me assume that you have a firewall and some clients.
You want to block some traffic originated from your clients depending on
the application.

If an application talks to an other party then it uses a "language" that
both understands.
This is the PROTOCOL.

In netfilter/iptables you can analyse the packets. Where from do they
coming and where do they go...
If you want to know the content of this pipe then you have to use some
layer 7 filtering mechanism...

http://en.wikipedia.org/wiki/OSI_model

BUT if I did not understood you correctly then please send me an exact
question...

Thanx

Swifty




