From: <Josh.Berry@compucom.com>
Subject: RE: -m string
Date: Fri, 8 Aug 2003 07:53:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0C7C6E1720E8D74FB52EBEF93649730A0116BECA@2k099exm01.compucom.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: cc@belfordhk.com
Cc: netfilter@lists.netfilter.org

You could see if the module is there to load: insmod ipt_string

-----Original Message-----
From: Edmund [mailto:cc@belfordhk.com]=20
Sent: Thursday, August 07, 2003 9:06 PM
To: Netfilter
Subject: -m string

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





