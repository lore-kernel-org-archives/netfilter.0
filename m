From: Edmund <cc@belfordhk.com>
Subject: -m string
Date: Fri, 08 Aug 2003 10:05:43 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F330577.6020202@belfordhk.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

Hi,

George Viera recently mentioned about using
-m string to filter 'bad' packets.

Is there supposed to be a pre-requisite to
the following command?

iptables -A INPUT -m string --string 'cmd.exe' -j DROP

(actually, I'm attempting this:)

iptables -A FORWARD -m string --string 'cmd.exe' -j DROP

I get a "iptables: No Chain/target/match by that name"
error.  I sense that it's complaining about '-m string'.
I applied the string.patch and recompiled the kernel
already.  (btw, I'm using Slackware w/ 2.4.21 kernel).

Btw, how do I tell if the kernel contains the said
patch?

Any help appreciated





I realize this will slow the system down a bit,
but at this point I'm just testing out the option.




