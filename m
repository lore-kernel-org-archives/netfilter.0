From: Sebastien Tricaud <stricaud@inl.fr>
Subject: Re: Userland Netfilter
Date: Thu, 30 Oct 2008 17:47:09 +0100
Message-ID: <1225385229.5690.33.camel@roken.inl.fr>
References: <4909d7a5.0fba720a.690e.70fc@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4909d7a5.0fba720a.690e.70fc@mx.google.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gilad Benjamini <gilad.benjamini@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 2008-10-30 at 08:49 -0700, Gilad Benjamini wrote:
> I need to create a userland simulation for filtering packets.
> I remember running into a userland netfilter, but can't seem to find it. Any
> pointers or info would be appreciated.
> Another option is to feed the packets into tun/tap devices, and let the real
> netfilter do the job. Performance, of course, is not a concern in my case.
> Does that sound reasonable ? Tun/tap seems to be an almost dead project.
> Will it work in newer distributions ?
> 

Hello Gilad,

I highly recommend you to use Pierre easy bindings, so that you can
write your simulation in either Perl or Python :

http://software.inl.fr/trac/wiki/nfqueue-bindings


Regards,
Sebastien Tricaud.


