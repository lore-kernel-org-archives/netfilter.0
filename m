From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Policy targets...
Date: Fri, 11 May 2007 13:03:20 +0200
Message-ID: <46444D78.7040809@freemail.hu>
References: <464441F7.3050808@freemail.hu> <464443AE.5020904@gmail.com>
	<464446C5.8090301@freemail.hu> <46444B26.6010206@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46444B26.6010206@gmail.com>
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
To: =?ISO-8859-2?Q?Pedro_Gon=E7alves?= <pedro.pandre@gmail.com>
Cc: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

Pedro Gon=E7alves =EDrta:
>> Thanx for the answer but my question was that what happens when the=20
>> CHAIN POLICY is RETURN...=20
> Sorry, I didn't understand that in you original email.
No problem... :D
> I don't think that "RETURN" is a valid policy target, I think that=20
> only "ACCEPT" or "DROP" may be used as policy targets.
> At least, I've never used that target neither seen anyone using it,=20
> but maybe someone in the list can provide more info.
I tried and it gives me an error:

fw1:~# iptables -t nat -P PREROUTING RETURN
iptables: Bad policy name

So you won !
Maybe someone should fix the manual....
> Best Regards
> pandre
Thanx anyway... :D

Swifty


