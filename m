From: "Simo Hakanen" <simo.hakanen@no.phnet.spam.fi>
Subject: iptables-save and iptables-restore problem with long rules
Date: Fri, 31 Oct 2003 00:25:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c39f34$cb72a5b0$0800a8c0@Melissa>
Reply-To: <simo.hakanen@phnet.fi>
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

Hi.

Simply:
iptables-save -c > $IPTABLES_CONFIG -line used in 
the init-script of rh9 does not export the rules properly.
It does a random truncation of lines and leaves out the " and ' -marks.

I don't know whether this is a bug but let me explain a bit detail.
I used fwbuilder 1.0.11-1 to build my fw rules for 
my gateway. I use ulogd for logging so I choosed the 
option and left the default logging-prefix as it was. 
I was able to commit those rules to iptables with no problems.
I noticed the problem when I were transporting 
the init-script of iptables from rh to suse (Personnally I don't like 
SuSEFirewall2 wrapping).
The save-function works fine but when I try to restore the rules from 
the file, they are not accepted by iptables. 
Some lines in the file have been truncated even though some other lines that are 
longer as still intact. 
For example, rule like:
iptables -A INPUT -s xxx.xxx.xxx.xxx/24 -d xxx.xxx.xxx.xxx/32 -p tcp -m state --state NEW -j ULOG --ulog-prefix "RULE 0
-- LOG " --ulog-nlgroup 32 --ulog-qthreshold 20

will be stored as (hopefully the linefeeds are in place)
[0:0] -A INPUT -s 192.168.0.0/255.255.255.0 -d 192.168.0.2 -p tcp -m state --state NEW -j ULOG --ulog-prefix RULE 0 --
LOG  --ulog-nlgroup 32
--ulog-qthreshold 20

The last part, --ulog-qthreshold 20 in on the next line so 
iptables-restore thinks it as a new rule and fails. Also notice 
that there are no "-marks around the --log-prefix so iptables-restore 
also fails to read that part (Bad argument `0').

It seemed that the --ulog-qthreshold part was always the one put on another line.

Hopefully you can make something out of this.

---
Simo Hakanen



