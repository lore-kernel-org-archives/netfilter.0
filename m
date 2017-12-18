From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Nftables atomic reload at reboot
Date: Tue, 19 Dec 2017 09:04:04 +1100
Message-ID: <20171218220404.GA3366@dimstar.local.net>
References: <69931d71-baa9-d2ae-9a43-242aeb6a709f@justdev.ca>
 <CAOkSjBj6VcnAmQPV8Bdz+pfckGKKZ2SDvG=T84gwCq3ZmVvpJw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOkSjBj6VcnAmQPV8Bdz+pfckGKKZ2SDvG=T84gwCq3ZmVvpJw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On Mon, Dec 18, 2017 at 11:08:21AM +0100, Arturo Borrero Gonzalez wrote:
> On 17 December 2017 at 23:02, Jeff <jarvis@justdev.ca> wrote:
...
> > - Reloading the firewall before all interfaces referenced in
> > /etc/nftables.conf are up results in errors
> >
>
> Don't use 'iif', but 'iifname'.
>
To elaborate a little: iifname does a string comparison of the interface name so
is slower than iif which does a numeric comparison of the interface index.

You can only use iif on interfaces with a fixed index number and which exist
(i.e. pretty much hardware interfaces e.g. wlan0 & eth0, but not ppp0 or
virbr0).

If you are getting this error for hardware interfaces, it may be an artifact of
your very old software revisions. I have no trouble with wlan0,

Cheers ... Duncan.
