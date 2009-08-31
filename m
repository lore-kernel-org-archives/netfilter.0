From: "/dev/rob0" <rob0@gmx.co.uk>
Subject: Re: ULOG The kernel doesn't support a certain ebtables extension, consider recompiling your kernel or insmod the extension.
Date: Mon, 31 Aug 2009 15:34:19 -0500
Message-ID: <200908311534.19700.rob0@gmx.co.uk>
References: <4A9C2F4C.9050405@branndal.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A9C2F4C.9050405@branndal.se>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Monday 31 August 2009 15:15:08 Thomas Berg wrote:
> /sbin/ebtables --modprobe /sbin/modprobe -A FORWARD --in-interface
> eth1.4 --protocol IPv4 --ip-protocol udp --ip-destination-port 67
> -j DROP --ulog
> ULOG The kernel doesn't support a certain ebtables extension,
> consider recompiling your kernel or insmod the extension.
>
> lsmod
> ebt_ip                  1752  29
> ebt_log                 3268  32
> ebtable_broute          1740  0
> ebtable_nat             2000  0
> ebtable_filter          2028  1
> ebtables               14108  3 ebtable_broute,ebtable_nat,ebtable_filter
> ipt_ULOG                6684  1
> x_tables               14108  4 ebt_ip,ebt_log,ebtables,ipt_ULOG
> bridge                 39968  1 ebtable_broute
> 8021q                  17932  0
> garp                    6996  1 8021q
> stp                     2112  2 bridge,garp

> I can se the modules below
> /lib/ebtables

Those are ebtables(8) user-space modules, not kernel.

> Isnt ebtables supposed to auto load its needed modules?

I have this:
/lib/modules/$(uname -r)/kernel/net/bridge/netfilter/ebt_ulog.ko
Do you?

If this is your custom kernel, you overlooked it. If it is a Debian
kernel, file a Debian bug.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
