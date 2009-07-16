From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: state ESTABLISHED, RELATED
Date: Thu, 16 Jul 2009 09:21:44 +0100
Message-ID: <56378e320907160121wc060b93sd193f2ba4fdb88c2@mail.gmail.com>
References: <4A5E3B43.4050408@darkarts.no-ip.org>
	 <1247726560.15457.77.camel@TestField.intranet.bem.md>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=w6sMVQdhmcpVbJCwylevCYWH3px9I7fUNyaU8VhdqdY=;
        b=iZMwfNxhwIRR0aI1NLv5hKQVm6bEj3VpWLyDoHFcK8bnVgjaumABMn93AgEeF0Hhqw
         0hbNKIlU6ahigs4SvRC/xnxsHJOlQvpGjYBzi5fGNX7KmZOdLDHgoRKn56iKcA9Fb6/D
         tZVUn0JEMeIfwn84pqm8ToSTiZpLFHR8c/T+s=
In-Reply-To: <1247726560.15457.77.camel@TestField.intranet.bem.md>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

2009/7/16 Simion Onea <simionea@gmail.com>:!
>
> In my opinion it is good practice. We have been using such a rule for
> some time. In our set of iptables rules we have these in the beginning:
>
> #------
.... snip  long set of rules...

> The same rules can also be applied to FORWARD chain.
>

As a thought could you add those to a custom tables, say for the sake
of example shared:

iptables -N shared
iptables -A shared <whatever>

then in the input chain and forward chains make the first rule a jump to shared.

This makes it easier to manage the 'common' rule set as you only need
to change it at a single point rather than having to remember to
change both occurances...


-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
