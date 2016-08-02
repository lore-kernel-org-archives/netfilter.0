From: Imran Geriskovan <imran.geriskovan@gmail.com>
Subject: Re: Iptables-nftables transition: DNAT on Output
Date: Tue, 2 Aug 2016 15:36:24 +0300
Message-ID: <CAK5rZE6mczN6WZ=+CQpSuH_pBWtDOUrD08YpDRgtOi_M8dhLfA@mail.gmail.com>
References: <CAK5rZE4HykuUgQ+brqU+nH-TUEwVFS+y8XxcVyPx3mBGegb7jg@mail.gmail.com>
 <CAOkSjBiq2KEzaE+csSgExBoSk+QRAnKEna7mcptCR33gPd54_Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=CG/jy+uTVlaPXDrubNlcpcIABc/5R/CBneNrRVZFkgo=;
        b=EN09j8RPNnHC11nR7yNROtxO/0jd3cVbAH4RUyH7PDHArxosRqO5domIULUQjkn/14
         8vYn+kxY2/tV8Tc+/xalx5e59xk0e2sEqsQDYEgwiYv0rbVtEXk+ygv3O3U5TK9gE0Pu
         n2v5mN+ll+pOX4SotSROaqpqzaxoMrg4iuBfIZLxCyTMZZtx9kTaDS+QvwE1dCTGwzkg
         1lAKlai6PIWX4zqq6TZchXaBBOVfdu3MkwSZol4SNI1EHXmtzWbdY3vz57qewMWZocUG
         dXEC8B9b8D9bnD2WQ/TVt4oNkreDD22xB9Q2A93LarcVC+EOpriv/Ah50c2XFcB1/iNT
         Qs6A==
In-Reply-To: <CAOkSjBiq2KEzaE+csSgExBoSk+QRAnKEna7mcptCR33gPd54_Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 8/2/16, Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com> wrote:
> perhaps the error is your base chain: seems to be of type filter.

Thanks for the comment..
Following does the trick:

chain outnat {
  type nat hook output priority 0;
  skuid imran tcp dport XX dnat 127.0.0.1:YY
}

chain postnat {
   type nat hook postrouting priority 100;
}
