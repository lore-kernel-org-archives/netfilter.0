From: Adharsh Praveen R <adarsh@multitech.co.in>
Subject: PPTP Conntrack
Date: Tue, 15 Oct 2002 12:48:15 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DABC137.1DFC4D12@multitech.co.in>
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
Content-Type: text/html; charset="us-ascii"
To: netfilter@lists.netfilter.org

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
hai
<p>I would like to know the differences between pptp-conntrack-nat.patch
<br>and pptp-gre-ct-nat-0.83.patch.I am trying to apply these patches to
my 2.4.18 kernel.I am using iptables-1.2.6a.I applied pptp-conntrack-nat.patch
first to the kernel. Later I tried appling pptp-gre-ct-nat-0.83.patch.
<br>when I try to compile the kernel after saying make menuconfig and make
<br>bzImage,make install, the compilation fails in make modules saying
<br><b>structure has no member named 'master' in ip_conntrack_pptp.c</b>
<br><b>structure has no member named 'list' in ip_conntrack_pptp.c</b>
<br>(This is for the structure ip_ct_pptp )
<br>when I check the file, the structure has a member called slave.
<br>pptp-conntrack-nat.patch wants a member called master in the structure.
<br>where as pptp-gre-ct-nat-0.83.patch adds a member called slave in the
<br>structure.
<p>Can I apply these two patches together or any one of them is enough
<p>for PPTP to function with NAT. If both are needed, in which order&nbsp;
should I apply
<p>the patches.
<br>&nbsp;
<p>Thanks in advance.
<p>regards,
<br>adharsh.</html>


