From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: VPN?
Date: Fri, 13 Aug 2004 12:30:28 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC905127F@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

> On Fri, Aug 13, 2004 at 11:16:58AM -0400, Jason Opperisano wrote:
> >
> > are you NAT-ing the connections from 192.168.0.0/24 to the PPTP =
server?  according to "-A POSTROUTING -s 192.168.0.0/255.255.0.0 -j =
MASQUERADE" in your posted rules, you are.
>
> Yes I am.
>
> > you need the pptp-conntrack-nat from POM for this to work.
>
> # modprobe pptp-conntrack-nat
> FATAL: Module pptp-conntrack-nat not found.

well--to be strict about the syntax--it would be:

        # modprobe ip_conntrack_pptp
        # modprobe ip_nat_pptp

> Do I need to recompile the kernel for that?
> I use mandrake 10.0, 2.6.3-7mdksmp.

heh heh--well the pptp-conntrack-nat patch doesn't actually officially =
support the 2.6 kernel:

$ cat /usr/local/src/patch-o-matic-ng-20040621/pptp-conntrack-nat/info
Title: PPTP connection tracking and NAT helper
Author: Harald Welte <laforge@netfilter.org>
Status: Testing
Requires: linux < 2.6.0
Repository: extra

as far as i can tell--the stock mandrake 10 kernel (2.6.3.7mdk-1-1mdk) =
doesn't include these modules...however--the current cooker kernel =
(kernel-2.6.8.0.rc1.2mdk-1-1mdk) does...  depending on how important =
this is to you--it might be worth investigating...

-j

