From: Les Mikesell <les@futuresource.com>
Subject: Re: kernel-2.6: ipsec without devices
Date: Thu, 05 Aug 2004 07:35:09 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091709309.28776.9.camel@les-home.futuresource.com>
References: <20040805113320.5a1ade04.netfilter@lucassen.org>
	 <200408051109.34290.Antony@Soft-Solutions.co.uk>
	 <20040805122501.7bd24f63.netfilter@lucassen.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040805122501.7bd24f63.netfilter@lucassen.org>
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
To: reply3@lucassen.org
Cc: netfilter@lists.netfilter.org

On Thu, 2004-08-05 at 05:25, richard lucassen wrote:
> > I tend to agree with you that they were a useful way to keep track of
> > which packets were going where, and I think from a firewalling point
> > of view the new 2.6 implementation of IPsec is not as easy to work
> > with.

A more fundamental question: does anyone know why Linux uses
pseudo devices for networking instead of having real names
in /dev with associated permissions and inodes connected
to drivers by major/minor numbers?  It seems odd not to
be able to control access to /dev/tcp by group permisions
like you can every other device.

---
  Les Mikesell
    les@futuresource.com



