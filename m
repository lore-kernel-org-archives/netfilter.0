From: TEJAS <tsevak@gmail.com>
Subject: Re: debug iptables rules
Date: Mon, 22 Aug 2011 20:40:09 +0530
Message-ID: <CA+b04XnQ-cKfU9KUu9j_Tf0vp0jtadnNu69_Gob1mPAXVkytMw@mail.gmail.com>
References: <CA+b04XnYFUcukqbmQXiKbY4VjUaFs3red56Jfnzm4pj+z6ndRw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=lKRKvrcCx39chfE4Pe4v0H7IsVs62TewXwhQQn658z0=;
        b=QDShePRnxEDiFxcJv+SQvE/6BM/EdmmqFETkdWl+T8PhL0dEkkHKBXsriLVbVJ2wWe
         vP7clj5gvln0H+V5E11wQF7YbLeY9pKSj6If/aE7cp2Ynw708hv/pkhtBYgRtBVCoXB+
         mGE3QySQwFbRjHB6k1dXUviqnLmN05wfdYWa4=
In-Reply-To: <CA+b04XnYFUcukqbmQXiKbY4VjUaFs3red56Jfnzm4pj+z6ndRw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi All,

I am new with iptables.I write certain iptables rule for my internal
network , i write rules for SNAT for internet sharing and some others
for configuring some restrictions.It is working fine.But i want to
debug these rules in live motion.I want to see what happening with
packets while they traverse from iptables rules.

=A0Is there any method or any tool or anything to see what happening in
snat rule and what happening in others iptables rules.

Thanks,
Tej
