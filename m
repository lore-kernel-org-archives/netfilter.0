From: "Stuart Lamble" <stu@gateway10.homeip.net>
Subject: Prerouting question
Date: Tue, 6 Apr 2004 20:00:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c41c01$01e18b40$0464a8c0@stu>
Reply-To: <stu@gateway10.homeip.net>
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

Hi All

If prerouting is the first rule a packet touches when arriving at the
firewall, why then do we not set the default to DROP here and allow
through what we need.
That is if you are running a nat environment.

Then if a packet makes it through the PREROUTING, you can pass it to the
INPUT rule base if it is for the firewall machine itself or to FORWARD
if its for the LAN for example.
Making the default DROP for both the above, and allowing specifics
again.

Thanks for any comments offered...

Stuart



