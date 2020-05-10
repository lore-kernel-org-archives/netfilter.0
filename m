From: Nick <netfilter@acrasis.net>
Subject: Re: Firewall sometimes leaking [solved]
Date: Sun, 10 May 2020 08:56:05 +0100
Message-ID: <20200510075605.GB27075@acrasis.net>
References: <20200506112449.GD14154@acrasis.net>
 <alpine.DEB.2.21.2005061619330.4108@blackhole.kfki.hu>
 <20200506145726.GA9812@acrasis.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acrasis.net;
        s=selector1; t=1589097369;
        bh=ZW9ScX+TLityxd/LqSYlHBIeIgCtjFfUMBNYEE4qRMk=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=nu13DexnUIGCn6T9+Nrqr59XzaKs0eMc9Zl6fIXBhKGZgqNsokZ07OrohmoAbV6lM
         me4jc1Bo3Qcklmc/D2UnaWKDU0ja8o6CmpZcPblvjfFC9OxMgRiJlE5KrataXhd6Su
         TWzOQ1CtMv+FXY2oQiIH9yfZHMvs+mRIf0hv9QEI=
Content-Disposition: inline
In-Reply-To: <20200506145726.GA9812@acrasis.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 2020-05-06 15:57 BST, Nick wrote:
> On 2020-05-06 15:31 BST, Jozsef Kadlecsik wrote:
> > Maybe the fail2ban rule is applied both for http and https, while the
> > rule with the ipset matching is http only?
> 
> The log file that fail2ban monitors is the log for http requests only.
> No other service writes to that log.

I was mistaken.  Some https requests were in fact getting logged to the
same file as for http, and that was my trouble.  So this was not an
issue with netfilter but my misconfiguration of my web server.
-- 
Nick
