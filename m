From: "per j" <perj8@hotmail.com>
Subject: Re: ipt_recent 0.3.0 --rttl still doesn't work (I made a patch instead, can't
 wait)
Date: Mon, 03 Mar 2003 22:01:52 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F191QIirBHORUedPfms0003b720@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sfrost@snowman.net
Cc: netfilter@lists.netfilter.org, ipt_recent@snowman.net

Nope, my patch doesn't remove 'if(out) ttl++;'.  However I'm not too certain 
whether one would really use it.  It doesn't really matter unless --rttl is 
in the POSTROUTING chains.  So far -m recent and LOG are both seeing the 
same TTL for me and I have no --rttl in POSTROUTING.  Why would one use 
--rttl in POSTROUTING?  That's pretty late to filter incoming packets (or 
rather outgoing packets).  Perhaps one would use it to mangle forwarded 
parkets, but it would mean the packet already traversed the FORWARD chain!  
Maybe you could better explain 'if(out) ttl++;'?  I guess it's there for 
those who must use --rttl in POSTROUTING?

On the other hand, I use -j TTL --ttl-inc 1 in PREROUTING to restore the TTL 
of packets going through the gateway as if packets forwarded through the 
gateway are coming from the gateway.  So this _conflicts_ with your 'if(out) 
ttl++;' if I were to use --rttl in POSTROUTING after -j TTL in the mangle 
table.  I think it best not to use 'if(out) ttl++;' in ipt_recent in this 
case.

I see your point about making a new table entry for any different TTL from 
the same ip address.  Valid point indeed!  --rttl seems to work fine with 
your suggested code change to r_list[location].ttl, so I'm using the 
following patch instead.

I wonder why you left the ?old? bug hanging around without giving your users 
any notice?  You should have publicly announced --rttl code is not yet done 
somewhere in the documentation or on your announcement pages.  It's kinda a 
lie to publicly release ipt_recent without announcing the TODO list of _old_ 
bugs.  Before this patch, --rttl worked only in extremely rare condition 
when r_list[location].addr==addr and location==0.  and u knew this was an 
old bug for a year or so? (sigh)

Patched against ipt_recent-0.3.0
--- linux/net/ipv4/netfilter/ipt_recent.c.orig	2003-03-03 00:27:47.000000000 
-0500
+++ linux/net/ipv4/netfilter/ipt_recent.c	2003-03-03 15:51:37.000000000 
-0500
@@ -266,6 +266,7 @@

	skb.nh.iph->saddr = addr;
	skb.nh.iph->daddr = addr;
+	skb.nh.iph->ttl = 0;
	match(&skb,NULL,NULL,&info,0,NULL,sizeof(info),NULL);
	kfree(skb.nh.iph);

@@ -360,7 +361,7 @@
	 * first TTL we get for that IP address. */
	if(info->check_set & IPT_RECENT_TTL) {
		while(hash_table[hash_result] != -1 && 
!(r_list[hash_table[hash_result]].addr == addr &&
-			(!r_list[location].ttl || r_list[location].ttl == ttl))) {
+			(!r_list[hash_table[hash_result]].ttl || 
r_list[hash_table[hash_result]].ttl == ttl))) {
			/* Collision in hash table */
			hash_result = (hash_result + 1) % ip_list_hash_size;
		}



>* per j (perj8@hotmail.com) wrote:
> > I've played around with -j TTL and no it doesn't have to do with the TTL
> > mangled in the FORWARD chain because all my rules with -m recent are in
> > INPUT chain or the beginning of the FORWARD chain before ACCEPT.
>
>If your patch is against 0.3.0 then it may very well matter since your
>patch doesn't remove the 'if(out) ttl++;' line from 0.3.0.  Could you
>check for that?
>
> > I tried out the ipt_recent-0.3.0 release and the problem still exists.  
>I
> > turned on debug and found out r_list[location].ttl is always the same 
>and
> > doesn't even come close to the ttl value stored in the recent list.
>
>Yeah, that's an old bug from when I switched to using hash tables
>apparently.  I believe that *should* read:
>while(hash_table[hash_result] != -1 && 
>!(r_list[hash_table[hash_result]].addr == addr &&
>	(!r_list[hash_table[hash_result]].ttl || 
>r_list[hash_table[hash_result]].ttl != ttl))) {
>
>Instead.  Note that I also had to invert the ttl check, it should be
>considered a collision when the ttl doesn't match and matching ttl has
>been requested.
>
> > I got pretty fussed up patching and re-patching my kernel and your 
>latest
> > release still didn't fix the --rttl problem.  Finally I spend quite some
> > time reviewing your source code.  Your code on the IPT_RECENT_TTL 
>section
> > doesn't do a single thing because the location variable in 
>r_list[location]
> > doesn't change when hash_result is incremented.  I tried adding location 
>=
> > hash_table[hash_result] in the while loop, but that caused kernel panic. 
>  I
> > rewrote the whole IPT_RECENT_TTL code and now my tests for TTL matching
> > works.  I fixed it!
>
>Unfortunately what you did doesn't really work.  The goal of doing the
>TTL match is to differentiate between IP addresses based on their TTL so
>that they are really considered two seperate entities.  What you've done
>is to only allow one TTL value per IP address, whichever TTL came first.
>So, for example:
>
>10.10.0.1 sends to router, TTL == 32
>   10.10.0.1 gets added to recent list with ttl == 32
>10.10.0.1 sends to router, TTL == 25
>   10.10.0.1 gets 'found' in the hash table but then fails the TTL match
>
>10.10.0.1 with TTL of 25 will therefore never make it into the recent
>list, which is wrong.  Instead of just picking the first TTL and going
>with that these two need to be treated seperately as if they were two
>different IP addresses.
>
>If you could try the above changes I'd like to hear if they work for you
>or not.  I'll try and find some time to really test the TTL code soon.
>
> > Also I fixed the (unreported) problem with ttl not being set zero when
> > manually adding ip addresses into the recent list with a for loop in a 
>bash
>
>Thanks, added that into my local version.
>
>	Stephen
><< attach3 >>


_________________________________________________________________
The new MSN 8: advanced junk mail protection and 2 months FREE*  
http://join.msn.com/?page=features/junkmail


