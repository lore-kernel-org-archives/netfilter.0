From: canqun zhang <canqunzhang@gmail.com>
Subject: kernel panic when running /etc/init.d/iptables restart
Date: Mon, 24 Dec 2012 13:51:41 +0800
Message-ID: <CAFFEFTXxsPRf1Rmxyih0wL4O6q8G0OFmz0iRLX0tOYedYfajHw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=mnVbndydaPABXYoLndpigGYvL2brASyNfUIGuRZq1lA=;
        b=CKs9jg2fVCJYrDiDqaSDsCPXlqK3G91Axdsw7a0Sf70EU9F6wMS9/+1XkcKtaxewUp
         EqlqVQL1MUj6o41Y30j12ROumLI9e+R2Ucg/hHnTFWJ9xN5iMzh11RZz6CMB7UY9IhTy
         u/TzQsAkJD+kcbQQBhbJijEBx46o8rCMZWpkuAIQfesr7XtLWP4UYmj/SdNrf+RBNI6W
         LCJfFu7V8y7YDpITb4P113gUTO+6KwUTXvXhhjjxSjPQtmZ9G2E8hJsDt+wBhYdwyowy
         UPE77oUxcRMsjT8orEByK0XQC13taEK9aeldUH68HD2cA52HblEYXVtktZN303EYwx+5
         O4Ug==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Patrick=A3=AC
If i start  one lxc container instance, and then in the system there
will be two net namespaces,one is init_net namespace, the other is
created by lxc.If running "/etc/init.d/iptables restart",the system
will be panic. I find iptables restarting will clean init_net
namespace firstly,then clean the net namespace created by lxc,buf
related functions about cleaning up init_net namespace will destroy
global variables such as nf_ct_destroy,ip_ct_attach=A3=ACetc.So,funtion=
s
cleaning up  the other net namespace will be panic.

I fixed it up (see below) .If the system need cleaning init_net
namespace, Ip conntrack belonging to other namespaces will be cleaned
up firstly.

diff -r 7884e663ef6f -r 57fd45b8a144 net/netfilter/nf_conntrack_
core.c
--- a/net/netfilter/nf_conntrack_core.c Sun Dec 09 21:41:08 2012 +0800
+++ b/net/netfilter/nf_conntrack_core.c Sun Dec 23 16:28:15 2012 +0800
@@ -1122,7 +1122,22 @@
diff -r 7884e663ef6f -r 57fd45b8a144 net/netfilter/nf_conntrack_core.c
--- a/net/netfilter/nf_conntrack_core.c Sun Dec 09 21:41:08 2012 +0800
+++ b/net/netfilter/nf_conntrack_core.c Sun Dec 23 16:28:15 2012 +0800
@@ -1122,7 +1122,22 @@

 static void nf_conntrack_cleanup_net(struct net *net)
 {
- i_see_dead_people:
+       if (net =3D=3D &init_net) {
+               struct net *net_poll;
+               rcu_read_lock();
+               for_each_net_rcu(net_poll) {
+                       synchronize_net();
+               again:
+                       nf_ct_iterate_cleanup(net_poll, kill_all, NULL)=
;
+                       nf_ct_release_dying_list(net_poll);
+                       if (atomic_read(&net_poll->ct.count) !=3D 0) {
+                               schedule();
+                               goto again;
+                       }
+               }
+               rcu_read_unlock();
+       }
+i_see_dead_people:
        nf_ct_iterate_cleanup(net, kill_all, NULL);
        nf_ct_release_dying_list(net);
        if (atomic_read(&net->ct.count) !=3D 0) {
--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
