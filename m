From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re:Re: proxying along with iptables
Date: Sat, 2 Nov 2002 11:05:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021102110858.MCO292.mta03-svc.ntlworld.com@there>
References: <A590F7F751E6D6118C0800104B0DF37304CDA4@MAILGATE>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <A590F7F751E6D6118C0800104B0DF37304CDA4@MAILGATE>
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
To: netfilter@lists.netfilter.org

On Saturday 02 November 2002 8:31 am, Naleendra@dms.lanka.net wrote:
On Friday 01 November 2002 1:34 pm, Antony Stone wrote:

> > On Friday 01 November 2002 1:24 pm, Naleendra@dms.lanka.net wrote:
> > > 	Hi lists,
> > >
> > > 	this is not directly connected to iptables, however your comments
> > > would be most welcome. What are the proxying products that could run
> > > along with iptables but which can talk with a windows NT/2000 based user
> > > base for authentication ? Does squid provide for this ?
> >
> > What protocol/s do you want to proxy ?
> >
> > What sort of user authentication do you want to use ?
>
> 	Protocols : ftp, http, dns
>
> 	Basic requirements are: Web site caching
> 			Accounting purposes for users in a Nt/2000 user base

Okay, squid will do ftp and http proxying for you; I don't regard dns as 
significant here, because unless your clients are running their own dns 
servers, I'd say this protocol is always proxied.

Samba can link to a Win NT/2k user base.   Maybe you can get some linkup 
between those two to identify and authenticate users, then account for their 
packets.
 

Antony.

-- 

KDE 3.0.3 contains an important fix for handling SSL certificates.  Users of 
Internet Explorer, which suffers from the same problem but which
does not yet have a fix available, are also encouraged to switch to KDE 3.0.3.

http://www.kde.org/announcements/announce-3.0.3.html

