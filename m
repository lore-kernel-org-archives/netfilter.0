From: "Ashok Rao" <greatarbor@gmail.com>
Subject: Re: [NFQUEUE] Help with program that changes DHCP payload
Date: Wed, 30 Jan 2008 08:28:16 -0500
Message-ID: <68252ab80801300528s538d3f19mc3ef74e379d700e4@mail.gmail.com>
References: <763049.9097.qm@web58311.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=hzq+8jgPFIFix2NT+avaTvvpZ+517uRZ2Qs5fO0WkOg=;
        b=sG/sJscQjjt2zRYxNyoUZpZV8xGOjUfjdfBYRKHiQV0IIiVe9wx99aQi0Tq0SFKPRMolSmXC03XFjVumCLQJjsr9fCXzXTGexhomhtjPeudP/T5haZUYgajEjRH1LWyLjBcY+jp5TADbB5fmEpvE870pk+nw8GHoFn+HMUGdZC8=
In-Reply-To: <763049.9097.qm@web58311.mail.re3.yahoo.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vincent Arniego <vincent_arniego@yahoo.com>, netfilter@vger.kernel.org

Have you looked at the Figures in Oskar Andersson's tutorial on
iptables (available through a link on www.netfilter.org)  - they show
the sequence of tables and chains which are encountered by a packet on
it's way in, out, or when forwarded. IMHO that tutorial is mandatory
reading for anyone trying to work seriously with iptables.

From your email below, I couldn't make out if your program was
accepting packets or sending out packets  - if indeed you are
capturing incoming packets - modifying them and them sending it to the
DHCP process on the same machine - ethereal will never see the
modified packets - unless you are sending them back on the wire again.

Ashok

On Jan 29, 2008 10:58 PM, Vincent Arniego <vincent_arniego@yahoo.com> wrote:
>
>
>
> Hi Everyone,
>
> I'm kinda new here and I would like some help regarding
>  netfilter_queue. If this is asked already, forgive me I didn't see it in the archives.
>
> I'm making a program that changes the value of an attribute in the DHCP
>  payload.
> I'm using nfqueue to intercept the packet, change the content of the
>  payload and resend it again to DHCP
> which resides in the same server as the firewall. Why am I doing this?
>  I'm making a pseudo option 82 using a translated bridge (which the mac
>  is unchangeable) but I'm using the hostname attribute instead.
>
> So far, I was able to change the content of the hostname attribute of
>  the payload, and I checked the packet again
> just to be sure its sending the correct content. I use nfq_set_verdict
>  to resend the packet with the modified payload.
>
> But it didn't work.
>
> The next thing is did *just to be sure is just changing the TTL value
>  of the IP header, then resending again, but it seems its not working. I
>  used ethereal to capture the packets that are coming in after
>  modification. And yes I checksummed it.
>
> These are my questions:
>
> 1. My firewall rule to intercept the packets is in the PREROUTING
>  chain, mangle table.Is this the correct way?
> 2. The packets that are captured by ethereal, are these the packets
>  before modification or after? (just to be sure I'm looking it the right
>  way)
> 3. What can I do to verify if the packets are indeed modified?
>
> If anyone need a snippet of the code, for everyone, I'll just send it
>  in a reply email.
>
> Thanks in advanced guys.
>
>
>
>
>      ____________________________________________________________________________________
> Looking for last minute shopping deals?
> Find them fast with Yahoo! Search.  http://tools.search.yahoo.com/newsearch/category.php?category=shopping
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
Ashok Rao

Great Arbor Communications
8818 Tallyho Trail
Potomac, MD
Tel: 301-547-3483
Cell: 703-989-6494
email: greatarbor@gmail.com
www.greatarbor.com
