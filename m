From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: Re: ip_forward file
Date: Fri, 5 Jul 2002 11:15:49 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <003301c22404$8e011560$153fa8c0@hslbrabantzuid.nl>
References: <200FAA488DE0D41194F10010B597610D2BA231@JUPITER>
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
To: iptables <netfilter@lists.samba.org>

----- Original Message -----
From: "George Vieira" <GeorgeV@citadelcomputer.com.au>

> I'm using 7.1 but I do admit I also have the "echo 1 > /proc/.." statement
> in my firewall rules only because I've copied from other servers I
> originally wrote this...

Me too, but not because of inheritance.

When I start the firewall script, it handles echo 1 > ...
When I stop the firewall script, it handles echo 0 > ...
And I do that for multiple echo's to /proc/...

This way I have it all in one place instead of different places.
I think it's a matter of opinion where to put it.

Rob



