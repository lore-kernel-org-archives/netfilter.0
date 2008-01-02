From: "John L. Magee" <jlmagee@mageenet.net>
Subject: RE: Passive FTP Client fails connecting to Server behind IPTABLES
Date: Wed, 2 Jan 2008 14:20:58 -0500
Message-ID: <91CBD7F22CBCE7458D3E7A71C81B07C84858E5@mnetmx1.adamapps.host>
References: <91CBD7F22CBCE7458D3E7A71C81B07C8033BBB@mnetmx1.adamapps.host> <Pine.LNX.4.58.0801021014020.19307@mail3.jubileegroup.co.uk> <91CBD7F22CBCE7458D3E7A71C81B07C84858E1@mnetmx1.adamapps.host>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

The solution lies in:

http://forums.xensource.com/thread.jspa?messageID=10914&#10914

No more incorrect checksums after the use of this Windows boot
parameter. FTP now works for outside and inside clients in both active
and passive modes.

Thanks for your help.

 
jlm
 

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org 
> [mailto:netfilter-owner@vger.kernel.org] On Behalf Of John L. Magee
> Sent: Wednesday, January 02, 2008 12:36 PM
> To: netfilter@vger.kernel.org
> Subject: RE: Passive FTP Client fails connecting to Server 
> behind IPTABLES
> 
> Thanks. The Xensource article you referenced has provided a 
> hint but no resolution.
> 
> It appears the commercial Xensource PV drivers for Windows do 
> not provide a valid checksum.
> 
>  
> jlm
>  
>  
> 
> -----Original Message-----
> From: netfilter-owner@vger.kernel.org
> [mailto:netfilter-owner@vger.kernel.org] On Behalf Of G.W. Haywood
> Sent: Wednesday, January 02, 2008 5:15 AM
> To: netfilter@vger.kernel.org
> Subject: Re: Passive FTP Client fails connecting to Server 
> behind IPTABLES
> 
> Hi there,
> 
> On Tue, 1 Jan 2008, John L. Magee wrote:
> 
> > >> I do see all kinds of related commentary while googling but none 
> > >> that have any solutions for me. If ip_contrack_ftp and 
> ip_nat_ftp 
> > >> are supposed to manage this, they are not.
> > >
> > >Does this help?
> > >
> > >http://securepoint.com/lists/html/NetFilter/2006-11/msg00209.html
> >
> > No. It is similar but seems to be the reverse situation.
> 
> This then?
> 
> http://lists.xensource.com/archives/html/xen-users/2007-05/msg
00980.html
> 
> > For a server being accessed by a client with Passive FTP, should 
> > ip_nat_ftp alter the inside address to the outside address when 
> > sending the port for the passive data transfer?
> 
> That is my understanding, yes.
> 
> --
> 
> 73,
> Ged.
> -
> To unsubscribe from this list: send the line "unsubscribe 
> netfilter" in the body of a message to 
> majordomo@vger.kernel.org More majordomo info at  
> http://vger.kernel.org/majordomo-info.html
> 
> -
> To unsubscribe from this list: send the line "unsubscribe 
> netfilter" in the body of a message to 
> majordomo@vger.kernel.org More majordomo info at  
> http://vger.kernel.org/majordomo-info.html
> 
