From: "Iced Tea" <Iced_tea@gmx.net>
Subject: Re: MS Windows domain logon via netfilter NAT
Date: Mon, 13 May 2002 05:41:47 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <002501c1fa30$1ec53760$0501a8c0@lennet.de>
References: <3CDEA665.5040605@ufl.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: Kramer <kramer@ufl.edu>
Cc: netfilter@lists.samba.org


----- Original Message -----
From: "Kramer" <kramer@ufl.edu>
To: <netfilter@lists.samba.org>
Sent: Sunday, May 12, 2002 7:29 PM
Subject: MS Windows domain logon via netfilter NAT


> I have gotten a RedHat 7.3 box operating as a router/filter to a private
> (192.168.132.0/24) with dhcp without too much trouble.  One major
> problem remains that I can't find any info on.  The fixes for the NAT
> public address reverse routing and the broadcast address fixes are
> already applied.
>
> Windows client hosts on the NATed LAN can't find the NT4 Domain for
> logon.  Therefore Network Neighborhood browsing doesn't work.  Strangely
> direct UNC connections will work if logon credentials are not required.
>
> I am sure I am not the first to run into this.  Can anyone help?
>
> Jack Kramer
> University of Florida
> Fort Lauderdale

Windows usually build its browselist via broadcasting.
If the clients are not on the same network they need a domain master in each
network that knows the other network. That cannot work if the domains are
the same.
Then set up fine routing and start a wins server a machine, and all other
machines have to use wins.
works fine here, im'm migrating a network to an other ip range without
interrupting client users ...

bye

    Iced_tea


