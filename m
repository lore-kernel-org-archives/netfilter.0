From: =?iso-8859-1?Q?Paul_Blond=E9?= <jpb@entel.ca>
Subject: RE: Dynamic kernel module load
Date: Thu, 24 May 2007 10:10:23 -0700
Message-ID: <000901c79e26$6a5dda70$5a05a8c0@nisgaa.net>
References: <9875566032E2AE41ADB6D9CF037D312652F8F2@skyline.skld.net>
Reply-To: jpb@entel.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9875566032E2AE41ADB6D9CF037D312652F8F2@skyline.skld.net>
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
To: 'Netfilter Lists' <netfilter@lists.netfilter.org>

You will either want to add the loading of ip_conntrack_ftp to =
/etc/rc.local
(see http://iptablesrocks.org), or insert a line into
/etc/sysconfig/iptables-config (or wherever you keep your iptables
configuration file) like this:

IPTABLES_MODULES=3D"ip_conntrack_ftp"



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Paul Blond=E9


