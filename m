From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Block/Accept by MAC Address
Date: Wed, 2 Oct 2002 00:14:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021001231428.EYNL7631.mta03-svc.ntlworld.com@there>
References: <003a01c268ea$d98408a0$e951ea43@W2RZ8L4S02> <20021001083118.SDVF28874.mta06-svc.ntlworld.com@there> <003401c2699c$9eb9b320$cd06ea43@W2RZ8L4S02>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003401c2699c$9eb9b320$cd06ea43@W2RZ8L4S02>
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

On Tuesday 01 October 2002 11:48 pm, Jim Gifford wrote:

> This guy is moving around from IP's and different addresses. The main thing
> I noticed is that I have numerous connections with keep-alives on my Apache
> and Proftp server. Here is an example of what I have been noticing.
> 67.234.6.201,1032     64.30.195.78,21       tcp     ESTABLISHED  119:59:59
> 67.234.6.201,1121     64.30.195.78,21      tcp     ESTABLISHED  119:55:55
> 67.234,6,201,1692    64.4.13.144,1863      tcp     ESTABLISHED  119:50:52
> 67,234,6,201,1695    64.4.13.144,1863      tcp     ESTABLISHED  119:49:12
>
> I usually have about 10 or 15 of these from his IP range. I just figured
> blocking his MAC would be a option, since they are unique.

Okay - I think you have a different definition of "hacking" than I have - you 
seem to mean he's just setting up connections to public services and possibly 
filling your connection table, but not otherwise breaking any protocols, 
exploiting any vulnerabilities, or actually getting unauthorised access to 
anything on the machine.

Considering the IP addresses you've shown above, where he's on a 67... 
network and you're on a 64... network, this is definitely not a local attack, 
and therefore you cannot block by MAC address.

Just to make sure I'm correct on this, please can you check the MAC address 
of a few legitimate connections which are coming in to the same machine - I'm 
pretty sure you'll find they are the same as well, because I believe that the 
MAC address you are seeing is your local router to the Internet.

As a couple of us mentioned in recent postings in this thread, you cannot use 
MAC address to identify someone who is not on your local network, and if this 
guy *is* on your local network, we suggest you walk round to him and either 
ask him nicely to stop what he's doing, unplug his network connection, or do 
whatever else is necessary to get him to cease being a pain.

Antony.

> ----- Original Message -----
> From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> To: <netfilter@lists.netfilter.org>
> Sent: Tuesday, October 01, 2002 3:31 AM
> Subject: Re: Block/Accept by MAC Address
>
> > On Tuesday 01 October 2002 2:33 am, Jim Gifford wrote:
> > > I have a guy who keeps hacking my machine and his IP
> > > address is always changing and so does his hostname.
> >
> > How is he hacking your machine ?   What is accessible on your system for
>
> him
>
> > to have a go at ?
> >
> > A firewall is not the answer to every problem.
> >
> > Antony.

-- 

Which part of 'apt-get dist-upgrade' do you not understand ???

