From: "Big Daddy" <bigdaddy@monster-solutions.net>
Subject: Re: HTTP Port forwarding issues
Date: Mon, 8 Jul 2002 16:39:16 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <001501c226bf$875467e0$6702a8c0@internal.monstersolutions.net>
References: <FLEKIPPLAEDMJMOOBBDPGEOBCHAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: stewart.thompson@shaw.ca, Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

all,
    I guess my ISP is blocking port 80. I configured the web server to use
port 8080 and configured my rules the same as before but used port 8080 and
it worked. thanks for all of the help!

----- Original Message -----
From: "Stewart Thompson" <stewart.thompson@shaw.ca>
To: "Big Daddy" <bigdaddy@monster-solutions.net>; "Antony Stone"
<Antony@Soft-Solutions.co.uk>; <netfilter@lists.samba.org>
Sent: Monday, July 08, 2002 4:11 PM
Subject: RE: HTTP Port forwarding issues


> Perhaps you should publish your entire rule set. Trying to help you with
> piecemeal rules is pretty tough.
> The order of the rules is important. Logging is also useful as recommended
> in an earlier post. What does
> a TCPDUMP show for port 80 on the External and Internal Interfaces. Also,
> what are you using to test
> your port 80? Internal machines will act very different than machines
coming
> in from the Internet.
>
> Stu........
>
>
> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]On Behalf Of Big Daddy
> Sent: July 8, 2002 1:04 PM
> To: Antony Stone; netfilter@lists.samba.org
> Subject: Re: HTTP Port forwarding issues
>
> i have the following rule as well.
>
> iptables -A FORWARD -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
>
> ----- Original Message -----
> From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> To: <netfilter@lists.samba.org>
> Sent: Monday, July 08, 2002 3:57 PM
> Subject: Re: HTTP Port forwarding issues
>
>
> > On Monday 08 July 2002 8:51 pm, Big Daddy wrote:
> >
> > > It worked when I was using a Linksys router. However maybe they have
> > > changed it since then. Do my rules look fine?
> >
> > Well, I hope these are not your *only* rules ?   I mean, like Stewart
> > suggested, what about the ESTABLISHED packets as well as the NEW ones ?
> >
> >
> >
> > Antony.
> >
>
>
>


