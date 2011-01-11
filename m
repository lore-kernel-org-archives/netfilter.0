From: John Haxby <john.haxby@oracle.com>
Subject: Re: VLANs
Date: Tue, 11 Jan 2011 10:42:46 +0000
Message-ID: <4D2C3426.3000202@oracle.com>
References: <4D2B44E9.3000006@abpni.co.uk> <0903BC3C-68B9-4E15-BEE1-0A9F6CDCF226@oracle.com> <4D2B84F0.6030300@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D2B84F0.6030300@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

On 10/01/11 22:15, Jonathan Tripathy wrote:
> If a guest maliciously added a vlan tag, wouldn=92t it still remain i=
n=20
> the frame, however be "double-tagged" by the outgoing physical port?=20
> Even still though, this probably isn't an issue, provided that all=20
> upstream switches are configured correctly.=20

I don't believe that this is an issue.  And 802.1ad double tag won't be=
=20
recognised so it will either be dropped by the switch or dropped by the=
=20
outgoing NIC on the bridge.   Short of constructing frames by hand,=20
though, I'm not sure how you would go about adding an 802.1ad vlan tag=20
on top of an 802.1q vlan tag.

jch
