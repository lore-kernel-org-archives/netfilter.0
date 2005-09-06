From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Question about high perfomance Linux firewall
Date: Tue, 6 Sep 2005 11:28:11 -0500
Message-ID: <200509061128.11300.rob0@gmx.co.uk>
References: <431C9027.3010104@talika.eii.us.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <431C9027.3010104@talika.eii.us.es>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Monday 2005-September-05 13:36, Javier Miguel Rodr=EDguez wrote:
> My ruleset will be rather short: 500-600 lines, with SNAT/DNAT in

(That doesn't seem short to me.)

> Which gigabit ethernet card is more suitable for high perfomance
> filtering?

I know and trust the Intels, but I can't say how they will compare.

> Any special advice about linux distro/ kernel tuning?

Distro: whatever you are comfortable using. Any can do it.

CPU: 64-bit processors do not have the same memory address space=20
limitation as do the 32-bit CPU's.

Kernel: if a 32-bit CPU, there are simple patches available which allow=20
you to specify a LOWMEM / HIGHMEM split other than the default 1G / 3G.=20
=46or 1G physical RAM, this is preferable to activating HIGHMEM. I think=20
mine is set at 1.25G / 2.75G for 1G RAM.
=2D-=20
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

