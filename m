From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Comments at end of iptables statements
Date: Mon, 18 Jun 2007 14:10:59 +0200
Message-ID: <46767653.1050204@freemail.hu>
References: <4675658C.6010309@victorex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4675658C.6010309@victorex.com>
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
To: "John V. Kjellman" <johnk@victorex.com>, Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

John V. Kjellman =EDrta:
> Any chance that a "#" or other character will one day be allowed as a=20
> comment character at the end of iptables statements?
What do you mean?
If  you setup your rules from a shell script then you can add a comment=20
IN the script

iptables .... # This is a good rule...

In the other hand you can use the comment module...

iptables -m comment --comment 'This is a good connection'
>
> Regards,
>   John V. Kjellman
>   Henniker, NH
>
>



