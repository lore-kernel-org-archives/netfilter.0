From: "Andrea Ranieri" <andreran@uno.it>
Subject: Re: DNAT routing problem
Date: Mon, 12 May 2008 18:40:43 +0200
Message-ID: <3598a5460805120940q37cd71aap60fb36d66e8f6dbe@mail.gmail.com>
References: <3598a5460805081117i7f519321y9ad85f084ba0f484@mail.gmail.com>
	 <3598a5460805090348w526f46c9v3f1fd0f0874c84db@mail.gmail.com>
	 <3598a5460805090630m2676a18dp9f25e7ca9efb9ca9@mail.gmail.com>
	 <3598a5460805090934g343f73e9q8fa2a8c0aa536df@mail.gmail.com>
	 <alpine.LNX.1.10.0805101053300.19952@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
        bh=enEFamZOY3GHRT1YRqEESeOkqqcnvZnQLv/M+5N8T40=;
        b=xZPijtIqZKv/1JFaYyhuks7Vb+ZgPizZ2IRreOz3V97nJ3cWAEmgoGybDEPi96+feg3m1qE8n9VUCZ66UiRyTE9zZH403SSic97dYv708cEuajzgiIIdlhMgfidaKkxcSvJX++m3nKZ88L0l388OMXe+VqxbI03DlJl+hLAZ+a0=
In-Reply-To: <alpine.LNX.1.10.0805101053300.19952@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Sat, May 10, 2008 at 10:56 AM, Jan Engelhardt <jengelh@medozas.de> wrote:

>  On a global scale you can set
>  /proc/sys/net/netfilter/nf_conntrack_generic_timeout .
>  There has been a module (or a group of them) called TIMEOUT or
>  actually CONNTRACK by Phil Oester and Pablo Neira Ayuso with which
>  you can set the ct timeout per connection. That's one way.
>  Another is to use the RAWNAT target.
>  But tc is an obscure thing.

Again, thanks for the suggestion. Setting
"nf_conntrack_generic_timeout" seems to work fine.
For what concerns RAW table and NOTRACK target, i think that their
main purpose is to completely skip CONNTRACK and NAT hooks, so no luck
with them.
For the sake of completeness, in newer kernels (2.6.23+ I think), a
brand new stateless NAT has been added. The config option is
NET_ACT_NAT, and it can be configured via "ip route add nat". However
I think it's pointless to play with it now. Netfilter's NAT +
nf_conntrack_generic_timeout are doing a good job.

Cheers
Andrea
