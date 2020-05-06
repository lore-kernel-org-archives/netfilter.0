From: Nick <netfilter@acrasis.net>
Subject: Re: Firewall sometimes leaking
Date: Wed, 6 May 2020 15:57:26 +0100
Message-ID: <20200506145726.GA9812@acrasis.net>
References: <20200506112449.GD14154@acrasis.net>
 <alpine.DEB.2.21.2005061619330.4108@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acrasis.net;
        s=selector1; t=1588777047;
        bh=2aRv18atg01T9l2rFv/DC7ftaxz4aNtq+sVhqAAIMFA=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=SygbozT7fmwDonIpuNqsJtIj512VasWGLAsa4LWsNnTTwBxg+oz91KT9g92OC2oXh
         s8+Fg3st2aqEOzKpJMcHEkQdC72dseAzBlKAr8qVvhNLUtSWzR7SNWjI9OBwoYcRXY
         zjks/4Vi1ogIlDWQ4N6P4XuXPbjyLW9m1Xaif6dM=
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2005061619330.4108@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 2020-05-06 15:31 BST, Jozsef Kadlecsik wrote:
> Maybe the fail2ban rule is applied both for http and https, while the
> rule with the ipset matching is http only?

The log file that fail2ban monitors is the log for http requests only.
No other service writes to that log.  The ipset is for http only.

I'm unclear about the import of your question though: by the time of the
http request at 04:22 fail2ban had done its thing and was no longer
involved.  fail2ban had put the address into the ipset but netfilter,
for reasons I don't understand, apparently ignored it.
-- 
Nick
