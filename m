From: Clist <clist@uah.es>
Subject: Re: howto stop who has xxx.xxx.xxx tell xxx.xxx.xxx.x
Date: Fri, 11 Mar 2005 12:49:02 +0100
Message-ID: <200503111249.02756.clist@uah.es>
References: <a0f69e505031103393d70419@mail.gmail.com>
Reply-To: clist@uah.es
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a0f69e505031103393d70419@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-9"
To: Askar <askarali@gmail.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Use ARPTables

El Viernes 11 Marzo 2005 12:39, Askar escribi=F3:
> hi list,
>
>
> when i check #tcpdump -n -i eth0, even though im not browsing in can
> see none stopping lines for ...
>
> arp who-has xxx.xxx.xxx.xxx tell xxx.xxx.xxx.x
> .
> .
> .
> .
> howto stop this with iptables, yep I know tcpdump shows packets before
> "iptables" do, and also like to undertand why so many arp is
> generating on our network ?
>
> regards

=2D-=20
=2D------------------------------------------------
Clister UAH
=2D------------------------------------------------

