From: =?ISO-8859-1?Q?Jean-Fran=E7ois?= SMIGIELSKI <jf-smig@ibelgique.com>
Subject: Help with expect : master conntrack not found
Date: Mon, 13 Nov 2006 12:32:01 +0100 (CET)
Message-ID: <20061113113202.03BD691C91@ifrance00.ifrance.com>
Reply-To: =?ISO-8859-1?Q?Jean-Fran=E7ois?= SMIGIELSKI <jf-smig@ibelgique.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I installed the "conntrack" command line tool on a Debian Linux 4.0 (etch=
) with a default 2.6.17 kernel. When I tried to execute the test script I=
 found in the SVN repository (/netfilter/trunk/conntrack/test.sh), I had =
the following error message:

root@plop:~# sh ./test.sh create-expect
NFNETLINK answers: No such file or directory
Operation failed: master conntrack not found

I checked my modules and tried to load some, related to conntrack, netfil=
ter, iptables, ... and many  more modules than reason dictates. In vain. =
I give you a view on some packages I installed with their versions: connt=
rack(1.00~beta2-1), iptables (1.3.6.0debian1-2), libnetfilter-conntrack1 =
(0.0.31-1), libnetfilter-log1 (0.0.13-1), libnetfilter-queue1 (0.0.12-1),=
 libnfnetlink1 (0.0.16-1).

The test script seems to work fine when not dealing with the conntrack ta=
ble (no error), but goes on error with all the expect table operations.

Can anyone tell me what I missed, please?

Thank you very much!

JF Smigielski


________________________________________________________________________
iBELGIQUE, exprimez-vous !
http://web.ibelgique.com/
