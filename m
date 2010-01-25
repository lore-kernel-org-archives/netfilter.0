From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Re: Can iptables control what internal LAN clients can configure the 
	Firewall over UPnP?
Date: Mon, 25 Jan 2010 09:55:53 +0000
Message-ID: <ac5c74141001250155x194a1766ybbf218589ee83fd1@mail.gmail.com>
References: <ac5c74141001250118w153c23f6n3ff8bcdb18d16a77@mail.gmail.com>
	 <56378e321001250123h311223e4o7d53f3e48cfc6f78@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=huuoZ85jGgIgtLcRG+3j1H9SfKjX+cFNWb7mk//xJ9M=;
        b=lId9hleH76SgioM5K5XAnsvW2F0DrRFzY2WcqF/YtaWsW05ynFjiIwTfp+75Enlr18
         XyCRWNFHmJ/AteVZYtCz4IlqzcOWB/28x0h6aEFFPd+0Ge4qJTRfaDR3foVRgDafsekZ
         eb7ecVhvR5rPW5Cpc3T+bivuqnZEYLC3iuQUQ=
In-Reply-To: <56378e321001250123h311223e4o7d53f3e48cfc6f78@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Horton <arimus.uk@googlemail.com>
Cc: netfilter@vger.kernel.org

Thanks once again Richard.

Fantastic!

Extending my original question a little further:

Given that iptables doesn't filter client-2-client on the same LAN is
there another way around it? Perhaps ebtables?

[note: in terms of the home broadband boxes which are multi-purpose
firewall-router-switch, it is possible to filter
wifiClient-2lanPortClient as they appear on separate interfaces. Or
that is my limited understanding)

I guess if I take the ebtables idea, then the firewall becomes a
bridge and only filters layer 2, thereby rendering the normal things
i'd like to do with iptables ineffective.

Perhaps, I've misinterpreted this. Maybe the firewall can run in both
modes ebtables and iptables.  I'll need to read some more into this
area.

The reason I ask is, imagine a scenario where, clienthacker gains
access to the LAN via cracking the WiFi. It would be nice to be able
to silo clienthacker from the trusted clients by iptables rules. That
way, clienthacker cannot directly attack the trusted clients. And also
it cannot subvert the firewall configuration via UPnP, as you've
pointed out that iptables can prevent this as with trusted LAN
clients.

The idea would be that trusted clients A,B and C could communicate
with each other but clienthacker could not communicate with them. This
leaves clienthacker only access to the outside world, which in turn
can be controlled as it must pass through the firewall ;-)

Thanks again for the responses and for bearing with my ignorance on
this subject.


On Mon, Jan 25, 2010 at 9:23 AM, Richard Horton
<arimus.uk@googlemail.com> wrote:
> 2010/1/25 paddy joesoap <paddyjoesoap@gmail.com>:
>> Dear Experts,
>>
>> Is it possible to control what LAN clients can administer the firewall by UPnP.
>
> Yes, just add the appropriate rule into the input chain (the traffic
> target is the firewall itself...)
>
>
> --
> Richard Horton
> Users are like a virus: Each causing a thousand tiny crises until the
> host finally dies.
> http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
> http://www.pbase.com/arimus - My online photogallery
>
