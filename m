From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: forwarding
Date: Tue, 18 May 2004 11:23:38 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567934A@alderaan.smgtec.com>
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
To: alucard@kanux.com, "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: netfilter@lists.netfilter.org

iptables -t nat -A POSTROUTING --destination ${server2} -j SNAT --to
${server1_internal_ip}

This is the last time I try to respond to you since you've been ignoring
the rest. SNAT traffic from server 1 to server 2. Period. There's no
magic. Put it in, then the system will magically work. Well, replace the
${}'s with the actual values first.

If you even get this email, let me know cause I feel like I'm falling on
deaf ears.

