From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: RE: iptables terminating targets
Date: Mon, 5 Jan 2009 12:22:59 -0800
Message-ID: <49626c31.1e078e0a.2f44.ffff94af@mx.google.com>
References: <09c4m418mn35t08207s4v176f82e1jtrn7@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:mime-version:content-type
         :content-transfer-encoding:x-mailer:content-language:thread-index
         :message-id;
        bh=Hctn9TzO93vrHGrOzgAzg4c7RQLwAWt/KSm8PpwR90U=;
        b=AGLeFoWamElYxnC/svCnY9+8ssfTD1eWCqx5kgQLNwGYFE5NaV0hDvqz191bp96ODj
         Fj7GcmDO/oBkGaPTHysTld4awdX5Gt2cuu92RvEf1vv7AQlVhXWQr2IybKLWHKnZg90x
         hOz3wOApEAC6GKJmCUi+pcDCX6Ymmeg86YDD4=
In-Reply-To: <09c4m418mn35t08207s4v176f82e1jtrn7@4ax.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: BrainChild@Skyler.com, netfilter@vger.kernel.org

> <trimmed>
> ...
> <trimmed>
 
> Here's what I don't understand: From what I read, terminating targets
> like ACCEPT and DROP stop consideration of any further rules in any
> tables and chains.  It also seems like all the built-in chains have a
> policy of ACCEPT by default, and the policy target is effective if no
> rules match in the chain.  I have seen no way to _remove_ a policy
> from a chain - only _change_ the policy target.  This seems to lead to
> the (obviously false) conclusion that only one built-in chain will
> ever be considered - the first one.  If a rule doesn't terminate, the
> policy will!

Up to the (false) conclusion, all your assumptions are true. I believe I see
the source of your confusion, which was also mine when I started with
iptables.
Each built-in chain is traversed at a different location (a.k.a. hook) in
the packet path. See two graphic variations of this below.
A terminating target means that the packet has completed traversing the
current built-in chain, but might be further processed by other chains, by
means of a different hook. 
Specifically for the FILTER table, which is your main concern for a
firewall, its hooks are located such that each packet goes through exactly
one built-in chain of the table.

- http://jengelh.medozas.de/images/nf-packet-flow.png
- http://linux-ip.net/nf/nfk-traversal.png 

HTH,
Gilad


