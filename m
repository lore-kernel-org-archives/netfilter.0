From: John Little <jlittle_97@yahoo.com>
Subject: Using iptables with high volume mail
Date: Thu, 1 Oct 2009 04:42:31 -0700 (PDT)
Message-ID: <594040.85734.qm@web53111.mail.re2.yahoo.com>
Reply-To: John Little <jlittle_97@yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1254397351; bh=k/f6LYsEPsZHs0AP+irrC36FiQ9FJUWDLlYPauQr0kc=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type; b=skGJqgmkDPiesgbfYUugZg3H7XSch/AxL6EkkO0moYbHx2XS26ssoamasmmB6lrS+FJ6iKFpAaWPfe9ZhLjIr9iogpaSX7YAWlyWxQ9VGDIAzMLKP7U/qLca5Ao3Z4i/EaFP1BnS7nnDLRbxOfzIk0+WEYQ+1JxjPT+ZL+QNfAc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I work for a major email service provider.  Our
management has asked us to investigate using iptables as "NAT engine"
for outbound mail.

The outbound mail is the only traffic the
server will see.  No inbound mail, web, etc.  The machine(s) will have
a public facing NIC and a NIC for the internal LAN.

The machines will see over 1 million emails in a 24 hour period.

My questions are:
Can iptables handle this volume?

What modules, tables and rules to use to optimize iptables for this type volume?  All of the mail is sent on the standard port 25.  We need to optimize for quick deliverability.  (I've read the man page and looked at TOS with the mangle table.  I read somewhere that this only for udp.) 

Is there a way to estimate how much hardware we would need for a given volume of mail?

Are there any use cases that I can show management?

Is there commercial support available?

We really want to sell this to management.  We have gone through 2 major brands of commercial devices for NATting that aren't making the gradefor what we are paying.  Any ideas and insights appreciated.

Thanks,
John


      
