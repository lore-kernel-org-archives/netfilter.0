From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: libipt_{psd,string}.so patch-o-matic extensions dont compile to executables.
Date: Tue, 24 Aug 2004 08:15:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512BC@asimail2.alphanumeric.com>
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

> Hello all,
>
> Actually figured it out!
>
> its that the header files need to be in the include dir and that in =
the extensions the makefile needs to have the name of the module added.
>
>
> once thats set they compile!
>
> psd is working great but make menuconfig still doesnt see the "string" =
package!
>
> willpost back if I figure it out!

i don't think the string patch works with 2.6...

-j

