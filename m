From: Vitaly <vitaly_il@yahoo.com>
Subject: Re: How to drop existing connections
Date: Mon, 7 Apr 2008 02:05:27 -0700 (PDT)
Message-ID: <316483.74640.qm@web65716.mail.ac4.yahoo.com>
References: <006e01c8988d$16d2bee0$87035a0a@KarimAsif>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <006e01c8988d$16d2bee0$87035a0a@KarimAsif>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


--- Karim Asif <karimas@kfupm.edu.sa> wrote:

> Using iptables?
> just add a drop rule having src/dest ip addressess
> and ports and protocol on
> top of other rules.

Probably I wasn't clear - I want to kill existing,
already opened connection. 
Now, after reading some articles/threads, it seems
that only utils like tcpkill, cutter can do this...

> 
> ----- Original Message ----- 
> From: "Vitaly" <vitaly_il@yahoo.com>
> To: <netfilter@vger.kernel.org>
> Sent: Monday, April 07, 2008 11:30 AM
> Subject: How to drop existing connections
> 
> 
> > I'd like to kill all existing connections to the
> > specific IP/port. What is the simpliest way to do
> > this?
> >
> > Thanks,
> > Vitaly
> >
> >
> > 
> >
>
____________________________________________________________________________________
> > You rock. That's why Blockbuster's offering you
> one month of Blockbuster 
> > Total Access, No Cost.
> > http://tc.deals.yahoo.com/tc/blockbuster/text5.com
> > --
> > To unsubscribe from this list: send the line
> "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at 
> http://vger.kernel.org/majordomo-info.html 
> 
> 



      ____________________________________________________________________________________
You rock. That's why Blockbuster's offering you one month of Blockbuster Total Access, No Cost.  
http://tc.deals.yahoo.com/tc/blockbuster/text5.com
