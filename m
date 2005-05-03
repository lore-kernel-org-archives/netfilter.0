From: Kwang-Hyun.Baek@Dartmouth.EDU (Kwang-Hyun Baek)
Subject: Making sure my "mangling" doesn't get mangled
Date: 03 May 2005 16:14:05 EDT
Message-ID: <51613155@newblitzen.Dartmouth.EDU>
Reply-To: Kwang-Hyun.Baek@Dartmouth.EDU
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello.  I am trying to set up a system where netfilter module that is b=
uilt-in to the kernel is the only thing that can mangle the packet even=
tually...in other words, if the user mangles the packet, the kernel can=
 mangle it later but no other netfilter/iptable can mangle it after the=
 kernel mangles it.  Does it make sense?  How can I impose such rule? =20=
Is there a way to do something like that?  I'm using SELinux by the way=
, and if you know of a way to do that in SELinux, that would be fine, t=
oo...

Also another thing...is there a way for a program to send a packet dire=
ctly to the interface thereby bypassing iptables rules that I set up? =20=
  If there is, is there a way to prevent it?  Thank you.

John

