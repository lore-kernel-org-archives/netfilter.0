From: Florian Effenberger <floeff@gmail.com>
Subject: Re: randomly changing IPs from different subnets (Google Mail)
Date: Tue, 22 Jun 2010 20:30:09 +0200
Message-ID: <6BE62F49-0B12-4DCB-A421-7D90BDFF0615@gmail.com>
References: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com> <alpine.LSU.2.01.1006222018140.31071@obet.zrqbmnf.qr>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:content-type:mime-version
         :subject:from:in-reply-to:date:content-transfer-encoding:message-id
         :references:to:x-mailer;
        bh=4LiE9ZWxcXSiq2PkMUSaD5lPfG8ytmNtLZsYp6QhWqk=;
        b=csZzZ56VXp79wb4rQ11GdVzvK/VoHb2g748nK9OXjEB51Z0sZzCHLizik4PB4LSRNb
         9G3BWWxRFSfOqkFGt5SHYAxt2hTxG75axwGBzH3nZYb9quQhSw73nt1H3rOOHnmgfPM8
         ceJ03Vq01CRV/6XfitxTF8xwEW/TAeJqwxwnI=
In-Reply-To: <alpine.LSU.2.01.1006222018140.31071@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Jan,

thanks for the fast reply!

Am 22.06.2010 um 20:19 schrieb Jan Engelhardt:

> So create another chain. The in-memory table does not know DNS, and 
> rightfully so.

what does another chain help? I need to keep some records in the tables, because of clients that might have still the "old" address in their cache. The tables get cluttered anyways, no matter if I use one or several user-defined chains.

>> Is there any other approach, other than opening up all traffic to 993 
>> and 587?
> 
> SOCKS proxies.

That indeed would be an option. Or an SMTP/IMAP proxy. Both are not really desirable solutions, but if no one has a better suggestion, this might be a way to go... ;-)

Florian

