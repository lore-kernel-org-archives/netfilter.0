From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: RE: Security question
Date: Mon, 01 Mar 2004 17:47:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078181236.2007.17.camel@localhost>
References: <7A3B4AA360FDEF448F3390421FC8D731018D5467@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7A3B4AA360FDEF448F3390421FC8D731018D5467@coxhpexg.coxhp.com>
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
To: bmcdowell@coxhealthplans.com, netfilter@lists.netfilter.org

ifconfig hw ether <WhateverMACAddressYouWantToSpoof>

In fact, this works so well because one can mimic both IP and Mac
address without interrupting service to the real IP address owner! The
ARP table is not compromised and traffic keeps flowing perfectly fine to
the existing users.

I believe one can even use it to get onto restricted wireless networks.

I apologize in that I haven't followed this thread but have been
investigating MAC spoofing as part of our investigation to turn ISCS
(http://iscs.sourceforge.net) into a spoof-proof wireless product with
robust user authentication required before even associated wireless
users can go anywhere from the access point.  In this testing, I was
truly surprised at how easy and effective MAC spoofing was.  I was even
surprised to be surprised since I was quite acquainted with using
locally administered MAC addresses from SNA work in a former life!

So I concur with the rest of the paranoid security admins on the list!

On Mon, 2004-03-01 at 17:24, bmcdowell@coxhealthplans.com wrote:
> Anthony is correct.  Google it and you'll find numerous examples:
> 
> http://www.google.com/search?hl=en&lr=&ie=UTF-8&oe=UTF-8&safe=off&q=forg
> e+MAC+address+nic
> 
> Despite this fact, however, you don't seem to be using your imagination.
> I've always preferred it when security people were just a little more
> paranoid:
> 
> Imagine a scenario where some form of unknown attack is used to kill
> your 'router' and turn one of your connected PC's into a 'router'
> instead.
> 
> In that case, you would probably wish you had used scenario #2...  With
> #2 a dead router means no internet, and that might actually be a good
> thing - in an ostrich sort of way.
> 
> 
> Bob
> 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Sasa Stupar
> Sent: Monday, March 01, 2004 8:25 AM
> To: Netfilter-List
> Subject: Re: Security question
> 
> 
> But with the MAC/IP filtering I can restrict access to the router. So 
> anyone who is not in the MAC table for accept it will be refused.
> I don't think that it is possible to forge MAC address of nic, or am I 
> wrong?
> 
> Sasa
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


