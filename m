From: "Alex Chen" <alex_chen@sbcglobal.net>
Subject: RE: Is iptables available for Mac OS 10.X
Date: Thu, 19 Jun 2003 21:21:32 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c336e3$6e932900$020201c0@sweethome>
References: <Pine.LNX.4.44.0306191953510.27709-100000@mooned.org>
Reply-To: <alex_chen@sbcglobal.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0306191953510.27709-100000@mooned.org>
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

Thanks for the information, Ed.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Edward Moon
Sent: Thursday, June 19, 2003 5:57 PM
To: Aldo S. Lagana
Cc: alex_chen@sbcglobal.net; netfilter@lists.netfilter.org
Subject: RE: Is iptables available for Mac OS 10.X


FYI,

You don't need to even 'get' ipfw on Mac OS X. It's there by default (at
/sbin/ipfw).

When you enable the firewall under System Preferences -> Sharing ->
Firewall, you are using a dumbed down GUI to ipfw.

If you check freshmeat.net or www.versiontracker.com, you'll find a number
of GUI frontends available for ipfw on Mac OS X.

On Thu, 19 Jun 2003, Aldo S. Lagana wrote:

> Date: Thu, 19 Jun 2003 15:48:22 -0400
> From: Aldo S. Lagana <alagana@discmail.com>
> To: alex_chen@sbcglobal.net, netfilter@lists.netfilter.org
> Subject: RE: Is iptables available for Mac OS 10.X
>
> I would think it may be easier to get ipfw (the BSD firewall equivalent to
> iptables) since as you say the Mac OSX is a BSD derivative
>
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Alex Chen
> Sent: Thursday, June 19, 2003 3:41 PM
> To: netfilter@lists.netfilter.org
>
> Is there a port of iptables done on Mac OS 10.X anywhere?
> If not, is it easy to do the port ourselves?
>
> If I understand correctly, there are two parts of iptables,
> kernel space and user space and what we use in the RPM is
> only user space.  It need the kernel space change compiled
> into the kernel, e.g. Linux.  If so, does anyone know if
> the Mac OS kernel, based on BSD I believe, supports the user
> space part of the iptables?
>
> Any help is appreciated.
>
> Alex Chen
>
>
>


