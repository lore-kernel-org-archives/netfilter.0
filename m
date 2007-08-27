From: "Sebastien VECTEN" <svecten@aressi.fr>
Subject: Re: Change ip_conntrack_sip default port
Date: Mon, 27 Aug 2007 06:51:42 +0000
Message-ID: <DIIE.00000DE000044CE3@aressi.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,
=20
Thank you for your response, the good solution is the helper module to =
change the defaut port.
=20
-m helper --helper sip-5068 in a rule.
=20
Thanks.
=20
VECTEN S=E9bastien

To: netfilter@lists.netfilter.org
Cc: netfilter-failover@lists.netfilter.org




