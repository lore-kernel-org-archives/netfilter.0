From: Siebzehn <siebzehntausend@gmail.com>
Subject: Re: No interval possible on Concatenation-Sets
Date: Wed, 16 Sep 2020 15:51:58 +0200
Message-ID: <CAFJ60arunrCuV4q1TQt2kBGd_FBz2KCfXkuAbh79pUcunjurKw@mail.gmail.com>
References: <CAFJ60arM0h53jtvAb6FgzXYeySZ5L7X-_ApU9JbCMRBGi98soA@mail.gmail.com>
 <f293db98-c46e-f7f0-101f-e83992d545c8@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=osKRMorrF5/JLYgcWpDaY9vB8nzk6VKVuc2w6CRv244=;
        b=eXBWZn9IBjt5nIjzFgbUjxQGETf4GKoK424+sxJD6Myc/mBKa5Gv+ONG4Rv8mY2b21
         fhEDQoPGMx40a7Ng2ZyFmXT1J5enG+bKqKchVt6MKunb7MxACLd9Bis0n50XCCcOU8n8
         2waih2ifoN9gCwQ6OSm+B8J+CMTqrpS3oxhcp+lRQg0i7G/OiA5WcMITfTPaePp5A9ov
         b+3zeEjF0qlIyOTqPOKBOkg9wJ1EII4JdmapN/UjVUn6uVWKHvHKzUTh4fXIVlIA9bjq
         HNgFL5Rr+UMbhugjOfTBje9s5FYZhaQQbbwKEozEZN2HTsiRS28mLeXN1Bn+9uJelb5U
         QGMA==
In-Reply-To: <f293db98-c46e-f7f0-101f-e83992d545c8@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero Gonzalez <arturo@netfilter.org>
Cc: netfilter@vger.kernel.org

Am Mi., 16. Sept. 2020 um 15:05 Uhr schrieb Arturo Borrero Gonzalez
<arturo@netfilter.org>:
>
> On 2020-09-16 11:05, Siebzehn wrote:
> > Hello,
> >
> > I'm filtering Address-Ranges and Ports to let them though. However it
> > doesn't seem to accept "flags intervals".
> > Even the Example on the wiki isn't getting accepted!
> >
> > Example from
> > https://wiki.nftables.org/wiki-nftables/index.php/Concatenations#Network_addresses
> > flush ruleset
> > table inet mytable {
> >     set myset {
> >         type ipv4_addr . ipv4_addr
> >         flags interval
> >         elements = { 192.168.0.0/16 . 172.16.0.0/25,
> >                      10.0.0.0/30 . 192.168.1.0/24,
> >         }
> >     }
> >
> >     chain mychain {
> >         ip saddr . ip daddr @myset counter accept
> >     }
> > }
> >
>
> Make sure you are using:
>
> * nftables >= 0.9.4
> * kinux kernel >= 5.6
>
> regards.

Thanks it worked!

I saw the note but wasn't sure what it meant...
"NOTE: before kinux kernel 5.6 and nftables 0.9.4 the CIDR notation
wasn't available, ...:"
