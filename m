From: "per j" <perj8@hotmail.com>
Subject: ipt_recent 0.3.0 --rttl still doesn't work  (I made a patch instead, can't wait)
Date: Mon, 03 Mar 2003 13:20:12 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F208OXC80dFvgSFVA4R00035c2a@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----=_NextPart_000_489e_2b9d_5c55"
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
To: sfrost@snowman.net
Cc: netfilter@lists.netfilter.org, ipt_recent@snowman.net

This is a multi-part message in MIME format.

------=_NextPart_000_489e_2b9d_5c55
Content-Type: text/plain; format=flowed

I've played around with -j TTL and no it doesn't have to do with the TTL 
mangled in the FORWARD chain because all my rules with -m recent are in 
INPUT chain or the beginning of the FORWARD chain before ACCEPT.

I tried out the ipt_recent-0.3.0 release and the problem still exists.  I 
turned on debug and found out r_list[location].ttl is always the same and 
doesn't even come close to the ttl value stored in the recent list.

I got pretty fussed up patching and re-patching my kernel and your latest 
release still didn't fix the --rttl problem.  Finally I spend quite some 
time reviewing your source code.  Your code on the IPT_RECENT_TTL section 
doesn't do a single thing because the location variable in r_list[location] 
doesn't change when hash_result is incremented.  I tried adding location = 
hash_table[hash_result] in the while loop, but that caused kernel panic.  I 
rewrote the whole IPT_RECENT_TTL code and now my tests for TTL matching 
works.  I fixed it!

Also I fixed the (unreported) problem with ttl not being set zero when 
manually adding ip addresses into the recent list with a for loop in a bash 
script - eg. for blah_ip in bleh; do echo blah_ip > recentlist; done.  
Somehow the ttl value is non-zero but all the entires added into the recent 
list have that same non-zero ttl value.  However, doing echo xx.xx.xx.xx > 
recentlist in the command-line does properly set ttl zero.  I wonder why it 
behaves well when not in a script.

After some tests, I am confident that the following patch to the 
ipt_recent-0.3.0 source code will fix the --rttl and non-zero ttl problem in 
userctl.  It works for me.

Apologies for posting code here as I've not yet signed up at the 
developer-list, but let me know if you see any errors.

------------------------------------------------
--- ipt_recent.c.orig	2003-03-03 00:27:47.000000000 -0500
+++ ipt_recent.c	2003-03-03 07:19:16.000000000 -0500
@@ -266,6 +266,7 @@

	skb.nh.iph->saddr = addr;
	skb.nh.iph->daddr = addr;
+	skb.nh.iph->ttl = 0;	// ttl happens to be randomly assigned, make sure it 
is 0.
	match(&skb,NULL,NULL,&info,0,NULL,sizeof(info),NULL);
	kfree(skb.nh.iph);

@@ -354,21 +355,9 @@

	orig_hash_result = hash_result = hash_func(addr,ip_list_hash_size);
	/* Hash entry at this result used */
-	/* Check for TTL match if requested.  If TTL is zero then a match would 
never
-	 * happen, so match regardless of existing TTL in that case.  Zero means 
the
-	 * entry was added via the /proc interface anyway, so we will just use the
-	 * first TTL we get for that IP address. */
-	if(info->check_set & IPT_RECENT_TTL) {
-		while(hash_table[hash_result] != -1 && 
!(r_list[hash_table[hash_result]].addr == addr &&
-			(!r_list[location].ttl || r_list[location].ttl == ttl))) {
-			/* Collision in hash table */
-			hash_result = (hash_result + 1) % ip_list_hash_size;
-		}
-	} else {
-		while(hash_table[hash_result] != -1 && 
r_list[hash_table[hash_result]].addr != addr) {
-			/* Collision in hash table */
-			hash_result = (hash_result + 1) % ip_list_hash_size;
-		}
+	while(hash_table[hash_result] != -1 && 
r_list[hash_table[hash_result]].addr != addr) {
+		/* Collision in hash table */
+		hash_result = (hash_result + 1) % ip_list_hash_size;
	}

	if(hash_table[hash_result] == -1 && !(info->check_set & IPT_RECENT_SET)) {
@@ -459,6 +448,20 @@
				if(hits_found >= info->hit_count) ans = !info->invert; else ans = 
info->invert;
			}
		}
+	/* Check for TTL match if requested.  If TTL is zero then a match would 
never
+	 * happen, so match regardless of existing TTL in that case.  Zero means 
the
+	 * entry was added via the /proc interface anyway, so we will just use the
+	 * first TTL we get for that IP address. */
+		/* IPT_RECENT_TTL -> !ttl match -> ans = info->invert
+		 * TTL match section fix by bluecloud <cloudatcu teydotseeohem>
+		 * [aka perj8AThotmailDOTcom on the mailing list] */
+		if(info->check_set & IPT_RECENT_TTL && r_list[location].ttl && 
r_list[location].ttl != ttl) {
+			// TTL did not match
+			ans = info->invert;
+		}
+		if(debug && IPT_RECENT_TTL) printk(KERN_INFO "RECENT_TTL: match(): 
rttl:%u,ttl:%u \n",
+				r_list[location].ttl,
+				ttl);
		if(debug) {
			if(ans)
				printk(KERN_INFO "RECENT_NAME: match(): match addr: %u\n",addr);
---------------------------------------------------

>* per j (perj8@hotmail.com) wrote:
> > Have you got any luck fixing the --rttl bug?   It's already been a 
>couple
> > weeks since the last post.  I tried to go around this problem with no
> > success.  I don't want to put all my rules into one chain, the INPUT 
>chain,
> > to get it to work and prefer separate chains to make my firewall rules
> > easier to maintain.  Apparently --rttl doesn't work when --set is on a
> > different chain on the filter table.  That's the problem.
>
>Ok, coming back to this issue I'm pretty sure I have an idea as to what
>the problem is.  It's pretty simple, really, the TTL is going to change
>somewhere while in the kernel.  Probably in the routing logic.  This
>means that in PREROUTING the TTL is one thing but in FORWARD (after
>being routed) it's been decremented by one.
>
>The 'solution' to this problem would really be for the recent module to
>always go with the initial TTL and detect if the routing logic has been
>called or not to decide if it needs to increment the TTL to get back to
>the original TTL.  Unfortunately at the moment I'm not sure if that will
>be very easy or not but I'll look around and see if I can't make this
>work.
>
>	Stephen
><< attach3 >>


_________________________________________________________________
The new MSN 8: smart spam protection and 2 months FREE*  
http://join.msn.com/?page=features/junkmail

------=_NextPart_000_489e_2b9d_5c55
Content-Type: application/octet-stream; name="patch-ctl-rtt-ipt_recent.c-0.3.0.bz2"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch-ctl-rtt-ipt_recent.c-0.3.0.bz2"

QlpoOTFBWSZTWYG6tUgAAUDfgEIwc3///29v3h6////+UAR5sPJO2FUAAJKR
poCaGhqaemgKBso8o8mkaDQepmkep6Q9TQapqbUfqjQGQDRoDTQMgAANAADI
DTFVPSaaA0NqaHqDRk0NA0DIxAaZGhoA4aaYIZDTTIyYQDTQBhNGmTAAgaCS
ERNoE0CZCeEp4iDQekYjQ0DQyHlGRAUQQIkGaM+CCEEGSCQTBRYabDDRJKSU
Mia92uIyDIoE5khEB7lH8yh/HJMqRLnBSh835YRVD8xNjwdE0dUgQMHoIEcE
coZSwgBFASGtBI36J/aXVooUOYwMI9siqAnpnYbn5VnkZkIwrUuCQ49A7IrG
6CwrdweH1bfa6vVp0CjKx5hjM1R2kw6EcPeHAtFxUsOwyZudcjizlOYejPNa
LgwtcSImGlcCtkQ8pR8NJrWXVK4lkKntUDfS4vDPKPj55FgOerIHjYvF8hkj
EJut/E2lc2bEjE0T5biFoOBqKyheWGkUNr5IPM2AyNI2xMMzAwGqfltXA37V
Wr067mGfHyrXcw0VF1rDubTQPSutxVJWklrEDFlHnltjrwFZLP1+7ZpZ13of
17J7jfPQks4zYF1ItLmYhhJdL5iNd3YsZEFAfFJHzpbztQYmAfb5Ig5xjzky
WwJDD9sPASdfKZrBp9cqxRFLHieidRtIzHAuHh2n/kq9/H18X7TrsExmkifs
pthuURyWISQQFkwmox6gKUQLYhRvLfZoSai3v70tyXefiMh8BiDpNolUDOAb
3cCyljDA9p7ZpeetDVjtRJOXiGWH7IYX73uE1xS4AP6XR3L1IdVFoJ/R6Pvg
PGB4A5JJetMkNceBIR+RB6RqfhEHTwdHxne2EL7thVBisj3n4nfISU2BqIWE
0VGlE/YIa0bP+hueCETJmtC8ycXfVlfgZil1FbURwSICkoJ75J3NSVITJhXS
UkTe3mcTGrWf4QMoS3FpQojKskYaiqTGcrXFZyFdfUeJGQ8hw0LI4nGAEyxE
5MS6DCVJMYRECcIYOjY07ZpnyKh9CvZDJkaArCEhTS3LinpySYJA6zpHcUWe
DnTb6+HMdFxeH/MbDPx8Sa8rRb7mTh6sTxQUM4StTI7ZrsBjxjYMWAHgPBLM
ikjYUGWeaGykigwHTvOxOmS2DzXSBawQc66UXnAoAU7IquoCvYIkNRMmG95A
6LDHrrK0LYDyFW1TkwZMEFNBpBjUIc0osMxxWjXaE2RmC/LlzV2m8rpYHUvI
4aFyw9xIyC4XMDJTOTLlmew27zGQZiAHZKhQwHQxcOE9yjUFpuIhMM5LlrwG
rM0TuUkkq7FAcurTuVAwCzpLiiFIYYAnJ1eBUXDEFWUSJ51WoAhMwVOGRYsU
swlIzEkk5tkiRkhW1QrI6DS0+Z3OZ9efvvYsMvgdRBkAc7j3L2Gw0BAfMMG5
MGqZdjcxsJWFSKxHg1iX/i7kinChIQN1apA=


------=_NextPart_000_489e_2b9d_5c55
Content-Type: text/plain; name="patch-ctl-rtt-ipt_recent.c-0.3.0.bz2.md5sum"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="patch-ctl-rtt-ipt_recent.c-0.3.0.bz2.md5sum"

707719e9ad9c64d30c8273e9c9a405ba  patch-ctl-rtt-ipt_recent.c-0.3.0.bz2


------=_NextPart_000_489e_2b9d_5c55--

