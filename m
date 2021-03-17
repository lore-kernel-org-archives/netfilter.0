From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: How to troubleshoot (suspected) flowtable lockups/packet drops?
Date: Wed, 17 Mar 2021 18:01:43 -0400
Message-ID: <CANf9dFOHgb+QNqVkWVsnP6ALSQxbPzyv8xA0LXyck39w3bUjwg@mail.gmail.com>
References: <CANf9dFO+CAuiugQjwKDZ+tOVYuB+HMKeJzDVqekY=vVFE-rxFw@mail.gmail.com>
 <20210316230521.GB981@salvia> <CANf9dFMxabVweO2ipnPL8Ncemc9wQaxeJQs0dazrgf=VeXVjbA@mail.gmail.com>
 <20210317103443.GA18462@salvia> <CANf9dFPDyAU-WKD5SSBv2M+PUoUmT5jQAjLcD1jcwEYzWKPqXQ@mail.gmail.com>
 <20210317204220.GA13211@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lJY2eYIepdGQcHB7u5jRegCq0hUTFQhVB6/2Bhvs9fU=;
        b=tVl73EBWY7eMDjALhjHsdrM9DUMD/+oKAzWINscKEptXKCMNAckC6/52O7YEb1L1xn
         ApT1ltOjO69ymMzwfD1N6YoFV8WARUMIS2ibM5ilFRwYCPb3Efd5uwK4rjsStyOs22Ob
         zjbfe8pTwcg+yoKe2mcQUgpV5N226kZLRUJWN76uAeYQ6yc9Z3X8Jk+BLsBYceE3ouzu
         o3/ldem5RwfYOATKRVXit3KNXvcRV1hZzItYySt1ARrQLQmDHAB/OLros70UuV0X4Ag3
         Pz7ZDT9KB0C4L2+04C2ViYod1WUuIMISeUwCEa/OfN/zDPQ/lulRVVR9wrkI/LqMzB03
         SIXA==
In-Reply-To: <20210317204220.GA13211@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

If I just run:

    nft list ruleset > rules.txt

add:

    flush ruleset

to the top of the file, add the:

    counter

statement to the flowtable section, and then:

    nft -f rules.txt

This should atomically add the "counter", but not impact traffic in
any way, shape or form, correct?

-Martin
