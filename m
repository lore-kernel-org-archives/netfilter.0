From: Michael Gale <mgale@utilitran.com>
Subject: Firewall and trusting state ESTABLISHED :)
Date: Tue, 9 Dec 2003 12:54:17 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209125417.2b031b99.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

	I have finished setting up a linux based firewall (slackware) and I feel it is locked down well enough.

In order to allow internal clients to access external web servers I added a rule to forward port 80.

I then found that no packets would make it back in, so I added another rule allowing ext to int interface forwarding for established connections.

What I want to know is can I trust having one rule saying

iptables -A FORWARD -i external -o internal -m state --state ESTABLISHED -j ACCEPT 

or should I have many rules like

iptables -A FORWARD -i external -o internal -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT

Seems like a dumb question -- I guess what I really should be asking is how secure is "-m state --state ESTABLISHED" ? 

-- 
Michael Gale
Network Administrator
Utilitran Corporation

