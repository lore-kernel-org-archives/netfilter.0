From: "Gautham Thavva" <gautham.thavva@lycos.com>
Subject: TFTP crashes the linux system...
Date: Mon, 26 Jan 2004 18:20:20 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BBKGNGAPNMGCAKAA@mailcity.com>
Reply-To: gautham.thavva@lycos.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Language: en
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


I have enforced a firewall, using iptables-1.2.6a, on a target board running TimeSys Linux Kernel(Kernel version is 2.4.7-10).

I have applied the *tftp* patch available in the patch-o-matic. 

When I try to do a tftp "get" or "put" from a PC in a different subnet to this board, the system crashes. An Oops is generated during the init_conntrack function in ip_conntrack_core.c

Code Snippet (either Line #545 or Line #552) from init_conntrack where Oops is generated... 
Line #545 expected = LIST_FIND(&expect_list, expect_cmp, struct ip_conntrack_expect *, tuple);

Line #552 if (expected && is_confirmed(expected->expectant)) {

But the system doesnt crash if a default route has been configured.

Please can someone share their insight as to why the absence of the default route causes the system to generate Oops during TFTP operations.

With regards,
Gautham Thavva


____________________________________________________________
Get advanced SPAM filtering on Webmail or POP Mail ... Get Lycos Mail!
http://login.mail.lycos.com/r/referral?aid=27005

