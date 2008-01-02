From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Passive FTP Client fails connecting to Server behind IPTABLES
Date: Wed, 2 Jan 2008 10:15:25 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0801021014020.19307@mail3.jubileegroup.co.uk>
References: <91CBD7F22CBCE7458D3E7A71C81B07C8033BBB@mnetmx1.adamapps.host>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <91CBD7F22CBCE7458D3E7A71C81B07C8033BBB@mnetmx1.adamapps.host>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

On Tue, 1 Jan 2008, John L. Magee wrote:

> >> I do see all kinds of related commentary while googling but none
> >> that have any solutions for me. If ip_contrack_ftp and ip_nat_ftp
> >> are supposed to manage this, they are not.
> >
> >Does this help?
> >
> >http://securepoint.com/lists/html/NetFilter/2006-11/msg00209.html
>
> No. It is similar but seems to be the reverse situation.

This then?

http://lists.xensource.com/archives/html/xen-users/2007-05/msg00980.html

> For a server being accessed by a client with Passive FTP, should
> ip_nat_ftp alter the inside address to the outside address when sending
> the port for the passive data transfer?

That is my understanding, yes.

--

73,
Ged.
