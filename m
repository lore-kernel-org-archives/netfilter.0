From: J A <jake.lists@gmail.com>
Subject: IPTables & HTTPD Conflict
Date: Mon, 4 Apr 2005 10:11:02 +0800
Message-ID: <249c202905040319115c97c290@mail.gmail.com>
References: <200504031339.j33DdR2X003262@osprey.tkevans.com>
Reply-To: J A <jake.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200504031339.j33DdR2X003262@osprey.tkevans.com>
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

Hello All,

We're using Redhat 9
We've been running a Web Server (Apache & Tomcat), and were told to
run a firewall, in this case IPTables.  When we enabled IPTables, many
of our web sites (BUT not all) could no longer be browsed from the
Internet.

Could you tell us which specific IPTables parameter is doing this, so
we could disable only the specific parameter?
Or is it not advisable to run IPTables side-by-side with Web services?

Thanks, appreciate your ideas.

---jake

