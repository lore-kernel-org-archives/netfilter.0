From: SBlaze <dagent.geo@yahoo.com>
Subject: Counter Strike FOWARDING?
Date: Sat, 8 Mar 2003 12:34:34 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030308203434.17890.qmail@web40209.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

iptables -t nat -A PREROUTING -p TCP --dport 27015 -j DNAT --to-destination
192.168.1.25:27015


I'm trying to route incoming attempts into my internal windows machine to host
a Half Life Counter Strike game every now and then. This is what I come up
with! Could everyone take a look and see if this is correct? Thanks Muchly

=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - forms, calculators, tips, more
http://taxes.yahoo.com/

