From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: module owner does not work
Date: Mon, 1 Mar 2010 11:06:00 +0000
Message-ID: <56378e321003010306n21050b6dwd01154e0420b666a@mail.gmail.com>
References: <15785B7E063D464C86DD482FCAE4EBA5D794CFF8D5@XCH11.scidom.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=GCtbpEwU8BfrjklzE9jAJebj3aCC0PInLh/y4M9Gbgs=;
        b=SzCFXkdTfQRRz/jrMEozJaJkM3vs6vL647AQ8qNXa57Tm+bX+TQlKIFD44rC7k0q49
         EqY/3D66yCuPUwUjcfd/9YjLQHV8fIG5mHxvYShDvYqN9spK+tpWb34QIZsOiL0Y2S7R
         6dpVuyZPcEP+KXVoOXQWFBhz8jpRDwUxfZPF0=
In-Reply-To: <15785B7E063D464C86DD482FCAE4EBA5D794CFF8D5@XCH11.scidom.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 1 March 2010 09:33, Lentes, Bernd <bernd.lentes@helmholtz-muenchen.de> wrote:
> Hello,
>
> I'd like to use the owner module to limit access to somes hosts just for some users. But it doesn't work.
> My rule is:
> iptables -I OUTPUT -d 0.0.0.0/0 -m owner --uid-owner 1000 -j REJECT
> This is a very wide rule, just for testing purpose.
>

Do pings still work?

If you have an MTA locally its probably not going out of the box as
the uid of the process which called mail but as the uid of the MTA...

-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
