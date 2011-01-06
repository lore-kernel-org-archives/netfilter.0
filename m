From: John Haxby <john.haxby@oracle.com>
Subject: Re: VLANs
Date: Thu, 6 Jan 2011 07:32:08 +0000
Message-ID: <ACCD470A-45A5-4F54-988F-9F73703C599E@oracle.com>
References: <4D246038.5040504@abpni.co.uk>
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D246038.5040504@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org


On 5 Jan 2011, at 12:12, Jonathan Tripathy wrote:

> 
> If I plug my Xen host to a VLAN aware switch using a trunk port (I.e. all frames are tagged), can my Xen host, using a linux bridge, strip out all tagging and send frame to correct Xen VM? (And vice versa)

Yes.  The outgoing interface on the bridge deals with the VLAN tag.

> 
> I wish to have isolated and secure networks that cannot communicate except via my VLAN aware firewall (pfsense)


Yup, that's what you get.

jch