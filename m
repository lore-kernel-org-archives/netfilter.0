From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: RE: Forward packets from one interface to another?
Date: Tue, 3 Feb 2009 11:21:05 -0800
Message-ID: <4988992f.20038e0a.3b6a.ffffd8a6@mx.google.com>
References: <200902031753.59283.Karlis.Repsons@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=K9fFwnmo9MYJQpKXviZYjMPnUK5m7jxQbFMgR54o58M=;
        b=LlS5KU8YPh7+A9cAunhlc2zb2f8HTo5L0+6Issw1GfeK62pLBJx9mzBMKkKnL27c74
         gS7BWUOep2d9v+b/BS930pomy/cDSbsNBEa+7SO5TCpLu3P+764DXvBDysjxDcWF4eig
         PfBSa6yzM5BwxkFzn92/2MupD8IiSPlqc7+GA=
In-Reply-To: <200902031753.59283.Karlis.Repsons@gmail.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?windows-1257?Q?'K=E2rlis_Repsons'?= <karlis.repsons@gmail.com>, 'netfilter' <netfilter@vger.kernel.org>

Your description is not very clear, but my guess is that you want to run a
bridge on this PC. "man brctl" is a good place to start.
Most distributions have an easy way to setup the bridge via the network
configuration files.

If you actually need to set your machine as a router that's a different
issue.

Regarding iptables, you will need rules on the FORWARD table to catch packet
travelling through the bridge.

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] On Behalf Of K?rlis Repsons
> Sent: Tuesday, February 03, 2009 9:54 AM
> To: netfilter
> Subject: Forward packets from one interface to another?
> 
> Hello,
> maybe someone here can help with this problem: I have two NIC ports
> (for RJ45
> I mean) on my PC (pH) and it is necessary to attach another PC (pB) to
> the
> spare port similarly to like it was attached to switch. pB has static
> IPv4
> just like pH.
> But. I want to do it with routing and iptables! Please, please, I have
> always
> failed using two interfaces, I would appreciate an example of how can I
> change it!
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

