From: "Marco Barbero" <marco.barbero@gmail.com>
Subject: Re: conntrackd causes kernel panic
Date: Mon, 9 Jun 2008 19:33:20 +0200
Message-ID: <e1aa27e00806091033j3c260b2du91d91246add234e1@mail.gmail.com>
References: <200806091607.53861.sabelka@iue.tuwien.ac.at>
	 <200806091925.00809.sabelka@iue.tuwien.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=GF1TZ631MrLiJQwFiKtnAeUIVW0XdQVUapV3yyY38U4=;
        b=lz4wH3HpyaFRPER4sajoA51sd96qDyDiOvlRo+NwMMoJYT8xKW+zfwQUfs6vIvVgC7
         sX2TBhaRJcn69x58oJ6rr+GJT6zYD+673gXTjpbjN+T/7d+PHOOywz+D0jl7S1jwVak0
         EdFfBCMw0fCdWgpCHG8UQLH6sb3sE7UYbose4=
In-Reply-To: <200806091925.00809.sabelka@iue.tuwien.ac.at>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

2008/6/9 Rainer Sabelka <sabelka@iue.tuwien.ac.at>:
> On Monday 09 June 2008 16:07, Rainer Sabelka wrote:

>> I'm getting these kernel panics when keepalived switches the backup host to
>> active.
>> Manually I can trigger the kernel panic when I execute "conntrackd -c" on
>> the backup host (sometimes "conntrackd -c" executes sucessfully, but it
>> crashes at the latest when I repeat the command a few times).

Had same issue (see my post today).  I solved using last kernel
(2.6.25.5). Still I'm getting 'entries can't be committed' like you.
Hope Pablo can help

Regards
