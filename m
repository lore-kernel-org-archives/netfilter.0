From: Pieter Smit <mlist2010@vigor.co.za>
Subject: Re: iptables rules in comparable form
Date: Tue, 1 Jun 2010 22:29:10 +0200
Message-ID: <AANLkTinkkj9uoIobFJzyJvCk7BN91MVM8T0mohR1vh8b@mail.gmail.com>
References: <20100601081053.GA13943@q.uh.cz> <alpine.LSU.2.01.1006011043190.3431@obet.zrqbmnf.qr> 
	<4C04D07F.6040702@chello.at> <20100601112552.GA15745@q.uh.cz> 
	<alpine.LSU.2.01.1006011353310.22291@obet.zrqbmnf.qr> <20100601180106.GA19088@q.uh.cz> 
	<alpine.LSU.2.01.1006012020370.15461@obet.zrqbmnf.qr> <20100601193629.GC19088@q.uh.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received
         :in-reply-to:references:from:date:x-google-sender-auth:message-id
         :subject:to:cc:content-type:content-transfer-encoding;
        bh=jDR4QIYxw2trQ6z9XNt4eJZxj7IvyL9guV0dwJv/+0E=;
        b=TmoHVRAd9+1zjAVobYIuXsauIutpDSrePjsga0HlrXGjbNTIxzzzC53s+oVhIbnwzV
         jFBNIs4UXTX9kvT+HXFZf8TgTcI4V1HjIFx0s15udrwWEjqaaomdujTq7OcFPqrIwb1q
         P1pyeIvvhyrA4J02I/RaCEQ4JmEjIxmHo0a4o=
In-Reply-To: <20100601193629.GC19088@q.uh.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Radek Kanovsky <rk@dat.cz>
Cc: netfilter@vger.kernel.org

Radek, your problem is getting the rules into a standard format, where
you can match them to existing rules.

Would a solution/workaround not be to
1. create a dummy test chain/table not being used.
2. add new rules to the chain/table  (have to modify them slightly) 1 b=
y 1
3. retrieve them in a standard form as provided by iptables-save -t tes=
t
4. spend time in python routine to match and decide what to remove/upda=
te.
5. make single insertion/replacement if needed.
6. clear test table and start with next rule.


On Tue, Jun 1, 2010 at 9:36 PM, Radek Kanovsky <rk@dat.cz> wrote:
> On Tue, Jun 01, 2010 at 08:26:30PM +0200, Jan Engelhardt wrote:
>
>> Sounds like you need xt_quota2. As its counters are independent of
>> rules when given names, they can never get set back to a value
>> less than what they were.
>
> I wanted to avoid any nonstandard packages but this looks promissing.
> I will take a look. Thanks.
>
>> As I said before, there is no concept of unchanged rules.
>>
>> When you iptables -A, the entire ruleset is fetched from the kernel,
>> then modified, and finally reinserted - even when having only
>> added a single rule.
>
> But I have scalability problems even if there is declared O(N)
> complexity of iptables-restore. There is a really big difference
> if counters are reset at 9:14:01 or at 9:14:53. I am not sure
> what COMMIT during restoration exactly do but can't it be
> used for tuning in such cases?
>
> Radek Kanovsky
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
