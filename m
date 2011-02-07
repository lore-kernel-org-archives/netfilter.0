From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ebtables VLAN filtering
Date: Sun, 06 Feb 2011 22:43:24 -0600
Message-ID: <4D4F786C.6080806@riverviewtech.net>
References: <4D4F4E43.6090000@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D4F4E43.6090000@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 2/6/2011 7:43 PM, Jonathan Tripathy wrote:
> With ebtables, is it possible to filter via the VLAN interface (e.g.
> eth0.3 for VLAN3) using the normal -i and -o parameters? I'd like to
> filter via the interface rather than using the tag with --vlan-id if
> possible

Yes it is.

(I am currently doing exactly that on a system with 30+ VLAN interfaces.)

It is my (mis)understanding that the --vlan-id is used to match traffic 
to/from a specific tagged VLAN on the /raw/ interface.  (I don't know 
for sure b/c I never match on the raw interface.  I always use the VLAN 
sub-interface.)



Grant. . . .
