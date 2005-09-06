From: Oscar Mateo <omateo@gmail.com>
Subject: unable to apply PPTP patches
Date: Tue, 6 Sep 2005 16:50:24 +0200
Message-ID: <a8a372c05090607507e8353c3@mail.gmail.com>
References: <a8a372c05090607457fce3ca9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a8a372c05090607457fce3ca9@mail.gmail.com>
Content-Disposition: inline
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

Hi all:

I have been trying to apply the pptp patches (pom-ng-20050905,
iptables-1.3.3) to the kernel source (kernels 2.6.9.x, 2.6.11.x and
2.6.12.x) and I have found the same error that populates the August
2005 netfilter Archives:

- If I only apply the pptp/gre patches I get
`__ip_conntrack_expect_find' undefined (when compiling either in the
kernel or as a module).
- If I try to apply nfnetlink and ctnetlink patches, ctnetlink is
rejected (6 rejects out of 48 hunks).
- If I force the ctnetlink patch, I get `__ip_conntrack_hash_insert' undecl=
ared.

Did someone get the patch working with kernels >=3D 2.6?
Does anyone have any ideas how to deal with this problem?

Thanks in advance for your help ^_^
Oscar

