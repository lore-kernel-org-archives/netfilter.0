From: "Dennis Cardinale" <dennis@core-enterprises.com>
Subject: RE: Url not found ....
Date: Sat, 6 Jul 2002 17:35:33 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <EPEHIDPIPEBFNAHLCHPGAEMJCEAA.dennis@core-enterprises.com>
References: <20020706213119.PZDB4119.mta06-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020706213119.PZDB4119.mta06-svc.ntlworld.com@there>
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
To: Netfilter Mailing List <netfilter@lists.samba.org>

You are right...he needs to change to dash (-) to a tilda (~).

-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org]On Behalf Of Antony Stone
Sent: Saturday, July 06, 2002 5:31 PM
To: netfilter@lists.samba.org
Subject: Re: Url not found ....


On Saturday 06 July 2002 10:13 pm, John Adams wrote:

> On Saturday 06 July 2002 04:58 pm, Patrick Petermair wrote:
> > Hi!
> >
> > I've installed a firewall/gateway with RedHat 7.3 and iptables. I've set
> > up masquerading for my internal lan and some basic firewall rules.
> > Everything works fine (icq, ftp, http,...) but there is ONE homepage
> > which I cannot acces (a friend of mine can).
> >
> > http://stud4.tuwien.ac.at/-e9625216/html/projects.html
> >
> > When I try to access this page with client in my lan all I get is "not
> > found - The requested URL [...] was not found on this server."
>
> I get the same response.  No firewall entries and ethereal indicates no
> dropped packets.  Maybe you mis-typed the URL?

Okay.   I didn't try the URL myself before posting the last suggestion.

I've just tried now, and I get an error 404, which is definitely *not* a
netfilter problem - it means the remote server *has* been contacted (ie all
the routing has worked), and the remote server has said "I do not have that
page".

I'd suggest you check those digits in the middle of the URL.



Antony.


