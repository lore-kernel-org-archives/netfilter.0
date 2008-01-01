From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Passive FTP Client fails connecting to Server behind IPTABLES
 Firewall
Date: Tue, 1 Jan 2008 12:25:27 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0801011219430.30377@mail3.jubileegroup.co.uk>
References: <91CBD7F22CBCE7458D3E7A71C81B07C8485882@mnetmx1.adamapps.host>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <91CBD7F22CBCE7458D3E7A71C81B07C8485882@mnetmx1.adamapps.host>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

On Sat, 29 Dec 2007, John L. Magee wrote:

> TCPDUMP analysis shows that the response from the server to the client
> telling it to go to passive mode on port x is retaining the INSIDE
> address of the server in the command packet and the client therefore
> tries to initiate the data connection directly to the inside address
> instead of the outside one.
>
> I do see all kinds of related commentary while googling but none that
> have any solutions for me. If ip_contrack_ftp and ip_nat_ftp are
> supposed to manage this, they are not.

Does this help?

http://securepoint.com/lists/html/NetFilter/2006-11/msg00209.html

--

73,
Ged.
