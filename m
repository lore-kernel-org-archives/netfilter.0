From: "Philippe Dhont   (Sea-ro)" <Philippe.Dhont@searo.be>
Subject: snat and dnat
Date: Fri, 4 Apr 2003 10:24:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B5747F3DB39FD411884B00B0D07808CCB6C9D9@server10>
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

hi,

i had some problems testing the nat thing but now it seems to work without
any rule in snat 
and i can ping from network A to network B in other ranges, but the
ip_forwarding is doing all the work.
is this normal ? 

	--tronstr@csomic--



