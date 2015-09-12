From: Vieri Di Paola <vieridipaola@gmail.com>
Subject: Re: iptables TRACE not logged
Date: Sun, 13 Sep 2015 00:13:41 +0200
Message-ID: <CABLYT9gFA=khGxc6aFkDkBuoacKi_cB2Awv0h7WQXUpJ8MEC1g@mail.gmail.com>
References: <CABLYT9hQERBkQWskobkKb8tJ64is48e8_4joAYivjo4a+_e+GA@mail.gmail.com>
	<20150911122803.GA5460@salvia>
	<CABLYT9i-i5oaXkAmeVSXGbsob5kfcX5RQM8xktzAj7f273BriQ@mail.gmail.com>
	<20150911153751.GA3581@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=VF6fNKn7rIsBlbU7b4gGQDsrfB1N3RTKwEw3vw5Ka0g=;
        b=oyngQgIzNeE2Z4yPl0iNpYqk0JlH43OExIa7junsMPBYg/FjGoO3ap3sAZlbbJ4aCq
         8cBa/0IrUk059kNbLYnsVUyX0qIYpGyNRp54u2SmFyzYDd9WeYzwgXGydiwos8GRwZaO
         JV4XBrRtJe/7V36SrpV/V+guird2EvRisywu5SRaXi4s+GoDMhaHFWsuH4V1yNHkXUMY
         VtS6t6l6eNGHLsuSZULqmdy0jlBAXHAwQ2eZa3xfTr4KR5MkYC/hzTM920RvdyN8+5Yt
         xgqd8j2oY3NFkA4z2I6dfu31E1F3HTjtLS4ZOwpsYMMV8DhzuIH6+woB6eBjpH0RyEah
         LF3w==
In-Reply-To: <20150911153751.GA3581@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Thanks Pablo.
This worked:
sysctl net.netfilter.nf_log.2=nf_log_ipv4
Now I'm getting TRACE messages in system log.
