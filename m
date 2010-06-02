From: Radek Kanovsky <rk@dat.cz>
Subject: Re: iptables rules in comparable form
Date: Wed, 2 Jun 2010 08:17:59 +0200
Message-ID: <20100602061759.GA23633@q.uh.cz>
References: <20100601081053.GA13943@q.uh.cz> <alpine.LSU.2.01.1006011043190.3431@obet.zrqbmnf.qr> <4C04D07F.6040702@chello.at> <20100601112552.GA15745@q.uh.cz> <alpine.LSU.2.01.1006011353310.22291@obet.zrqbmnf.qr> <20100601180106.GA19088@q.uh.cz> <alpine.LSU.2.01.1006012020370.15461@obet.zrqbmnf.qr> <20100601193629.GC19088@q.uh.cz> <AANLkTinkkj9uoIobFJzyJvCk7BN91MVM8T0mohR1vh8b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinkkj9uoIobFJzyJvCk7BN91MVM8T0mohR1vh8b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pieter Smit <mlist2010@vigor.co.za>
Cc: netfilter@vger.kernel.org

On Tue, Jun 01, 2010 at 10:29:10PM +0200, Pieter Smit wrote:

> Radek, your problem is getting the rules into a standard format, where
> you can match them to existing rules.
> 
> Would a solution/workaround not be to
> 1. create a dummy test chain/table not being used.
> 2. add new rules to the chain/table  (have to modify them slightly) 1 by 1
> 3. retrieve them in a standard form as provided by iptables-save -t test
> 4. spend time in python routine to match and decide what to remove/update.
> 5. make single insertion/replacement if needed.
> 6. clear test table and start with next rule.

Its not viable because I need also minimize the number of iptables operations.

Another solution could be to dynamicaly load iptables extensions
modules into my script and use somehow their parameter processing
code if possible.

Regards

Radek Kanovsky
