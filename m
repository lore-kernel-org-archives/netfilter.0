From: "Kevin Smith" <starwatcher22@earthlink.net>
Subject: Cuseeme-nat patch
Date: Fri, 18 Apr 2003 22:09:31 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002a01c30618$b77fe5a0$0200000a@workgroup.kev>
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

Fellow Listers,

 Looking into it further, I found that in the
/usr/src/linux-2.4.20/net/ipv4/netfilter directory the only related file is
ip_nat_cuseeme.c..So it didnt compile. I looked at the file and saw it
refrenced a directory called linux/netfilter_ipv4 which doesnt exist on my
system.
So I tried to remove and put it back It didntlet me remove it, and now that
I got it out, it fails on applying.
Im sure im overlooking something easy...Oh and POM say there is a file
missing, when I have 5 out of 5.
Ty for any suggestions.
Kev


