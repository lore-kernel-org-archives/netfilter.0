From: Billy Crook <billycrook@gmail.com>
Subject: Re: Bastion Firewall Host Redirect Question
Date: Tue, 14 Dec 2010 14:01:02 -0600
Message-ID: <AANLkTi=xSuKsKw7UPiR1aTCCf0G9AGt7tiu6Unu3PCUA@mail.gmail.com>
References: <000601cb9b9e$c6e81e30$54b85a90$@com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type;
        bh=xvv3mEDWU72weWGtsYqdfUNW5UMLYOAPeqLn8wNXTSk=;
        b=IXbs+pNQzQfZ/2N1dd4skNsQDYPQbQWsR7IvBh3T3gML57YK5+hw8TjKDUaABqE6Hc
         LMTtzI6ZQZOwF4U6BM+hdWDoOLtOVvLKzi8RxxALw9okz9bZbGe+N4nc8J3nqlXHwDR3
         2FlPr1h6co3MtBogtnOcWLUCxwXzVZr04yB2U=
In-Reply-To: <000601cb9b9e$c6e81e30$54b85a90$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iic1tls@yahoo.com
Cc: netfilter@vger.kernel.org

On Tue, Dec 14, 2010 at 08:54, iic1tls <iic1tls@yahoo.com> wrote:
> I have attempted several iptables rules, including:
> iptables -v -t nat -A PREROUTING --in-interface eth1 --dport 80 -d
> www.website.com -j DNAT --to 149.10.10.25

When you hit enter to commit this rule the iptables command resolves
www.website.com to an ip address, and then hands the request to add a
rule to netfilter.  The in-kernel rule will not change when
website.com's IP changes, which may happen at any time.  If clients
get a different IP for website.com (say they have multiple IPs), their
access will not be intercepted by the iptables rule.

iptables does not filter on domain names.  You must absolutely, and
without exception, do something in addition to iptables, like
intercept all DNS queries or force all web traffic through a proxy.
