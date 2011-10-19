From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Removing VLAN tag from outgoing broadcasts
Date: Wed, 19 Oct 2011 16:15:18 +0200
Message-ID: <4E9EDB76.6080006@freemail.hu>
References: <CA+JOZmMvZQ2eSPh=V+QeX9APg3qXsTmnzOrne5CbyT3dr1Xo5A@mail.gmail.com>	<4E9ECEB4.9020402@freemail.hu> <CA+JOZmOF5ydmaAYSBcuU7ZQ8ZijCEV6bSL8uvaJFbmn9DP3=tA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+JOZmOF5ydmaAYSBcuU7ZQ8ZijCEV6bSL8uvaJFbmn9DP3=tA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Robinson <mike@robinsonhome.org>
Cc: netfilter@vger.kernel.org

Hi Mike,

> Thanks for the reply.  There is a native (untagged) VLAN on the trunk.
>   It's the eth2 interface.  So if I understand you correctly, I need to
> redirect the classified packets to the eth2 interface...is that
> correct?  How is that specified in a rule?  Note, that I'm just
> getting familiar with ebtables/iptables.
>

I think I was not clear enough... :D

So, if you send out the packets without any VLAN tags then they will not 
be seen on your tagged VLANs...

Imagine the whole VLAN thing as the following:
- You can slice up your real LAN to smaller VLANs.. :D
- You can connect to these networks with only ONE cable... (From the 
switch's pov: this is a port.)
- On the port there may be many tagged VLANs...
- And there may be AN untagged VLAN... (Forget about "General ports" !!!)
- If the port is "Access port" then it can only send/receive to one 
untagged VLAN (The tagging is managed internally by the switch.)
- If the port is "Trunk port" then you can do the tagging magic... One 
untagged and many tagged VLANs on this port...

So far this is what you have...
Now if you want to remove the tags then let the switch do the job for you...
(AFAIK the switch will remove/insert the specific VLAN id of the packets 
if the port is an Access port...)

I would do this:
port 1 (you) : Trunk port, VLAN 1 untagged, VLAN 2049 tagged, VLAN 2050 
tagged
port 2 (network 2049) : Access port, VLAN 2049 untagged
port 3 (network 2050) : Access port, VLAN 2050 untagged


Maybe you can find more info in the 4th message in this topic:
http://homecommunity.cisco.com/t5/Switches/access-general-or-trunk-Tagged-or-not-Getting-desperate/td-p/161352

Swifty
