From: Aurelio Turco <a.turco@bom.gov.au>
Subject: flush before policy vs policy before flush
Date: Tue, 11 Jun 2002 11:13:37 +0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D05DB61.A608A82E@bom.gov.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Many example scripts seem to flush first
and then set the policy. Is it not better
to set the policy before flushing?

For, otherwise, according to section 7.1
of the Packet Filtering HOWTO, the policy
could end-up being ACCEPT, albeit only
for a moment.

Aurelio.

