From: Greg Cope <gregcope@gmail.com>
Subject: Help debugging iptables firewall....
Date: Tue, 25 Jan 2005 16:53:40 +0000
Message-ID: <c0e9781f050125085343cf71a7@mail.gmail.com>
Reply-To: Greg Cope <gregcope@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi All,

I have a 3 interface firewall (internet, dmz, lan).

For some reason a dmz host can longer ssh or connect to a DB server on
the lan(it could before).

Nothing seems to get logged with a $IPTABLES -A FORWARD -j LOG
--log-prefix "FORWARD DENY: " rule.  And when I disable the FW and
enable the plain routing it seems to be able to connect ok.

At a loss as to why this would not work without logging something.

Firewall and Webserver are FC1, DB server is Redhat AS3.

Could someone suggest some ideas on debuging this?

Any  ideas gratefully received.

Greg

