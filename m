From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: Is viewing a "candidate" ruleset in 'nft list ruleset' format possible?
Date: Thu, 23 Apr 2020 08:10:24 -0400
Message-ID: <CANf9dFO1rySYE3hMOk+iC=KOVhyomZ8Rbh9MBH3A=bo=Ns4dRA@mail.gmail.com>
References: <CANf9dFNVrz_YjQ2Xe9vZP=U5h-3C7Hxk+oDz9rTD8Q4nALHO5A@mail.gmail.com>
 <87blnkqg1j.fsf@goll.lan> <CANf9dFN=DA1eP6W8A5GOAseXvB57_wf=U9Trjk6fY1M58qgfaA@mail.gmail.com>
 <20200423020613.GE30155@dimstar.local.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=I1ze5w5ji5b8DCSRNdW0MpaCr7bQMrHSQyv2Z5zDiBY=;
        b=q273BmAONgz8UDK4/iM7I48IzmdcZYQnNcGpAAF9aUt7vAAsaDzCsREHZZfhs8kwtU
         HnvJePymGJCTDjcTNvTt7kq2chmXnmnKxZ7jTpe5bPZbBARoAXXQ0M05PWVGZbX8UT2Y
         ag7CNjX2o3vkYi5sYT2OeyzdTvzoRjsGUVxwr9PLtx5bk+K/BctlPGtmuT38k71sNAqQ
         dwOFO4STB1fpc4C3QfkcmIgrwz4S1Qmt5YRlBeq2HFku1jn69o+uofwMH35UP4dY3Vo4
         U+4ftkD/sCCxrf/5G38e5LhVrh8tBVEwLjzb8cubsqv5k/iSjvJ9djlQY+GDDHpIZ/19
         HmNQ==
In-Reply-To: <20200423020613.GE30155@dimstar.local.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> "list ruleset" at the bottom of an nft script is completely accurate. The
> command "nft list ruleset" discards portions of rules that are implicit, in the
> interests of brevity.

> > Of note is the fact that the 'ct state' line does not contain both
> > states.

> It does show it. There are 2 bits set in 0x6. Perhaps it is an oversight that
> the code path does not interpret them.

Point taken. I guess it's just because the output of 'nft list
ruleset' seems more "human readable" to me than "list ruleset" at the
bottom, and I'd rather use the former output as a base for diffs.

Thanks,
-Martin
