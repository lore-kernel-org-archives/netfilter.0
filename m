From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: traffic shaping documentation
Date: Tue, 21 Apr 2009 13:29:38 +0200
Message-ID: <49EDAE22.5030701@unipex.it>
References: <49ED88BD.4070406@lab.vectoris.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49ED88BD.4070406@lab.vectoris.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Mihamina Rakotomandimby (R12y)" <mihamina@lab.vectoris.fr>
Cc: netfilter@vger.kernel.org

Mihamina Rakotomandimby (R12y) wrote:
> Hi all,

Hi !

> I have a gateway on which I would like to implement traffic shapping 
> based only on ports.

> The problem is HTTP traffic is so much that SSH connection to the 
> remote servers I manage are slow.
> 
> Therefore, I would like to give: - highest priority to SSH 
> (INPUT/OUTPUT/FORWARD dport 22) - normal priority to others 
> (INPUT/OUTPUT/FORWARD dport:FTP, SVN,...) - lowest priority to HTTP 
> (dport 80 REDIRECTed INPUT on squid's 3128, OUTPUT dport 80)
> 

Until here no problem.

> The perfect would be to shape it on the OUTPUT chain, because I would
>  like also the shape affects my (Gateway) behaviour.
> 

That is the normal behavior and the right place where do the
classification. There are also an implementation that works for incoming
and it's called imq, but I never use it.

> I am not asking for the direct solution, I am first asking if what I 
> want: - is a good idea

Why not?

> - implementable

Yes, of course.

> - is documented in another place than lartc.org (which is good but 
> too much big for my simple needs)
> 

Yes. There is a lot of documentation and not a single place for "a copy
and paste for start to play"

For make your setup, I give you some tips for start to work:
for make the classification, you can use:
- iptables by port (simplest)
- iptables by l7 (l7-filter.sf.net)
after match the packets, use the CLASSIFY target (simplest from my point
of view), or the MARK one

OR

- tc filter for the same (classify by port/ip)

Now that you have look at the classification, it's time to prioritize,
so tc it's your friend.
A lot of shape queues can help you and, by me, htb it's one of the more
understandable that exists (http://luxik.cdi.cz/~devik/qos/htb/)

For a simple "copy and work" example with iptables, classify and tc I
post a message on the samba ml where I show I do to it, so take a look
here: http://tinyurl.com/dmdtuz

For all the other, I'm sorry, but lartc howto it's the unique source!

Michele
