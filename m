From: "Joe Patterson" <jpatterson@asgardgroup.com>
Subject: RE: Unable to apply pptp patch
Date: Wed, 3 Jul 2002 11:18:31 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <NJEFLNJDIFFNMHDEBKMJGEJODOAA.jpatterson@asgardgroup.com>
References: <200207030949.g639naU28824@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207030949.g639naU28824@vulcan.rissington.net>
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
To: netfilter@lists.samba.org

>
> > It's been a while since I searched ; is there a real VPN client
> and server
> > for Windows 9x/NT4/2000 ?
>
> By 'real', I assume you mean IPsec...
>
> Are you looking for Open Source or $$$ ?
>
> Open Source, no I don't think there is an IPsec client/server for Windows.

Well, yes and no...  Windows 2000 and XP both have native support for IPSec.
Lame support, but native support.  The configuration of it is, to say the
least, unpleasant.  However, there is an open-source tool for 2K/XP from
Marcus Mueller at http://vpn.ebootis.de/, which helps make the windows
config much more reasonable.  This is, by the way, built specifically for
interoperating with FreeSwan, but may work with other things too.

Or if you want to pay for a windows client and get the linux server free,
there are several nice clients that interoperate with freeswan, such as
SafeNet and SSH Sentinel (and several others)

Beyond that, the best bet would probably be to get something from Cisco or
Nortel.  With those, you pay for the server and get the client for free.
And, they work fairly well.

But, we've digressed fairly far off topic now... The two mailing lists I
read the most are this and freeswan-users, so I sometimes forget what's on
topic for the list I'm responding to.  :)

> Depending on what you need, have you considered using an SSH based VPN ?
>
> There are Open Source SSH clients for Windows, the server can be
> Windows or
> Linux, you get multiplexed port forwarding and strong
> encryption...   Might
> be a useful halfway house ?

This works really well in some cases (i.e, I want to connect to a windows
box inside my lan using  the terminal services client... ssh works well),
but not so well in other cases (I need a file off of this server... I can't
redirect port 139, because I'm using it locally, I can't tell windows to use
a different port for netbios, so I'll ssh to my linux box, redirect term
serv to the internal box, term serv onto it, download a windows scp client,
scp the file I want onto the linux box, then scp it back to my laptop....
it works, but it's a pain in the butt, and I would *never* try and describe
how to do this to the typical user...)

>
>
>
> Antony.
>
>
>


