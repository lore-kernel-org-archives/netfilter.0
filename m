From: =?ISO-8859-1?Q?Ren=E9_Gallati?= <draxinusom@gmail.com>
Subject: Security vulnerability in netfilter?
Date: Fri, 22 Oct 2004 09:52:36 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <50f03b970410220052683669a7@mail.gmail.com>
Reply-To: =?ISO-8859-1?Q?Ren=E9_Gallati?= <draxinusom@gmail.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hello list,

is there any official information about this
http://www.securityfocus.com/archive/1/379010/2004-10-19/2004-10-25/0

?

Couldn't find anything on netfilter.org

quoting from the article:
"
   An integer underflow problem in the iptables firewall logging rules
   can allow a remote attacker to crash the machine by using a handcrafted
   IP packet. This attack is only possible with firewalling enabled.

   We would like to thank Richard Hart for reporting the problem.

   This problem has already been fixed in the 2.6.8 upstream Linux kernel,
   this update contains a backport of the fix.

   Products running a 2.4 kernel are not affected.

   Mitre has assigned the CVE ID CAN-2004-0816 for this problem.
"
--=20
C U

     - -- ---- ----- -----/\/  Ren=E9 Gallati  \/\---- ----- --- -- -

