From: Ionut Spirlea <ionuts@SGI.rdscv.ro>
Subject: Re: reset /proc/net/dev
Date: Thu, 12 Sep 2002 15:46:29 +0300 (EEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209121538280.16753-100000@SGI.rdscv.ro>
References: <200209121148.g8CBmSv09962@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209121148.g8CBmSv09962@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter <netfilter@lists.netfilter.org>


hi,

# wget http://sgi.rdscv.ro/~ionuts/C/c_dev.tar.gz
# tar xzvf c_dev.tar.gz
# cd c_dev
# make
# insmod c_dev.o
# rmod c_dev

that's all


On Thu, 12 Sep 2002, Antony Stone wrote:

> On Thursday 12 September 2002 12:43 pm, Rohan Almeida wrote:
>
> > HI List,
> > How do i reset the values in /proc/net/dev ?
> > This file holds values for count of each (packet && byte),
> > (sent && received) through all interfaces.
> >
> > I'm using a monitor which reads values from this
> > file and prints out some nicely formatted output.
> >
> > But i need to reset the values. ie. set then to zero.
> > Restarting the network does not do what i want.
> > I guess a reboot should do it.
> >
> > Any other way?
>
> Not that I know of.
>
> Could you perhaps read the values and save them somewhere, then subtract that
> stored value next time you read the interface, to get the difference ?
>
> Antony.
>
> --
>
> In science, one tries to tell people
> in such a way as to be understood by everyone
> something that no-one ever knew before.
>
> In poetry, it is the exact opposite.
>
>  - Paul Dirac
>


-------
Ionut Spirlea, http://sgi.rdscv.ro/~ionuts/
Mind like parachute  -  function only when open!


