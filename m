From: Michael Robinson <mike@robinsonhome.org>
Subject: Re: Removing VLAN tag from outgoing broadcasts
Date: Wed, 19 Oct 2011 10:46:08 -0400
Message-ID: <CA+JOZmOsUvB_Ly-1SScvDMecrOy7Dka3G+6fzaqyCOYzCfJAgg@mail.gmail.com>
References: <CA+JOZmMvZQ2eSPh=V+QeX9APg3qXsTmnzOrne5CbyT3dr1Xo5A@mail.gmail.com>
	<4E9ECEB4.9020402@freemail.hu>
	<CA+JOZmOF5ydmaAYSBcuU7ZQ8ZijCEV6bSL8uvaJFbmn9DP3=tA@mail.gmail.com>
	<4E9EDB76.6080006@freemail.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=XljzYAe9CX2ZwX9JEBQY0+amRbaXLxQC+yj11sjLDaw=;
        b=I/MkPhbekswghQJuukBOt25ncVSx01tAk4KW+iJg/iD9pxRnR+CiYogGihp2tjs2m/
         TV7t9h577mwPO08ftsT+89WfCjn0oaHlnz8l7pM/rWr7e6Fcal/MM2nBanpEpsIWPuMl
         Oi5RoubPFgHo8mLmsJlUjwKaMAXQd312S1X7M=
In-Reply-To: <4E9EDB76.6080006@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?ISO-8859-1?B?R+FzcOFyIExham9z?= <swifty@freemail.hu>
Cc: netfilter@vger.kernel.org

> I think I was not clear enough... :D
>
> So, if you send out the packets without any VLAN tags then they will not be
> seen on your tagged VLANs...
>
> Imagine the whole VLAN thing as the following:
> - You can slice up your real LAN to smaller VLANs.. :D
> - You can connect to these networks with only ONE cable... (From the
> switch's pov: this is a port.)
> - On the port there may be many tagged VLANs...
> - And there may be AN untagged VLAN... (Forget about "General ports" !!!)
> - If the port is "Access port" then it can only send/receive to one untagged
> VLAN (The tagging is managed internally by the switch.)
> - If the port is "Trunk port" then you can do the tagging magic... One
> untagged and many tagged VLANs on this port...
>
> So far this is what you have...
> Now if you want to remove the tags then let the switch do the job for you...
> (AFAIK the switch will remove/insert the specific VLAN id of the packets if
> the port is an Access port...)
>
> I would do this:
> port 1 (you) : Trunk port, VLAN 1 untagged, VLAN 2049 tagged, VLAN 2050
> tagged
> port 2 (network 2049) : Access port, VLAN 2049 untagged
> port 3 (network 2050) : Access port, VLAN 2050 untagged
>
>
> Maybe you can find more info in the 4th message in this topic:
> http://homecommunity.cisco.com/t5/Switches/access-general-or-trunk-Tagged-or-not-Getting-desperate/td-p/161352
>
> Swifty

Thanks for your patience.  I should provide more information.  My
current setup works as you describe.  eth2 is behaving as a trunk with
the two tagged VLANs and one native (untagged) VLAN.  I can connect to
a managed switch and separate the various VLAN traffic, including the
native "untagged" VLAN.  All is well there.

Now I need to connect eth2 directly to a (non-standard) device (don't
ask :) that will take care of the broadcasts, but they must be
untagged.  So I was hoping to create a rule that would essentially
direct the outgoing VLAN-tagged broadcasts to the native VLAN
(untagged).

Thanks,
-Mike
