From: alexander.swann@synetics.fr
Subject: =?iso-8859-1?Q?R=E9f=2E_=3A_Starting_iptables_problem?=
Date: Fri, 24 Oct 2003 14:57:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFE1836FBB.96FF67AB-ONC1256DC9.00471789-C1256DC9.004742EB@synetics.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


Hello,
Did u try to do what the warning message says ?

 * Not starting iptables. First create some rules then run
 * /etc/init.d/iptables save

Regards
Swann



|---------+----------------------------------->
|         |           Stephen Liu             |
|         |           <satimis@icare.com.hk>  |
|         |           Envoy=E9 par :            |
|         |           netfilter-admin@lists.ne|
|         |           tfilter.org             |
|         |                                   |
|         |                                   |
|         |           2003.10.24 22:29        |
|         |                                   |
|---------+----------------------------------->
  >--------------------------------------------------------------------=
-----------------------------------------------|
  |                                                                    =
                                               |
  |       Pour :    netfilter@lists.netfilter.org                      =
                                               |
  |       cc :                                                         =
                                               |
  |       Objet :   Starting iptables problem                          =
                                               |
  >--------------------------------------------------------------------=
-----------------------------------------------|




Hi all folks,

I just finished installing Gentoo 1.4 and could not start iptables

# rc-update add iptables default
 * iptables already installed in runlevel default; skipping

# /etc/init.d/iptables status
 * status:  stopped

# /etc/init.d/iptables start
 * WARNING:  "net.eth0" has already been started.
 * Not starting iptables. First create some rules then run
 * /etc/init.d/iptables save

Kindly advise how to proceed.  Thanks in advance.

B.R.
Stephen Liu




=



