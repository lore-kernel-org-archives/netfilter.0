From: "Pascal C. Kocher" <pascal.kocher@netbeat.biz>
Subject: IP Personality 20020427 breaks ip_conntrack_ftp
Date: Wed, 12 Jun 2002 09:50:17 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <08690CFFD361A946AE65793A726D276902DEAE@smirnoff.netbeat-security.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
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
Cc: ippersonality-devel@lists.sourceforge.net

Hi all

Using the ippersonality patch on a vanilla 2.4.18 kernel seems to break
ip_conntrack_ftp. Note that there is no nat involved, but I suppose it
would also break ip_nat_ftp!

We used the patch to randomize ISNs of all TCP connections. This works
fine for simple protocols. But FTP doesn't work, apparently since the
expectation (Data channel) does not "back-randomize" the ISN for the
hidden System.

Was this already a known issue?

Best regards,
Pascal.

