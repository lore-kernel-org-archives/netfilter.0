From: "pankaj jain" <jainp1979@gmail.com>
Subject: Re: not [!] rule is not working
Date: Tue, 14 Aug 2007 17:58:17 +0530
Message-ID: <d41814cf0708140528o4fe73a93x85a8f7ce53396b03@mail.gmail.com>
References: <d41814cf0708132345t45ec0be0vee36c6c88cc5088a@mail.gmail.com>
	<46C18868.7050306@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=hIWH9fXEx6lncCHZaSt72Z5xTcDC8U2r6w6tYLR/DtkW11j51TC5RwrzyJmBH6Ttmruukka0Ypo9/HtiL6OG26TfMUhhX/VIAep4z0tBL1s3YErYIZaaOpqAMf5T/7DXqTvXnuy8L3Y8o00qC+npLtBxc6kv0s+Z2FEpIY8tr48=
In-Reply-To: <46C18868.7050306@freemail.hu>
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter@lists.netfilter.org

On 8/14/07, G=E1sp=E1r Lajos <swifty@freemail.hu> wrote:
> pankaj jain =EDrta:
> > Hi,
> > I was trying to drop arp packets such that only specific interface
> > should answer the arp requests.
> > I added following rules in input chain.
> > -j DROP -i !eth1 -o * -d 10.19.1.102 --opcode 1 , pcnt=3D0 -- bcnt=3D0
> > -j DROP -i !eth2 -o * -d 10.19.51.102 --opcode 1 , pcnt=3D0 -- bcnt=3D0
> >
> >
> I think that this should be in THIS form:
>
> -j DROP ! -i eth1 ....
> > as packet count suggests these are not matching against any packet.
> > when I do arping from other machine to the 10.19.1.102 (assigned to
> > the eth1 interface)
> > arp requests are responded from eth0 (ip-10.19.0.102).
> > why the rules are not having any effect
> Swifty
>
>

I tried
arptables -A INPUT ! -i eth1 --opcode Request -d 10.19.1.102 -j DROP
but it was not working.
when i do the "arptables -L -nvx" it shows:
-j DROP -i eth1 -o !* -d 10.19.1.102 --opcode 1 , pcnt=3D0 -- bcnt=3D0
--=20
Thanks
Pankaj Jain

