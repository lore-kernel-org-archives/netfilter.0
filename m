From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: hosts.deny
Date: Mon, 8 Jul 2002 01:11:55 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708001157.EOH9709.mta02-svc.ntlworld.com@there>
References: <000001c22612$91fcb600$0a01a8c0@ed>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000001c22612$91fcb600$0a01a8c0@ed>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Monday 08 July 2002 1:01 am, Ed Street wrote:

> Hello,
>
> Dns lookups.

Well, yes, obviously the way to resolve hostnames to IP addresses is by DNS 
lookups :-)

What I meant was, how does your script cope when you want to block something 
like, say, www.microsoft.com, and the DNS lookup returns 6 different IP 
addresses, from two different class C ranges (which is what I just got by 
doing a dig on the name) ?

> Note some cases the /netmask is somewhat overkill.  I felt
> better safe than sorry, incase they have a block of ip's.

I'd have thought it unlikely that a hostname would resolve to multiple 
contiguous IPs.   If a company has enough load that they're running multiple 
servers, they're probably doing it on multiple feeds as well, which will have 
widely differing IP addresses.....

 

Antony.

> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org] On Behalf Of Antony Stone
> Sent: Sunday, July 07, 2002 7:57 PM
> To: netfilter@lists.samba.org
> Subject: Re: hosts.deny
>
> On Monday 08 July 2002 12:48 am, Ed Street wrote:
> > Hello,
> >
> > Sure attached is the hosts.trashcan file I am currenly testing.
>
> Interesting.   How does your script handle resolving machine names to IP
>
> addresses (as shown in several examples in your trashcan file) when one
> name
> corresponds to several IPs ?
>
>
>
> Antony.

