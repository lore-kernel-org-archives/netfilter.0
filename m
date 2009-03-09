From: dstorvik <dstorvik@consultech.net>
Subject: RE: ULOGD: Log file size limitation?
Date: Mon, 9 Mar 2009 11:43:17 -0400
Message-ID: <F5E47532014E8E45A339717AF42215342F2B942CCD@hild.consultech.local>
References: <F5E47532014E8E45A339717AF42215342F2B942C49@hild.consultech.local>
 <49B0031B.5060500@inl.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49B0031B.5060500@inl.fr>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "eric@inl.fr" <eric@inl.fr>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] On Behalf Of Eric Leblond
> Sent: Thursday, March 05, 2009 11:52 AM
> To: dstorvik
> Cc: netfilter@vger.kernel.org
> Subject: Re: ULOGD: Log file size limitation?
>
> Hi,
>
> dstorvik wrote:
> > I have ulogd running to track netfilter nat connections.  When my log
> file reaches 2147483647, exactly 2 gb it stops writing with no errors
> or warnings.  It then picks back up when logrotate rotates the file and
> kicks ulogd.  I am rotating daily so other than rotating on an intraday
> period, which I'd rather not do, I'm not sure what to do.   The file
> system is a Logical volume group with EXT3 filesystem, and I believe 1K
> blocks which should lead to a maximum file size of 16 Gigabytes from
> what I understood. Is that not true and I simply have a file system
> problem or is this some limitation or bug in ULogd?
> >
>
> This is quiet strange because AC_SYS_LARGEFILE is put in ulogd2
> configure.ac.
>
> Has autoconf put in your config.h :
>
>     /* Number of bits in a file offset, on hosts where this is
> settable. */
>     #define _FILE_OFFSET_BITS 64
>
> BR,
>
> --
> Eric Leblond <eric@inl.fr>
> INL: http://www.inl.fr/
> NuFW: http://www.nufw.org/
> EdenWall: http://www.edenwall.com/

That is exactly what is in my config.h file

/* Number of bits in a file offset, on hosts where this is settable. */
#define _FILE_OFFSET_BITS 64

Should that be uncommented and recompiled?

Thanks
  Derek



