From: "Charles Lee" <charles@utstar.com>
Subject: re: configure TOS in IPtables failing
Date: Tue, 8 Feb 2005 16:48:15 -0500
Message-ID: <CKECJADCIGJOKLCDNALCGELCCNAA.charles@utstar.com>
Reply-To: charles@utstar.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Hello!  To it maybe concern,
=20
I want change the particular L3 =93OUTPUT=94 interface with specific TOS =
value.  So do the following:
<iptables =96A OUTPUT =96t mangle =96s 192.168.10.1 =96j TOS =96set-tos =
0x10>
=20
After I type this command,  ping 192.168.10.1 from other PC with =
192.168.10.2.
The ping respond come-back with TOS field=3D0.  but I was expecting the =
TOS value changed to 0x10.
=20
How can I make output from particular L3 output interface to have =
specific TOS value?
=20
Would also show me how to verify the configuration the TOS field in the =
Iptables for particular output interface?
=20
=20
Thank your help in advance,
=20
Charles
=20
=20
