From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: TTL target
Date: Fri, 23 Jul 2004 13:37:07 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7EACCDBB65D37443912D80713CC1245D02382A6C@fsnsab20.losangeles.af.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: 'NetFilter List' <netfilter@lists.netfilter.org>



same question?
~piranha

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of David Cary Hart
Sent: Friday, July 23, 2004 1:09 PM
To: netfilter
Subject: RE: TTL target


On Fri, 2004-07-23 at 14:43, Jason Opperisano wrote:
> just re-read your original post.  if you're trying to *change* the TTL of
packets traversing your firewall--you need the TTL patch from patch-o-matic,
which will enable a "-j TTL" target in the MANGLE table.
> 
> sorry for the confusion.
> 
I must ask a dumb question. Why would one want to mangle TTL or filter
on TTL?

Thanks

> -j
> 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Gonzalez,
> Federico
> Sent: Friday, July 23, 2004 1:52 PM
> To: netfilter@lists.netfilter.org
> Subject: TTL target
> 
> 
> Hi,
> 
> I have iptables 1.2.9, red hat kernel 2.4.22 and i need to use the TTL
> target to change the packets TTL.
> 
> How do i enable this functionality ?
> 
> Thank you.



