From: Vieri Di Paola <vieridipaola@gmail.com>
Subject: Re: iptables TRACE not logged
Date: Mon, 14 Sep 2015 11:31:13 +0200
Message-ID: <CABLYT9jwt3qHLRRYd8ctPZmg5FkTyeEhtEs=1-sX3emy=cLomA@mail.gmail.com>
References: <CABLYT9hQERBkQWskobkKb8tJ64is48e8_4joAYivjo4a+_e+GA@mail.gmail.com>
	<20150911122803.GA5460@salvia>
	<CABLYT9i-i5oaXkAmeVSXGbsob5kfcX5RQM8xktzAj7f273BriQ@mail.gmail.com>
	<20150911153751.GA3581@salvia>
	<CABLYT9gFA=khGxc6aFkDkBuoacKi_cB2Awv0h7WQXUpJ8MEC1g@mail.gmail.com>
	<20150913115016.GD3691@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=lie+Ht5lyOiViyvNv1bI+0QjxAG2y6znYVl/QQ1/nfM=;
        b=wD/8seJ8Cyl4UX3xhPoLfxOSZ1OSvyFJ8mUu/yFdgceIImG1rZ5yWAcJhYnrABJV21
         bIIIBih9gviOEpG+5KfEh//wF9qppl57UrT16Q8RvWTa/Hz/Djl9nAEfsUXodrJVAcQW
         3YBlIF0loH5itwgK/ny3JSFK8PdntJFHKQRGirCogP3rKHwTmkD6AIXeRIEGNH++h0Qn
         bI9jCfYs6DZLoKzFrvr++6uhO+BDmGSW2A+LLtH/GWtozhO7DuNlc9TQdB7DW8lTpUEc
         RzIO3Cd3FzfOe+2avR49Y3l8MTLNDueUW1vYvaOlyE+5NXVAmB6tRPBVt8Iw1eOxho+0
         ofng==
In-Reply-To: <20150913115016.GD3691@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sun, Sep 13, 2015 at 1:50 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> BTW, this used to work with ipt_LOG, right?

I believe so.

Vieri
