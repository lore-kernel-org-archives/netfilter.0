From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: Possible IPTables bug in INPUT interface filtering?
Date: Wed, 21 Apr 2010 22:30:42 +0100
Message-ID: <j2h56378e321004211430xc2912428wab13e04f016b4f2d@mail.gmail.com>
References: <p2l464fbb2d1004152012p719184c9g57ac7c7562994929@mail.gmail.com>
	 <t2p186ebf761004211127k7512fb29r5b4873627925fece@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type;
        bh=bsxliq8fS/IEBcdm3oDznUrONagGA9fg2xEI9ZeW+Vk=;
        b=OBqLTdvtnzQIsKo8Tqj/BOe17PL5R1txx+IUl3axYX288jYaeSTPblk7T5QFr+EFv/
         4B8b3JMIj4JDfR5bKfyV8aSsBmfizoybnMLyK6hBiIhKGhvxZ/5VCZJOJcgYopFZV3Qs
         swqoAc84c4aBFo4GsHTkKSags7TvcgHYy4C38=
In-Reply-To: <t2p186ebf761004211127k7512fb29r5b4873627925fece@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Narendra Choyal <narendrachoyal@gmail.com>
Cc: John Engelke <john.engelke@gmail.com>, netfilter@vger.kernel.org

On 21 April 2010 19:27, Narendra Choyal <narendrachoyal@gmail.com> wrote:

> NOTE :
> -i also not work when we have two virtual IPs like eth0 and eth0:1 .
> In this case first rule will be applied whatever the interface is
> written i.e eth0 or eth0:1 .

Might be totally off base but have vague memories that the virtual
interface can't be filtered using -i / -o.

I've got a fairly complex rule setup using both in and out filters
using wildcards such that alot of rules are of the following kind
(these are for example only, exact port numbers and match criteria
vary)

-A INPUT -i eth+ -p udp -j ACCEPT
-A OUTPUT ! -o sl+ -p tcp -j DROP  (We don't want tcp traffic going
over very low bandwidth slip links!)
-A OUTPUT -o eth+ -p icmp -j ACCEPT
-A OUTPUT -o sl+ -p icmp <<hash limit match>> -j ACCEPT

Not encountered a problem where the io interface flag isn't working as
expected, but with the exception of one or two rules all the rules
using io flags are using wildcard matches.


-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.pbase.com/arimus - My online photogallery
http://www.topcashback.co.uk/ref/rhorton
