From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Help with port forwarding
Date: Thu, 23 Oct 2003 23:03:33 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LFEHKEBEBHAFGJBMNKAOAEHJCDAA.markee@bandwidthco.com>
References: <FDAFEC98D318F74CA26B5A26F2B4965227C545@exchange.jfctechnologies.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDAFEC98D318F74CA26B5A26F2B4965227C545@exchange.jfctechnologies.com>
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
To: "Kleiner, Peter" <kleinerp@smbmicro.com>, netfilter@lists.netfilter.org

Peter - I don't see anything obvious in the script that could be
problematic.  What do you mean by "port forwarding not working"? Are you
getting any error messages?  Is translation being performed but the packets
are not routed?  I might be able to generate some ideas here if you can be
more specific.  By the way, I believe you are meaning to block the Auth
protocol (port 113):  that being the case, you need to specify TCP and not
UDP.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Kleiner, Peter
Sent: Wednesday, October 22, 2003 9:41 AM
To: 'netfilter@lists.netfilter.org'
Subject: Help with port forwarding


Greetings,

I have two PCs that, software-wise are reasonably identical.  Both are
RH9.0 with iptables 1.2.7a.

I have a script to set the rules for masquerading and port forwarding.
The script is identical, except that the internal address range is
different.

My problem is that port forwarding works on one PC and not the other.  I've
spent many hours trying to figure out what is wrong to no avail.  I was
wondering what other factors will affect iptables.

Anyway, here is the info on the the two PCs, which I'll call PC1 and PC2.
PC1 is the working one and PC2 is the non-working one.  Both PCs have
eth0 as internal and eth1 as external interfaces.

I've put the info that I thought was relevant here:
http://www.smbmicro.com/~kleinerp/iptables.txt

Please let me know if you require anything else.

Thanks in advance!!!
Pete



