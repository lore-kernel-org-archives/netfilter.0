From: Victor Julien <victor@nk.nl>
Subject: [ANNOUNCE]Vuurmuur 0.5.46 released (initial public release)
Date: Sun, 25 Jul 2004 13:16:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407251316.37259.victor@nk.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: Netfilter <netfilter@lists.netfilter.org>

Hi people, please forgive me for sending you this spam. I've been talking 
about my project a few times before on this list so I thought you would like 
to know it's finally released.

---

Vuurmuur is a middle-end/front-end for netfilter/iptables aimed at 
system-administrators who need a decent firewall, but don't have netfilter 
specific knowledge. It is distributed under the terms of the GNU GPL. This is 
the first public release.

What makes Vuurmuur different from the numerous other iptables frontends, is 
it's scalability, and most of all, the real-time feedback. Logs can be viewed 
in real-time, using colours for easy interpretation. Also, the current 
connections can be viewed in real-time. Filtering possibilities make it easy 
to monitor specific hosts or services. The scalability makes it very easy to 
handle more than two or three interfaces and networks.

Because the administrator must define hosts, groups, networks, zones, services 
and interfaces, which must also be given a name, confusion such as with 
ipaddresses and portnumbers is prevented. These names are also reflected in 
the log and the connections monitor. A service is a container of portranges, 
so for complex services like Samba and Nfs, creating rules is especially 
easy. Also, portforwarding is very simple.

Vuurmuur is currently of beta quality. It runs very well, but there certainly 
will be bugs and ommisions. Users are encouraged to try the software, and 
report their findings to the vuurmuur-users mailinglist. Developers willing 
to contribute are very welcome. The todo-list is always expanding! See 
http://vuurmuur.sourceforge.net/ for details (and screenshots).

