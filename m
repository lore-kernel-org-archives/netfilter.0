From: "Andrea Ranieri" <andreran@uno.it>
Subject: Re: DNAT routing problem
Date: Fri, 9 May 2008 18:34:55 +0200
Message-ID: <3598a5460805090934g343f73e9q8fa2a8c0aa536df@mail.gmail.com>
References: <3598a5460805081117i7f519321y9ad85f084ba0f484@mail.gmail.com>
	 <3598a5460805090348w526f46c9v3f1fd0f0874c84db@mail.gmail.com>
	 <3598a5460805090630m2676a18dp9f25e7ca9efb9ca9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
        bh=RF5lFulJztawpE9yUMB/66cK3ULoP0lY+tpCDz0vZ/w=;
        b=wnKRS9PonQOIg8nnVo2cxXuYpIyqxKs+w8qYndVaEjKOWX4UXyr2WWtYxSEPKkJbm6qXV0whInWSzv6QjR9eAKYHZd3giCaZezBG0i3lTjOduSpZxJQD2dQ4PdkusIEAL/Z56M3XxsMFiV9fJzXy78ZrtDK7z4t4UmeFcuzbgFA=
In-Reply-To: <3598a5460805090630m2676a18dp9f25e7ca9efb9ca9@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 5/9/08, Grant Taylor wrote:

> This really makes me believe that you are dealing with what connection
> tracking thinks is an on going existing established flow / connection.
> Remember that the NAT table only sees the first packet of a connection.
>  So if you are altering your NAT table after a connection is
> established it will name make any difference to the existing connection.
>  This is further exemplified by you testing .3-.5 and seeing them start
> to change and then continue doing what they were when you flush your NAT
> table.  I think you will find that if you stop your connections, wait a
> few minutes, and then start them back up they will behave as expected.

Yes, that sounds as a good explanation of this phenomenon.
However this behavior is not what I want/expect from netfilter. I'm
looking for a simple, straight-forward, connectionless 1to1 IP NAT.
And, of course, i'm looking for something that can be enabled/disabled
without waiting minutes!

Ok then, if that's the normal behavior of netfilter's NAT module, I'll
have to find an alternative solution.

Thank you very much for your help.
Andrea
