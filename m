From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Stateless NAT in 2.6 (was Re: UDP Forwarding)
Date: Tue, 22 Feb 2005 03:45:36 -0500
Message-ID: <1109061936.5505.72.camel@jasiiitosh.nexusmgmt.com>
References: <1108784264.14727.11.camel@jasiiitosh.nexusmgmt.com>
	<1109057218.5505.4.camel@jasiiitosh.nexusmgmt.com>
	<014701c518b7$19102f20$0100a8c0@newlife>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <014701c518b7$19102f20$0100a8c0@newlife>
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
Content-Type: text/plain; charset="us-ascii"
To: Ming-Ching Tiew <mingching.tiew@redtone.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Tue, 2005-02-22 at 16:18 +0800, Ming-Ching Tiew wrote:
> > >  I would like to find a way to do this with the
> > > CyberGuard devices.  I do not have the option of installing a UDP helper
> > > so I have to do this with iptables or iproute.
> >>
> 
> Trying to understand your problem :-
> 
> Why is the option of installing a UDP helper is out ? Is it because
> the can't compile C programs and install any program on these 
> cyberguard devices? And you can only write scripts ?
> 
<snip>
Yes, exactly.  They are very small footprint appliances running ucLinux
and I would not want to void any warranties by cross compiling and
adding binaries to the image.  Thanks for such a quick response - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


