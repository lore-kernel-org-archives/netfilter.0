From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Can netfilter do this?
Date: Thu, 25 Mar 2004 09:23:52 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679255@alderaan.smgtec.com>
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
To: David Cannings <lists@edeca.net>, netfilter@lists.netfilter.org



> When text
> wraps the boundary of one packet netfilter can no longer help, some
> form of reassembly is required before the "full" text can be read and
> taken into context.=20

Apparently when you use the QUEUE extension the packet is re-assembled
before the packet is passed to the userspace application. This makes
proper filtering and detection possible. You still have to track the
entire session from userspace if you want to be accurate, but that
depends on what userspace tool you're plugging into. I know of Snort and
Squid which have 'inline' modes. These programs should have some ability
to filter out the garbage.

