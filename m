From: "Tomas Charvat" <eaglecz@tiscali.cz>
Subject: time module
Date: Sun, 9 Nov 2003 00:48:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000501c3a652$e1987520$050314ac@rip>
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

greeting folk

im just testing rule

[0:0] -A FORWARD -s 62.84.131.35 -m time  --timestart 07:00 --timestop
00:38 --days Sun,Mon,Tue,Wed,Thu,Fri,Sat -j shape

it doesnt work .. all traffic pass trough, packets just ignore it

but when i put there

[0:0] -A FORWARD -s 62.84.131.35 -m time  --timestart 07:00 --timestop
00:38 --days Sun -j shape

(only one day)
rule working properly ....


i have iptables 1.2.8 kernel 2.4.23-pre6 patched with patch-o-matic...

any tip ?

regards
tomas



