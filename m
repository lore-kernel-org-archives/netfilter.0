From: "Wilfried BARNAVON (Fire)" <wbarnavon@on-fire.net>
Subject: A really buggy official release ?
Date: Fri, 9 Jul 2004 10:28:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005401c4658e$c5319960$f301a8c0@groupecpro.local>
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

Hi !

I've downloaded iptables-1.2.11, kernel 2.6.7 and pom-ng-20040621

kernel and pom-ng seem OK however, even without any patch, iptables won't
compile !

I'm on Fedora Core 2.

It says that there is no rule to build the target "extensions/libipt_!!!.c"
needed by "extensions/libipt_!!!.d". Stopped !

The return code of make is 2.


That is the same with pom-ng !


any idea ?




Wilfried



