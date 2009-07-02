From: Terry Burton <tez@terryburton.co.uk>
Subject: Re: Disabling conntrack on an interface
Date: Thu, 2 Jul 2009 18:16:32 +0100
Message-ID: <2d1f9a6b0907021016o2e140229if282620513d09be6@mail.gmail.com>
References: <2d1f9a6b0907020810x49f483a9j855d373b776571c6@mail.gmail.com>
	 <1246548394.17132.19.camel@enterprise.ims-firmen.de>
	 <2d1f9a6b0907020906g207b273fr125cc75d022db638@mail.gmail.com>
	 <1246554288.17132.38.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=B25AOh7DQnO/tHg01/+GJx+ihy/qxUafagFXb6nDpuo=;
        b=Kpd+gWHHOOQCm0Hm398au5Q2EkYgId463D++ORKYLUtL5Jg4dCaXalrJUOW3TL1Kpl
         IW4Vh94++tI8xUTqlPDS+CP6IwDp8QVOUml/FJSkCan1gjb/QYjmNnPCd58AkcLoVeL4
         WS5cvoCSqjSk17RJ9anN7qvUFsRrJzKDRn5pM=
In-Reply-To: <1246554288.17132.38.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

On Thu, Jul 2, 2009 at 6:04 PM, Thomas Jacob<jacob@internet24.de> wrote=
:
> On Thu, 2009-07-02 at 17:06 +0100, Terry Burton wrote:
>> Thanks, but my issue isn't with firewalling, rather that I'd like th=
is
>> traffic to avoid the conntrack table altogether to avoid system load=
=2E
>
> Still it's a way to disable conntracking for just one interface, righ=
t?
>
> The raw table is evaluated before the connection tracking code. In fa=
ct
> being able to do stuff before the connection tracking code is called
> is the raison d'=EAtre of the raw tables.

My bad - I hadn't taken the time to understand your reply an didn't
appreciate the relationship between connection tracking and the raw
table.

>> As soon as I bind the (unaddressed) interface into the bridge the
>> packets are conntracked.
>
> Oh yes, sorry, I didn't read you email correctly, you are bridging
> packets thru your box so the conntrack code gets to see them. Don't
> know if the above will still work under these circumstances, just
> try it out.

It works great when you use the bridge interface name:

iptables -t raw -A PREROUTING -i breth1 -j NOTRACK

Thank you very much for the rapid help!


All the best,

Terry
