From: "Jose Ildefonso Camargo Tolosa" <ildefonso.camargo@gmail.com>
Subject: Re: Question about packet flow picture.
Date: Wed, 27 Aug 2008 08:26:24 +1930
Message-ID: <4c4b58e80808260556o1f25214el31cf22bd2284156e@mail.gmail.com>
References: <4c4b58e80808251641ge01d7e4pca4fff19e8621d8a@mail.gmail.com>
	 <a43edf1b0808252023w4e48d4c5j23e2bfa3014f156@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=AJiutERC3gjCHtSwugpuZ+oXS1Z28FoP2y2lRce10qI=;
        b=jShXryOJREg+vWKbHiCirEbuuZ8NPuDlV4y6tu23sFc1R6PZA0anS16Mp7PxYju73S
         w0ndnKDFcRqtTMhZXx1ieYdOoDao2CWRvHnrJGWwqZ8g+jfct6UoUiTW9YJ00150PDvD
         5Ifs7vzvmGPBsU/WK1Qe7S4lJIrL60U1lJwLo=
In-Reply-To: <a43edf1b0808252023w4e48d4c5j23e2bfa3014f156@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Billy Crook <billycrook@gmail.com>
Cc: netfilter@vger.kernel.org

Hi!

Thanks for the answer!

On Tue, Aug 26, 2008 at 10:53 PM, Billy Crook <billycrook@gmail.com> wrote:
> I do not believe it is accurate.  Primarily because  it appears to
> indicate that forwarded packets go through the INPUT and OUTPUT
> chains, and AFAIK, they do not.
>
> This is much newer, and I believe, more accurate:
> http://jengelh.medozas.de/images/nf-packet-flow.png

Sure it is, it looks pretty much like a "new version" of the one I
use.  I only see one detail, it says that:

OUTPUT (raw) ---> Conntrack ---> OUTPUT (mangle) ----> reroute
check???? ---> OUTPUT (nat)

Shouldn't the "reroute check" go *after* OUTPUT (nat) ?

and I have one doubt:

It says that:

ebtables OUTPUT (nat) --> ebtables OUTPUT (filter) --> ebtables
POSTROUTING (nat) --> Network Output

But, shouldn't it "reroute" the packet after ebtables OUTPUT (nat)?

Once again, thanks for the answer!

Sincerely,

Ildefonso Camargo
