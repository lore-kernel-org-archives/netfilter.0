From: =?iso-8859-1?Q?Listas_de_Discuss=E3o_Linux?= <listas-linux@einet.com.br>
Subject: Re: TCP SYN FIN
Date: Mon, 5 Jul 2004 21:44:28 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009401c462f2$656322e0$0c32000a@omega>
References: <BDEHJGPIKNLKJJBCCFPLAEILCOAA.listuser@sally.epygi.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: listuser@sally.epygi.de, netfilter@lists.netfilter.org

does it not works correctly?


Atenciosamente,


Ralph Liebessohn

----- Original Message ----- 
From: <listuser@sally.epygi.de>
To: "netfilter" <netfilter@lists.netfilter.org>
Sent: Friday, July 02, 2004 10:29 AM
Subject: RE: TCP SYN FIN


> HiHo!
>
> > > $ipt -A INPUT -i $iface -d $network -p tcp --tcp-flags SYN,FIN SYN,
FIN
> > > -j DROP
>
> Maybe this is a no-brainer. But if you have copied the above from
> a script you may fail to notice that this rule will throw an error.
> The space between the second SYN, and FIN is wrong.
> If the above is just a typo in this mail, than forget this reply :)
>
> ciao
>   markus
>


