From: "Jeremy Davis" <jeremy@slicenet.net>
Subject: RE: Additional Security
Date: Fri, 19 Sep 2003 17:17:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <AGEBICCCEMOAKANLEDBAMECECDAA.jeremy@slicenet.net>
References: <200309191739.h8JHdnKI008523@discmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309191739.h8JHdnKI008523@discmail.com>
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
To: Netfilter List <netfilter@lists.netfilter.org>

At the moment I am trying to wing myself off of tripwire in favor of
something else to do file integrity.  Tripwire, when downloaded from its
website, seg faults on redhat 9.  tripwire is a good solution for post
compromised forensic analysis.

Jeremy


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Aldo S. Lagana
Sent: Friday, September 19, 2003 1:40 PM
To: 'Jeffrey Laramie'; netfilter@lists.netfilter.org
Subject: RE: Additional Security


Tripwire seems to be a filesystem monitor - I wouldn't necessarily run it or
feel more secure running it, but others may disagree...
I run portsentry, snort, squid and iptables (along with poptop and freeswan
VPN servers)


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Jeffrey Laramie
Sent: Friday, September 19, 2003 1:15 PM
To: netfilter@lists.netfilter.org

Hi All,

I previously used Redhat releases for my firewall boxes, and they
install iptables and tripwire by default. I have switched to SuSE 8.2
which doesn't install tripwire by default. My question is:

Do you think it's worthwhile to install and configure tripwire on an
iptables firewall box?

I can't think of a better forum to get a straight opinion on this and I
think this topic is of interest to most of the list members. However I
understand this thread is off topic and will gladly take it off list or
move it to another forum if you can suggest one.

Jeff





