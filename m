From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: portfw on iptables 2.4 kernel problem.
Date: Tue, 10 Dec 2002 10:43:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019A3A@hslex01.hslbz.local>
References: <FD8F124A387AD6119F7900A0D218B321561982@hslex01.hslbz.local>
Reply-To: <rsterenborg@xs4all.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321561982@hslex01.hslbz.local>
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
To: 'Paulo Andre' <pandre@darkstar.nom.za>, 'louie miranda' <lmiranda@chikka.com>
Cc: 'netfilter' <netfilter@lists.netfilter.org>

> You will have to allow port 20 aswell...FTP uses both port 20 and 21

Do you ?
I was under the impression that this line would take care of that (which
is already in the iptables config) :

> iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 21 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT

However, I'm not sure if it's better to split them up into 2 rules :
iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 21 -m state --state
NEW -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATED
-j ACCEPT


Rob


