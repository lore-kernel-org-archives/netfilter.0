From: Marcin Sura <slacklist@op.pl>
Subject: -m helper --helper -irc
Date: Tue, 17 Aug 2004 20:04:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <51382563.20040817200441@op.pl>
Reply-To: Marcin Sura <slacklist@op.pl>
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

Hi

  I use following rule for marking irc dcc transfers from my NATed lan.

  iptables -t mangle -A PREROUTING -p tcp -m helper --helper irc \
  -m mark --mark 0 -j MARK --set-mark 1

  And this works perfectly when I send a file to somebody, and doesn't
  when somebody sends something to me. Why?

  

-- 
Pozdrawiam
 Marcin                         mailto:slacklist@op.pl


