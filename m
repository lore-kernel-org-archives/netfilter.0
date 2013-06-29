From: Nick Khamis <symack@gmail.com>
Subject: Re: Dabase BAcked IPTables
Date: Sat, 29 Jun 2013 19:12:25 -0400
Message-ID: <CAGWRaZaWGwQ1KcdXXLN-fVCOVJzMa83s7_1h9eBcBnzQZK1bcQ@mail.gmail.com>
References: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com>
	<1372536635.3924.89.camel@andrew-desktop>
	<CAGWRaZbQXv=J8YfofS4HEUYovcLTdoW5yvLpKdfP83rOkyRyng@mail.gmail.com>
	<201306291700.53177.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=FL5MKZ/R1tenKD2flbSSvYekW0Qd7tb4Z1/JySe7XZk=;
        b=ec8CStOfZUDQmp5I/n1F45QzjCT9ZjpoqzbDq/ReavC3RnNoSqw5YM3gyYKMkn8iZL
         RXfyVJs+o5kKviIdqdvebX6wXrxPRCjiIr5UkHLiaY48PeLack2F5vRpSF5bnEnOPbQe
         IXyYylIVULSdtGRcJH5aJZylEHIwehu89liejvmCOg+cjYhorKwqyQUpCeCTlLrAGL2M
         z57EuMFW8pQOF+Lco3CSm7F02vtduB7as4/qAb6ee+F5p5F7RwyiOt9Nk8LdyBtOCLFr
         9yZHLRqvQMXU+gPEn4MNbUwIheZVVKO9MLjWJRJN7RjxDIJWkjg/JQ2SqEdSm3NOVPbb
         b14w==
In-Reply-To: <201306291700.53177.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: neal.p.murphy@alum.wpi.edu
Cc: netfilter@vger.kernel.org

>> The MAC address is only used on local links. The MAC address of a packet
>> arriving at your firewall or perimeter router is that of the router at the
>> other (ISP) end of your link.

Our client application adds a P-Assertion to the SIP message
indicating the mac of
the requesting client. Now, I am not sure how we can tie that into
"--src" of IPTables.
As you rightfully pointed out, the source of the arriving packet will
be irrelevant.
Thanks for pointing that out.

We can always manage this on our SIP servers, maybe that's the better
place for it?
If possible it would be nice to keep firewalling to IPTables...

>> Does SIP handle roaming? If so, you'd almost need a SIP helper to track and
>> update the client's IP.

We handle roaming logic using our proxies.

Kind Regards,

N.
