From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: IPTABLES + OUTPUT + SNAT
Date: Thu, 5 Jan 2006 13:22:06 +0100 (CET)
Message-ID: <64699.193.173.147.3.1136463726.squirrel@webmail.sterenborg.info>
References: <BFE2CAAB.A40%eb5esx@eb5esx.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BFE2CAAB.A40%eb5esx@eb5esx.ampr.org>
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
To: =?iso-8859-1?Q?Rub=E9n_Navarro_Huedo?= <eb5esx@eb5esx.ampr.org>
Cc: netfilter@lists.netfilter.org

On Thu, January 5, 2006 13:07, Rub=E9n Navarro Huedo wrote:
...
> We need to do this:
> Our server has 2 ip's. One is used only for SMTP outgoing and the
> other for all the rest.
> All is running fine except that our smtp outgoing IP has problems
> conecting ONLY to one smtp server.

Could it be that it's an smtp problem (eg PIX fsck-up) ?

> What we want to do is: all from our server to that smtp server change
> the source IP and use the other one that we have in our server.
> Do i explain ok? My english is not very good :(
> We are trying this with this:
>
> iptables -t nat -A OUTPUT -p tcp -j SNAT -d ip_wanadoo --to
> nuestra_otra_ip
>
> But:
> iptables: Invalid argument
>
> We are using OUTPUT becouse we think that it is the correct.
>
> Can this be done? What are we doing badly?

man iptables :
"SNAT
This target is only valid in the nat table, in the POSTROUTING chain."

iptables -t nat -A POSTROUTING -j SNAT -d ip_wanadoo \
  -p tcp --dport 25 --to nuestra_otra_ip


Gr,
Rob



