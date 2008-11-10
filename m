From: Simon <greminn@gmail.com>
Subject: Re: Altering firewall rules to enable NAT Reflection
Date: Mon, 10 Nov 2008 16:06:02 +1300
Message-ID: <5bdb1aa70811091906v5b5f0caco6bac4de9cea23cc5@mail.gmail.com>
References: <5bdb1aa70811061525h36988a9cr3db531232e4422d5@mail.gmail.com>
	 <49149060.70100@riverviewtech.net>
	 <5bdb1aa70811091514t506c9f7dib2d40ac26bba02b0@mail.gmail.com>
	 <49178DAF.5090105@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=JXXCa2qQYTN2phGgAsbqNm4JPMz7HSUCDqVLFHEbkyI=;
        b=cNkIV0g8/T51U24XWZdFQJ0W2dt7O+sHWBUnYaN4xCdqGjIlk0PAaXD4l/CMn46VTg
         bnGf7aA0iahBXIwd/O/sGJrmnf6EhaOc1RqTReXgVvf5lXaSrAHqkXzeTgrbuoKeQMGJ
         KBgU2JZOZYtChZ6zBzOBoETj0eNy+pYOosMig=
In-Reply-To: <49178DAF.5090105@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Mon, Nov 10, 2008 at 2:26 PM, Grant Taylor <gtaylor@riverviewtech.net> wrote:

> With out knowing any thing about what "... the web interface ..." is I can't
> say any thing about where you are at.
>
> However your rules look like they are doing the DNATing (presuming that your
> ""external IP is 192.168.2.2) properly (presuming that 192.168.1.<something>
> is your internal IP).  However you are not doing any SNATing to hide the
> fact that your internal LAN clients are being redirected back to the the
> internal server when they try to reach the external IP.

OK.. Ive got it. I changed the external interface to PPPoE and also
changed from IPCOP to Endian firewall. In Endian, there is a nice
pretty GUI with a "Enable SNAT" checkbox.

ohh Ahh its working!

Thanks for your help anyways, i learnt some more!

Simon
