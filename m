From: <dhiraj.2.bhuyan@bt.com>
Subject: change source and destination port simultaneously
Date: Fri, 23 Jan 2004 14:06:49 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7497DCA1C240C042B28F6657ADFD8E090691F1F1@i2km11-ukbr.domain1.systemhost.net>
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

Hello list,

Can anyone suggest what's the best way/module to achieve the following? =
Am using kernel 2.4.24.

packets going to remote host
-----------------------------

(src) local_IP/local_port    (dest) remote_IP/remote_port

changes to -

(src) local_IP/portX       (dest) remote_IP/portY


packet coming from remotehost
-----------------------------

(src) remote_IP/portY       (dest) local_IP/portX

changes to -

(src) remote_IP/remote_port      (dest) local_IP/local_port


Thanks in advance.

Best regards,

Dhiraj Bhuyan

