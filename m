From: "Louie Miranda" <louie@axishift.ath.cx>
Subject: ws inside a nat w/ diff block
Date: Tue, 9 Sep 2003 15:15:10 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00e201c376a2$1e068870$020119ac@admwebdevws>
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

Im on a seperate block 172.25.1.x in our office we are only using one
WORKGROUP/DOMAIN. Im connected via my Linux box that has 3ip's

192.168.10.x - private
172.25.1.x - private
202.x.x.x - live ip

My 172.25 is where i am, which is on iptables nat rule. Now i wonder, i
cannot see other's workstation on my workgroup/domain but when i go
temporarily to 192.x block and add a shortcut on my network neighborhood and
go to my 172.x block i can access them all.

Which part could be the problem?

--
Louie


