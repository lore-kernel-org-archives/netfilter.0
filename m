From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: CONNMARK & state RELATED
Date: Tue, 2 Mar 2004 12:18:46 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122F03@alderaan.smgtec.com>
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
To: netfilter@lists.netfilter.org

Does anyone know if these two technologies are compatible?

I am using CONNMARK to do policy routing. I use it to select which WAN
interface the packet will leave the system. It seems that CONNMARK
doesn't mark related traffic. This makes it very hard to implement what
I am trying to do.

My rules are as follows:

${IPTABLES} -t mangle -A PREROUTING --source ${_fip} --destination
${_sip} -p ${_proto} -j CONNMARK --set-mark ${_fwmark} -m mark --mark 0

This rule is what I use to select which traffic goes through which
interface. Since state established can't be matched on what initially
evoked it (like saying "if this packet is established and was
established by FTP from X to Y").

In a NAT situation, how would I route FTP for example so that all the
related sessions are routed back to the same interface. I don't want a
broad rule that just matches all RELATED rules.

Any hints?

