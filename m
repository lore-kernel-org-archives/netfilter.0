From: Adharsh Praveen R <adarsh@multitech.co.in>
Subject: pptp-conntrack-nat.patch Vs pptp-gre-ct-nat-0.83.patch
Date: Wed, 09 Oct 2002 16:20:49 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA40A08.55705015@multitech.co.in>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------3179E683F66811D21A0EFD0C"
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
To: netfilter@lists.netfilter.org


--------------3179E683F66811D21A0EFD0C
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

hai

I am new to the list and new to iptables. Please forgive me if I sound
stupid.

I would like to know the differences between pptp-conntrack-nat.patch
and

pptp-gre-ct-nat-0.83.patch.

I am trying to apply these patches to my 2.4.18 kernel.

I am using iptables-1.2.6a.

I applied pptp-conntrack-nat.patch first to the kernel.

Later I tried appling pptp-gre-ct-nat-0.83.patch.

when I try to compile the kernel after saying make menuconfig and make
bzImage,

make install, the compilation fails in make modules.

saying

structure has no member named 'master' in ip_conntrack_pptp.c

structure has no member named 'list' in ip_conntrack_pptp.c

(This is for the structure ip_ct_pptp )

when I check the file, the structure has a member called slave.

pptp-conntrack-nat.patch wants a member called master in the structure.

where as pptp-gre-ct-nat-0.83.patch adds a member called slave in the
structure.

Can I apply these two patches together or any one of them is enough

for PPTP to function with NAT.

Can anyone enlighten me on this?

Thanks in advance.

regards,
adharsh.

--------------3179E683F66811D21A0EFD0C
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
hai
<p>I am new to the list and new to iptables. Please forgive me if I sound
stupid.
<p>I would like to know the differences between pptp-conntrack-nat.patch
and
<p>pptp-gre-ct-nat-0.83.patch.
<p>I am trying to apply these patches to my 2.4.18 kernel.
<p>I am using iptables-1.2.6a.
<p>I applied pptp-conntrack-nat.patch first to the kernel.
<p>Later I tried appling pptp-gre-ct-nat-0.83.patch.
<p>when I try to compile the kernel after saying make menuconfig and make
bzImage,
<p>make install, the compilation fails in make modules.
<p>saying
<p><b><u>structure has no member named 'master' in ip_conntrack_pptp.c</u></b><b><u></u></b>
<p><b><u>structure has no member named 'list' in ip_conntrack_pptp.c</u></b>
<p>(This is for the structure ip_ct_pptp )
<p>when I check the file, the structure has a member called slave.
<p>pptp-conntrack-nat.patch wants a member called master in the structure.
<p>where as pptp-gre-ct-nat-0.83.patch adds a member called slave in the
structure.
<p>Can I apply these two patches together or any one of them is enough
<p>for PPTP to function with NAT.
<p>Can anyone enlighten me on this?
<p>Thanks in advance.
<p>regards,
<br>adharsh.</html>

--------------3179E683F66811D21A0EFD0C--


