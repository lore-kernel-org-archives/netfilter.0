From: Les Mikesell <les@futuresource.com>
Subject: Re: kernel-2.6: ipsec without devices
Date: Thu, 05 Aug 2004 10:48:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091720922.14493.16.camel@moola.futuresource.com>
References: <20040805113320.5a1ade04.netfilter@lucassen.org>
	 <200408051109.34290.Antony@Soft-Solutions.co.uk>
	 <20040805122501.7bd24f63.netfilter@lucassen.org>
	 <1091709309.28776.9.camel@les-home.futuresource.com>
	 <876ef97a04080506051db8a52f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <876ef97a04080506051db8a52f@mail.gmail.com>
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
To: Tobias DiPasquale <codeslinger@gmail.com>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-08-05 at 08:05, Tobias DiPasquale wrote:
> On Thu, 05 Aug 2004 07:35:09 -0500, Les Mikesell <les@futuresource.com> wrote:
> > A more fundamental question: does anyone know why Linux uses
> > pseudo devices for networking instead of having real names
> > in /dev with associated permissions and inodes connected
> > to drivers by major/minor numbers?  It seems odd not to
> > be able to control access to /dev/tcp by group permisions
> > like you can every other device.
> 
> Because network devices aren't easily manipulated using the standard
> UNIX "everything is a file" methodology. They are packet-oriented, as
> opposed to character- or block-oriented and as such, the normal
> read()/write()/close()/etc suite of system calls doesn't make sense
> for network devices (therefore, there's no reason to have a /dev file
> for them).

But it still makes as much sense to require open() to pass the
access control restrictions as it does for every other device.

>  Also, network devices push packets towards the kernel
> asynchronously (as far as the kernel's concerned, anyway);
> chrdev/blkdev devices do so in response to some kind of request. No
> UNIX(-alike) that I know of has /dev files that correspond to network
> devices.

I've forgotten the details because it was years ago, but I'm sure
the last 'real' SysVr4 I used (perhaps Dell's, or AT&T's) had a
/dev/tcp or similar device that was opened as a step in opening
a socket and subject to the same rules as every other unix device.
A local ISP back in the days when people would telnet in to
access character-mode email/news, etc. used this to distinguish
accounts that could make direct outbound connections from those
that could only run programs to access the local mailbox and
news spool.  I was very surprised when I first saw that Linux
omitted such a basic basic security concept of unix (all the
magic happens in open()).  As far as the network goes, it is
the same thing as Lindows/Linspire defaulting to letting everyone
run as root.

---
  Les Mikesell
   les@futuresource.com



