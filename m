From: "Pavel V. Yanchenko" <balrog@msmu.eu.org>
Subject: Caching of rules in PRE(POST)ROUTING chains?
Date: Sat, 15 Nov 2003 11:07:35 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072098477.20031115110735@msmu.eu.org>
Reply-To: balrog@msmu.eu.org
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

Hello.

As far as I understand, rules in PRE- and POSTROUTING chains are
cached? Because when I delete a rule with SNAT target for ip
192.168.10.10 this address's packets are still SNATed for several
minutes. The same thing happens for rules in PREROUTING chains.
Is it possible to disable this feature? Maybe there is some file in
/proc where cached rules are listed?

Thanks in advance.

-- 
Best regards,
 Pavel                          mailto:balrog@msmu.eu.org


