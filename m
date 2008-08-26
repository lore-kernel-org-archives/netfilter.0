From: "Billy Crook" <billycrook@gmail.com>
Subject: Re: Question about packet flow picture.
Date: Tue, 26 Aug 2008 09:04:17 -0500
Message-ID: <a43edf1b0808260704k947044ekf0d9ba51dd4e2577@mail.gmail.com>
References: <4c4b58e80808251641ge01d7e4pca4fff19e8621d8a@mail.gmail.com>
	 <a43edf1b0808252023w4e48d4c5j23e2bfa3014f156@mail.gmail.com>
	 <4c4b58e80808260556o1f25214el31cf22bd2284156e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=dSEwAoookXGT9VfmmuZYKTyYrByEp9nR6Y23RB/ku2A=;
        b=ASWg9iJv/SAdQvns2N9Pnf/aoYN7QDcKqfeIWQGbpq2MGuYBgtsyJ3P1Fjmy66jrCD
         miTNpJcIAa+dfpZ4pAazxmGr4cmONUnSnVQBHMme3bnZnn9M2KmLVDPh6trot87zZInH
         Q0qJnVKR3XbA+LtTAoSkVhMiTV+cDBXEXzn/8=
In-Reply-To: <4c4b58e80808260556o1f25214el31cf22bd2284156e@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jose Ildefonso Camargo Tolosa <ildefonso.camargo@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, Aug 26, 2008 at 07:56, Jose Ildefonso Camargo Tolosa
<ildefonso.camargo@gmail.com> wrote:
> OUTPUT (raw) ---> Conntrack ---> OUTPUT (mangle) ----> reroute
> check???? ---> OUTPUT (nat)
>
> Shouldn't the "reroute check" go *after* OUTPUT (nat) ?

I'm not sure

> and I have one doubt:
>
> It says that:
>
> ebtables OUTPUT (nat) --> ebtables OUTPUT (filter) --> ebtables
> POSTROUTING (nat) --> Network Output
>
> But, shouldn't it "reroute" the packet after ebtables OUTPUT (nat)?

To where should it reroute?  EBtables lies underneath iptables,
between it and the hardware (usually).  When ebtables is done with the
packet, it'd done with it.
