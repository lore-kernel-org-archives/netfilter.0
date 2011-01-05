From: doug arro <doug_arro@yahoo.com>
Subject: Why and when to use skb_make_writable()?
Date: Wed, 5 Jan 2011 10:19:47 -0800 (PST)
Message-ID: <701121.82199.qm@web111113.mail.gq1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1294251587; bh=xoN+M4KDGtA5C0IiWDjgG4Sz9syboYJMD8rgPKNf4Ek=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=gDQKvW2AOQIk4VFxg2LsPoTRMhR+fFjEuegplV5VSQJwigPx/9UNTqTylU4CG629JVQYadCXdKqhI5GQp19cKqHs81RSwXc5DBfAfOqNr2VfFAYjkSyvSLz97mRVjMRSqudptmQJ++g8X2vKekE24KiXAmI9d3pncrd2BRTTLmQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

What is the recommended practice for using skb_make_writable()?  I am experimenting with netfilter modules to manipulate IP headers in the mangle table.  Most of the target modules call skb_make_writable() right at the start of the target function but some don't.  What is the conventional wisdom?

Thanks,
doug



      
