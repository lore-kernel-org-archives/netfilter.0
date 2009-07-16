From: Simion Onea <simionea@gmail.com>
Subject: Re: state ESTABLISHED, RELATED
Date: Thu, 16 Jul 2009 11:54:57 +0300
Message-ID: <1247734497.15457.78.camel@TestField.intranet.bem.md>
References: <4A5E3B43.4050408@darkarts.no-ip.org>
	 <1247726560.15457.77.camel@TestField.intranet.bem.md>
	 <56378e320907160121wc060b93sd193f2ba4fdb88c2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=Vp6Tdqx4r0hHDpc/VEiXzpS0fRDedzVj9AYL4Vhpo0A=;
        b=OQO8XS9Wzct3fzPlcg4fRkTuQPl7+atkEn83rKW28qsRXfUfir5y+zCjJlCMSGvz5M
         EM4kdD42oHTby3Vcfv5t7vI1sKpaim2WLmuofKJ3DA64lyzzLleqseNQKh4UTPp9HP5x
         TrH8eeGXSvPrNyNvlxsn0uvW6SAEl2pUcXvjQ=
In-Reply-To: <56378e320907160121wc060b93sd193f2ba4fdb88c2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Horton <arimus.uk@googlemail.com>
Cc: netfilter@vger.kernel.org

On Thu, 2009-07-16 at 09:21 +0100, Richard Horton wrote:
> As a thought could you add those to a custom tables, say for the sake
> of example shared:
> 
> iptables -N shared
> iptables -A shared <whatever>
> 
> then in the input chain and forward chains make the first rule a jump to shared.
> 
> This makes it easier to manage the 'common' rule set as you only need
> to change it at a single point rather than having to remember to
> change both occurances...

Yes, I agree.


