From: DarKRaveR <DarKRaveR@habitat-b.de>
Subject: libiptc/rules with MAC match
Date: Sun, 9 Feb 2003 17:11:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <634767264.20030209171145@habitat-b.de>
Reply-To: DarKRaveR <DarKRaveR@habitat-b.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hello netfilter folks,

  I wonder if this is the right list, I got soem questions concerning
  libiptc and acquiring rules and setting rules with it. I read all
  documents I could find, as well as part of iptable sources and the
  header files etc. .
  Yet there's some things I don't seem to get straight.

  If I fetch the rules of a chain, I'll get a struct ipt_entry (well,
  actually a pointer, but this won'T matter for now). There's all
  kinda src,dst ips,netmasks etc. flags.

  Within this struct there an ipt_ip struct, with the properties:
  char iniface[IFNAMSIZ], outiface[IFNAMSIZ];
  unsigned char iniface_mask[IFNAMSIZ], outiface_mask[IFNAMSIZ];

  What's the difference between those two ?

  The other thing is, assuming I have a rule, which matches a MAC
  Adress, how do I get the MAC Adress (and if such a matching is in
  the rule). From what I've understood, there's the target_offset
  counter, which helps me on that.

  Even more intriguing is the following question to me:

  I can see, there's a function to get the target.
  Assuming I want to set a rule, how do I set the target properly, and
  how do I set a MAC matching ?

  I couldn't find anything in particular on that and would apprechiate
  any help on that

-- 
Best regards,
 DarKRaveR                          mailto:DarKRaveR@habitat-b.de


