From: Sanjay Arora <skpobox@hotpop.com>
Subject: Cons?: Directed Pinholes
Date: 22 Aug 2004 22:44:47 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093194886.16081.84.camel@Sewak.Asr.Lan>
Reply-To: skpobox@hotpop.com
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Can someone please tell me about the downside of implementing directed pinholes in the firewall between DMZ & Green subnet. Pointers to literature/resources on the same would be most welcome. Expert advice more so ;-))

Specifically I want to implement directed pinholes (am presently reading up on them) for database access by webserver in DMZ and SMTP forwarding by mailserver from/to respectively the Green subnet. But I am totally unaware of any security & maintenence/monitoring implications.

I am using ipcop firewall with static public IP and two Lan segments using 192.168.x.x address-space, with ipCop default instalation, incoming http , smtp & pop3/imap forwarded to webserver in DMZ, which is fully firewalled from connecting to Green Segment and no restrictions on outward connections. Request iptables gurus to please comment and point out various issues.

With best regards and thanks in advance.

Sanjay.



