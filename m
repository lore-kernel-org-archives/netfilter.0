From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: kernel-2.6: ipsec without devices
Date: Thu, 5 Aug 2004 12:35:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <876ef97a040805093570c8d2c@mail.gmail.com>
References: <20040805113320.5a1ade04.netfilter@lucassen.org>
	 <200408051109.34290.Antony@Soft-Solutions.co.uk>
	 <20040805122501.7bd24f63.netfilter@lucassen.org>
	 <1091709309.28776.9.camel@les-home.futuresource.com>
	 <876ef97a04080506051db8a52f@mail.gmail.com> <1091720922.14493.16.camel@moola.futuresource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1091720922.14493.16.camel@moola.futuresource.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thu, 05 Aug 2004 10:48:43 -0500, Les Mikesell <les@futuresource.com> wrote:
> But it still makes as much sense to require open() to pass the
> access control restrictions as it does for every other device.

It ceases to make sense once you realize that you are not opening the
"device", per se, but simply a socket that is bourne by said device.
Character and block devices use open() to open the device itself. A
network device is "always on", so to speak, and you use socket() to
create a communications channel through that device.

> I was very surprised when I first saw that Linux
> omitted such a basic basic security concept of unix (all the
> magic happens in open()).  As far as the network goes, it is
> the same thing as Lindows/Linspire defaulting to letting everyone
> run as root.

I see your point. But this interface was designed over 20 years ago by
the BSD team and it certainly made sense from their perspective to
create a new set of system calls because this type of device did not
neatly fit into the "everything is a file" paradigm that UNIX uses.
But, clearly, it would be a great benefit if you could set your eth0
to 0600 root:root and prevent regular users from abusing the network
card.

The question is, though, what would doing that actually mean? I
believe the impediment to this solution is that the card signals the
kernel of incoming packets with no warning, and thus checking the user
permissions is not possible since the handling of network devices
happens all in interrupt context (i.e. not on behalf of a particular
user). As well, the datalink, network and transport layers have no
concept of user permissions or ownership and you couldn't tack one on
without implementing a global authentication scheme that everyone
involved adheres to.

-- 
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

