From: "Joel" <zealous@bonbon.net>
Subject: Re: view nat rules
Date: Mon, 29 Sep 2003 16:10:19 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002301c38676$15c2d9a0$61a1a0ca@lin>
References: <3F77E8BC.1090502@ewt.de>
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
To: Klaus Boehm <k.boehm@ewt.de>, netfilter@lists.netfilter.org

iptables -t nat -nL

----- Original Message -----
From: "Klaus Boehm" <k.boehm@ewt.de>
To: <netfilter@lists.netfilter.org>
Sent: Monday, September 29, 2003 1:39 PM
Subject: view nat rules


> How can i view the nat rules.
>
> i did iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source
xx.xx.xx.xx
>
>  and then i tried iptables -L POSTROUTING
> but this doesn't work.
>
> Thanks.
>
> Klaus
>
>
> --
>
>
> ewt gmbh
> data management group
> tel: ++49 821 3106 319
> fax: ++49 821 3106 399
> url: www.ewt.de
>
>
>
>



