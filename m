From: "Rowan Reid" <rreid@studio3arc.com>
Subject: FW: PPTP through masquerading gateway
Date: Tue, 9 Jul 2002 09:44:43 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <001201c22767$fe3fe430$6b01a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org, "'R. Sterenborg'" <rsterenborg@xs4all.nl>, suse-linux-e@suse.com


FYI

Some info I came across, unfortunatly I'm not a CVS genious and the only
Method I know to patch I file is with zcat. Can someone answer this one
for me.

> the pptp patch in the CVS won't apply. I've just submitted a 
> patch to the -devel list. You can download the latest CVS 
> tree and apply the following patch : 
> http://fabnetwork.ifrance.com/fabnetwork/patches/conntrack_ppt
p_patch_rediff.patch
After that, running patch-o-matic, the pptp patch should now apply
properly.

Have a nice day,

Fabrice.
--
Fabrice MARIE
Senior R&D Engineer
Celestix Networks
http://www.celestix.com/

"Silly hacker, root is for administrators"
       -Unknown


