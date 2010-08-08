From: Billy Crook <billycrook@gmail.com>
Subject: Re: openvpn over udp failing
Date: Sun, 8 Aug 2010 16:57:23 -0500
Message-ID: <AANLkTinaci7R4K0EhxLs0xGCTbO=Kh5Qtw1_pJ7YL+Ws@mail.gmail.com>
References: <BAY145-ds3FB0B1B5B904843D4A32BF3910@phx.gbl> <AANLkTinxMMe_dAENYJr+hQS0R7TWUbcc1OyuOOzNrcHC@mail.gmail.com> 
	<BAY145-ds18BAB524B0EF1EE2DAF424F3920@phx.gbl> <AANLkTi=W8+Rm_9HjYi3H0kEOS8snau9025vhi9szuEb_@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type;
        bh=jobTkHS06xn+BnWfiuX1QW1a5y7uHvUGQSqUw3kQoDI=;
        b=GfNBowLf6wlzmzaFaivXYx7xoRAky/02ayqlw9gRJlSE4J3f8yWMxNIuXFafLEkLUl
         AEq/wgCIIt59N/0S3aiKmFciNMwnJVU+xHsdnLgKrEIchdaa1BfLH/8XqS7lWvCo9cHh
         yISkx+uZzTagFfWP29FA44BjguFnvLcE6Wnts=
In-Reply-To: <AANLkTi=W8+Rm_9HjYi3H0kEOS8snau9025vhi9szuEb_@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: J Webster <webster_jack@hotmail.com>
Cc: netfilter@vger.kernel.org

On Sat, Aug 7, 2010 at 12:18, Billy Crook <billycrook@gmail.com> wrote:
> man openvpn.
> /--local
> /--bind

The above will make openvpn server listen on exactly one IP which i
think you do prefer.  I spoke with openvpn main develoer James Yonan,
who offered up  --multihome if your server is runnign the 2.1
codebase, which will continue to let the server listen on all IPs, but
reply from the "right" one every time, even on udp connections.
