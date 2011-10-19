From: Michael Robinson <mike@robinsonhome.org>
Subject: Re: Removing VLAN tag from outgoing broadcasts
Date: Wed, 19 Oct 2011 09:29:11 -0400
Message-ID: <CA+JOZmOF5ydmaAYSBcuU7ZQ8ZijCEV6bSL8uvaJFbmn9DP3=tA@mail.gmail.com>
References: <CA+JOZmMvZQ2eSPh=V+QeX9APg3qXsTmnzOrne5CbyT3dr1Xo5A@mail.gmail.com>
	<4E9ECEB4.9020402@freemail.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=QA5qbnNmoq/mbdinOcIzSxR57ssdRU8S6XJCDSTVBMU=;
        b=rfpMpSTHIRBJV7uzFaPKiLi9Dv1XjfGCGc69Iy1SwPBNvEfuCGBdH1TUqecZEFWwkX
         ua6ApUBJ3/wyD+xjNdGtk6DGKcbn6QXvEv9a3oXFyF2YuQHZQ8mHq/P6qVLIGydauc5v
         DI4VC1uHtWvzpvtCG/LhO4gEiSpVCXu/K9pF8=
In-Reply-To: <4E9ECEB4.9020402@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?ISO-8859-1?B?R+FzcOFyIExham9z?= <swifty@freemail.hu>
Cc: netfilter@vger.kernel.org

(forgot to "reply all")

> I do not understand you...
>
> If you remove the VLAN tags then how would your switch (or any other network
> device) know where/whom the packets belonging to?!?
> There "must" be an untagged VLAN in your network... So every untagged packet
> will go that way... Every tagged packet will go to its own network...
>
> You signal with the VLAN tag that you want to sent a packet to a network...
>
> But maybe I am wrong... :D
>
> Swifty

> I do not understand you...
>
> If you remove the VLAN tags then how would your switch (or any other network
> device) know where/whom the packets belonging to?!?
> There "must" be an untagged VLAN in your network... So every untagged packet
> will go that way... Every tagged packet will go to its own network...
>
> You signal with the VLAN tag that you want to sent a packet to a network...
>
> But maybe I am wrong... :D
>
> Swifty

Thanks for the reply.  There is a native (untagged) VLAN on the trunk.
 It's the eth2 interface.  So if I understand you correctly, I need to
redirect the classified packets to the eth2 interface...is that
correct?  How is that specified in a rule?  Note, that I'm just
getting familiar with ebtables/iptables.

Thanks,
-Mike
