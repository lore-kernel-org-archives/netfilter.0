From: "Paul Harlow" <pharlow@skld.com>
Subject: Dynamic kernel module load
Date: Thu, 24 May 2007 10:31:56 -0600
Message-ID: <9875566032E2AE41ADB6D9CF037D312652F8F2@skyline.skld.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Netfilter Lists <netfilter@lists.netfilter.org>

Hi all,

Fedora 5 patched, i386 SMP

I am looking for info on how to dynamically load a particular kernel =
module when I restart IPTables. I have firewalling rules in place for =
FTP traffic (both passive and active) however when I restart IPTables I =
notice that the module ip_conntrack_ftp does not load, I have to load it =
manually. This presents a problem if someone other than myself has to =
reload firewall rules on this machine but isn't aware of the FTP =
rules/needs.

Will adding the line "ip_conntrack_ftp" to the modules.conf file solve =
this problem and leave the particular module in permanently?

Paul Harlow
System and Network Administrator
SKLD Information Services LLC
9540 E. Jewell Ave. Suite A
Denver, CO=A0=A0 80247
303.695.3861 - desk
303.913.2804 - cell


