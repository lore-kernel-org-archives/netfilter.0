From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: OT: Serial ATA
Date: Wed, 24 Dec 2003 13:29:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072290556.1519.28.camel@alpha.newkirk.us>
References: <200312240940.41374.pandre@darkstar.nom.za>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312240940.41374.pandre@darkstar.nom.za>
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
To: Paulo Andre <pandre@darkstar.nom.za>
Cc: netfilter <netfilter@lists.netfilter.org>

On Wed, 2003-12-24 at 02:40, Paulo Andre wrote:
> I have to build a new firewall and the salesman is trying to sell me Serial 
> ATA as part of the solution.
> Has anyone used this, because I have heard that Serial ATA is not up to spec?
> 
> Paulo

I have an Asus mobo with VIA chipset that includes SATA.  I'm delighted
with the performance.

HOWEVER...

Until a distro is released that has SATA drivers on the install media it
is exceptionally difficult to actually install Linux to the SATA drive. 
I ended up needing to install to my old IDE drive, build a 2.6.0 kernel,
mount the SATA drive and prep it, transfer all partitions from the old
drive to the SATA, then install Grub on the SATA drive.

The short of it: make DAMN sure that if you go the SATA-only route that
the SATA chipset is supported by 2.4.2x kernels that are used by
installers, or be prepared for a long tortuous process getting it up and
running.  

SATA is great, IMHO, but support for it under Linux is not sufficient
for worry-free installs, YET... With the final release of kernel 2.6.0
last week, I expect that to change in the near future for many
distributions.  (although not RedHat, of course :( and Fedora is on a
scheduled release cycle, so I don't anticipate it there for a few months
either)

j



