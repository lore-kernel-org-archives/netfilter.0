From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IP address to MAC address
Date: Tue, 11 Jun 2002 22:36:07 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206112136.g5BLa9A24240@Networker.rockstone.co.uk>
References: <Pine.LNX.4.44.0206111418380.4051-100000@wookie.shorewall.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.44.0206111418380.4051-100000@wookie.shorewall.net>
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
To: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

On Tuesday 11 June 2002 10:27 pm, Tom Eastep wrote:

> On Tue, 11 Jun 2002, Antony Stone wrote:

> > Well, on my system at least (Slackware 8.0), /proc/net/arp has
> > permissions -r--r--r-- so anyone can read it.   The arp program is in
> > /sbin, so it can only be run by root.
>
> Are you saying that Slack secures /sbin against access by non-root users
> or the files there from being executed by non-root users? Not so on
> RedHat:
>
> Note that /sbin isn't in non-root's PATH so by default an absolute path
> name must be used. But:

Okay - turns out I'm telling you Slackware's the same - I just naively 
assumed that when someone decided not to include /sbin on non-root user PATH, 
then they would have given it permissions dr-xr-x--- to stop non-root users 
getting at the juicy commands inside.

Just shows you something you think is security is just obscurity :-)

 

Antony.

