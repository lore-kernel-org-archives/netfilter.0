From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: NAT Helper or UPnP?
Date: Mon, 5 Jul 2004 10:56:54 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <SERVER7T2NqFJ3sl3xb000000a7@server7.bandwidthco.com>
References: <200407050848.23707.gdh@acentral.co.uk>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407050848.23707.gdh@acentral.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Gavin Hamill' <gdh@acentral.co.uk>, netfilter@lists.netfilter.org

 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Gavin Hamill
Sent: Monday, July 05, 2004 12:48 AM
To: netfilter@lists.netfilter.org
Subject: Re: NAT Helper or UPnP?

On Monday 05 July 2004 08:29, Antony Stone wrote:

> I know this is by no means a detailed reply, but I would say it comes 
> down to one word - "security".

I'll second that.

Microsoft released a long article extolling the virtues of UPnP where it
pitches the system as a replacement for X.10 home automation, (e.g. 
everything including your alarm clock is UPnP enabled, and gets synchronised
/ alarms set by a central server), with only a small mention of the hideous
firewall 'features'

UPnP moves policy and security decisions from the firewall ruleset where
they properly belong to a userspace app running on Windows - forgive me, but
the designer of this system seems like a candidate for the Darwin Awards of
the most dangerous and stupid network idea ever - just think the next
version of Sasser / Fizzer would open ports on your $50 UPnP-enabled
firewall and make you be an even bigger zombie host.

And all in the name of 'ease of use' - bah. Let's hope a huge lawsuit
against Netgear / Belkin / other low-end router manufr. puts an end to this
disease.

gdh

How about a third. Permitting Microsoft's UPnP through you firewall is
equivalent to taking all the curtains down in your house and letting the
entire world look inside. But alas, they may not be content with just
viewing as they may see some things they might like and will eventually
break in at night and take them.



