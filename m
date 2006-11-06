From: Erik Alberti <erik.alberti@gmx.de>
Subject: "beep" on match
Date: Mon, 06 Nov 2006 23:21:59 +0100
Message-ID: <454FB587.9010806@gmx.de>
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

Hallo!

Ich suche nach einer M=F6glichkeit ein externes Programm bei einem match
einer Regel auszuf=FChren. Beispiel:

  iptables ... -j exec("/usr/bin/beep -f 5000 -l 1000")

------------------------------------------------------------------------

Hello!

I am looking for a possibility of executing an external program in the
field of a match of a rule. Example:

  iptables ... -j exec("/usr/bin/beep -f 5000 -l 1000")


Erik

