From: Balazs Scheidler <bazsi77@gmail.com>
Subject: Re: Fwd: Issue migrating "iptables -m socket --transparent" into
 nftables
Date: Tue, 25 Aug 2020 11:45:30 +0200
Message-ID: <20200825094530.GA23673@bzorp>
References: <CAKcfE+ZhO2O6nanU=ABJB8ptpB8VvjCK1wmzQ8TMFx+U-0_8nw@mail.gmail.com>
 <20200821152333.GA22135@salvia>
 <1667802.tW6joTg63a@deimos>
 <13661805.z8pgfqvs6W@deimos>
 <CAKcfE+ZHch0LH79Mi2NMM9z4UaoORb09oPur8xrPaK-7F3SRpg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0Vr3YJJfwcXJcoRrea8XTnT1NTrc447rUcfQ8lzjqcg=;
        b=rOQJ5JnAubq+SfUOKvX+j8/kHjXgQVCanwQXDFKdM5LnDCCLvbFDwapAqi7nkz+P+S
         i4UKuZBxTg9PNjPEK4AnCJiST/FVdOmiFzISwApnEENvSDvuxHmEmPETkssQEurMgPh/
         5hRiwlAbZWSGdgyFv10puigdzeFoNyqa3IonZ7PYCeCpBZcjWgK2Kdn9HrIfN9+KY1qp
         q90fh80ElEZrt68ff2B7FjHDhCLSDxQ/pighbzVc67PfMLXj44tfhNOG8tnjA7fQ9t2y
         2tU36u6EYKmmtoedDIgAChXXY8L9nhvpvj4oYA08Zn4sTBmZ5EbjoRrIljDLPjiuRjRf
         adcw==
Content-Disposition: inline
In-Reply-To: <CAKcfE+ZHch0LH79Mi2NMM9z4UaoORb09oPur8xrPaK-7F3SRpg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nirgal =?iso-8859-1?Q?Vourg=E8re?= <contact_vgernf@nirgal.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

On Sat, Aug 22, 2020 at 08:45:22AM +0200, Balazs Scheidler wrote:
> hmm.. judging the code alone, I can't see the difference between xt_socket
> and nft_socket, they are checking the same things for ipv6.
> 
> I am not sure when sk->sk_v6_rcv_saddr is properly set, if that's non-zero
> we would yield "socket wildcard 0" and cause a match.
> 
> I can see that __inet6_bind() sets this properly, so as long as haproxy
> binds it to port 80/443 we should be fine.
> 
> I still cannot get what you mean under "But ipv6 outbound connections still
> are grabbed by the socket rather than be routed to the wan and
> masqueraded." exactly.
> 
> 1) haproxy binds to [::0]:80 and I assume it does that to receive external
> traffic. Do you use tproxy rules to redirect traffic here?
> 2) then haproxy would establish a connection from [clientip]:randomport ->
> internal server:80. The return traffic should be matched by "socket
> transparent 1 socket wildcard 0" and redirected as such.
> 
> So which of the two connections above is what you mean?

The question still stands, which of the two connection is getting the wrong
treatment?

@Pablo: do you want me to test/push the kernel piece to netfilter-devel?
Also, I have a usability question in the email I sent there.

Hopefully, by now I can send email to vger :)

Cheers,
-- 
Bazsi
