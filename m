From: "Adam D. Barratt" <netfilter.list@adam-barratt.org.uk>
Subject: Re: Spoofed ip's
Date: Wed, 12 Feb 2003 08:51:43 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0e0e01c2d273$f7ecd2c0$eb00010a@andromeda>
References: <1044948351.23287.11.camel@filth.sadomain.co.za><3E491D30.1000909@maximum-linux.net> <20030212022803.009d8ad0.arnt@c2i.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Arnt Karlsen wrote, Wednesday, February 12, 2003 1:28 AM:

> On Tue, 11 Feb 2003 15:56:32 +0000,
> uniplex <uniplex@maximum-linux.net> wrote in message
> <3E491D30.1000909@maximum-linux.net>:
>
> >
> >  Would something like this look a little better for you?
> >
> >  RESERVED_NET="0.0.0.0/8 1.0.0.0/8 2.0.0.0/8 5.0.0.0/8 7.0.0.0/8
[...]
> ..some of these above are redundant, and some (wintendos?) need
> 255.255.255.255/32, play with 'ipcalc -bnmp 0.0.0.0/1' upwards.

More to the point, and even worse, some of them are *wrong*.

At a quick glance, 69/8, 81/8, 82/8, 219/8, 220/8 and 221/8 are *not*
reserved. Some of them haven't been for nearly two years now.

Adam


