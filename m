From: "Bassam A. Al-Khaffaf" <bassam@palettemm.com>
Subject: RE: wher to find and how to install ip_conntrck_pptp and ip_nat_pptpmodules
Date: Thu, 12 Aug 2004 14:03:45 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1Bv8kW-0004nJ-Mr@vishnu.netfilter.org>
References: <D5C9032B2B09C64EA2409D6214E91AC905126A@asimail2.alphanumeric.com>
Reply-To: <bassam@palettemm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC905126A@asimail2.alphanumeric.com>
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
To: netfilter-admin@lists.netfilter.org, netfilter@lists.netfilter.org

Thanks for responding, I downloaded the "patch-o-matic-20031219.tar.bz2" and
unzip and untar the file and then I went through the README file, I found
there that this patch support only "kernel 2.4.18" while my redhat kernel is
"2.4.20" and my fedora core 2 kernel is "2.6.5". In this case do you think
that it will be installed without errors, and do you think that it will work
properly??

Your advice please

Regards
Bassam

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Jason Opperisano
Sent: Wednesday, August 11, 2004 9:08 PM
To: netfilter@lists.netfilter.org
Subject: RE: wherr to find and how to install ip_conntrck_pptp and
ip_nat_pptpmodules

> I am trying to enable a multiple VPN tunnels to pass through my Linux
> machine so that VPN clients on the LAN can access the VPN server on the
WAN.
> Through my google search I found there are two modules required to enable
> this functionality on my Linux box, these modules should be loaded in the
> kernel. So any body can help and direct me where to find these two modules
> and how can I install them?

the pptp-conntrack-nat is part of POM in the "extra" suite.  if you're
running RH9, you won't have much luck with pom-ng, but you should be able to
patch/compile from the older pom located at:

	http://netfilter.org/files/patch-o-matic-20031219.tar.bz2

read the README, and have at it.

> I am expecting you urgent help regarding this matter

i hope this was fast enough...  jeez--gettin' a little pushy on this list
these days.  might have to invite some folks from openbsd-misc to "work the
door."  ;-)

-j

---
Incoming mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.729 / Virus Database: 484 - Release Date: 7/27/2004
 

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.729 / Virus Database: 484 - Release Date: 7/27/2004
 


