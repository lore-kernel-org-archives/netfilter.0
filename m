From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: mysql-iptables
Date: Thu, 30 Oct 2003 12:14:41 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A28AC8D@wardrive.citadelcomputer.com.au>
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
To: "Netfilter Mailling List (E-mail)" <netfilter@lists.netfilter.org>

For those of you who were/are interested in the script I'm working =
called mysql-iptables. I have released a GPL version on Source Forge =
http://sourceforge.net/projects/mysql-iptables/.

This script gathers any chain you specify and stores the rules into a =
MySQL database of the same chain name. It increments the byte count so =
you can generate graphs in MRTG/RRDtool or whatever you like using =
retrieval commands like you do with iptables itself.. eg.

mysql-iptables -t MRTG -s 192.168.0.1 -p tcp --sport 80

this will return the total byte value for this rule.

a crontab updates the database like so:

*/5 * * * * root mysql-iptables --updatedb
*/5 * * * * root mysql-iptables -t HOSTS --updatedb

Any more questions please forward them to the forums... (once I get the =
rest up and running ;))


Thanks,
____________________________________________
George Vieira

