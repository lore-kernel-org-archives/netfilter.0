From: Mark Fox <mark.fox@gmail.com>
Subject: Re: Implications of a permissive FORWARD chain
Date: Wed, 19 Feb 2014 02:38:47 +0000 (UTC)
Message-ID: <loom.20140219T033702-14@post.gmane.org>
References: <loom.20140218T183628-993@post.gmane.org> <CAOA3yKL0AaWeg2OEoyjHRZh1padj47byxkrJaTM4vwp1iPL8VQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Ambroz Bizjak <ambrop7 <at> gmail.com> writes:

> It's worth pointing out that packets coming in from interface A with
> the destination address equal to the local address of interface B will
> be considered INPUT, not FORWARD.

Good point. I'll have to test that out.

