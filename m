From: Kim Emax <kimemax@gmail.com>
Subject: Re: 2 nics and traffic delayed/lost on LAN
Date: Tue, 30 Oct 2012 22:19:34 +0100
Message-ID: <CAG5MBdXqZ9=8HFP3itm0SyTzdpeYSbFm3THAbLx8uaVPHyMPWQ@mail.gmail.com>
References: <CAG5MBdXsm-bD2diJKif3mF3p=h6YCfbV__SY55gjtas81ForqA@mail.gmail.com>
	<508D4FED.4040105@ngtech.co.il>
	<CAG5MBdUoGwooO7VHy6ae+KyeRcypo2p9A2zxP+egLjkE_6H-KA@mail.gmail.com>
	<508DC35D.1020303@ngtech.co.il>
	<CAG5MBdXd0Jn8bPrkVrWJ_7yDU6qop3E3xJErcgEJ7p6=n=ewYg@mail.gmail.com>
	<509035B7.8050205@ngtech.co.il>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=L6LlVV4e/sSK4IUHc9upRugj0d40xHb6HJAbb7lPjSA=;
        b=tQz5/seQUYDvODAXqD5ZFG354CplzBkUlEy8sY9/VXfcxq+Y1YxVB/d5wUK9k5si1+
         AgamHeqmu/Zcxli5vcPe3s/ntGb/1jgL7Lhkkuz5aY5LoHIdE0TrwygR0cKbNiWJGy/O
         6SPvylo9FsaHLy7gl4VpGuY+oclXr00zMI73Jw92CGtVShsvrl+mUS5zlWrHUdUlm6R/
         n30HHPEPAodHhC6GAKL5vmPyyC0u2VOzlw4jciMtZPbTHXpzZiPH2IFq6xjmgekMILeR
         jJKzJhj2Gp6vV7O35hdPUoYVfblesSJAtS5v/HwnfJCwGmDKslZTVOUueY9V/G3ueo/u
         qXrg==
In-Reply-To: <509035B7.8050205@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: netfilter <netfilter@vger.kernel.org>

On Tue, Oct 30, 2012 at 9:16 PM, Eliezer Croitoru <eliezer@ngtech.co.il> wrote:

> seems like you are hosting:
> samba
> db
> ssh
> ftp
> ssl
> and other stuff.

True.

> the first thing I would suggest you is to help yourself understand your
> topology.
> ip addresses, hardware, packets flow.
> until you will not clarify these things you are expected to fail debugging
> the problem.
> as I mentioned before try Ubuntu servers forums as a starter since there are
> many nice people there that will try to give you lots of directions.

Ok, i'll find that. And will Cc you there. I'm replying here, cause i
forgot to mention where the ping went.

> you can try to change your iptables to a more simple approach one like
> "allow all" as a starter and later add rule by rule until you will find a
> specific culprit.
> also try to close and service that is running on this machine and one by one
> start them.

I thought of that approach the last few days. Or maybe fire up the old
server to rule out a HW issue.


>> 10 pings gave 10, 30 and 40% packetloss.
>>
> ping to where?
> try pinging the "firewall" and to other places by the topology.
> lan to lan
> lan to firewall
> lan to other throw firewall

Sorry, i pinged the companys VPN address.

> tcpdump is a really good start to see if the packets are identified by the
> kernel\interface\driver etc.
> if you have another PC you can try to dump the packets into PCAP file and
> later review the packets in wireshark which is more friendly for the eye.
> also there are many things you can see by just looking at the packet flow in
> wireshark.

okay, got some stuff to work on now. Thanks.

--
Take care
Kim Emax
http://emax.dk
