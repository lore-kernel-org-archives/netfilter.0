From: Dwayne Hottinger <dhottinger@harrisonburg.k12.va.us>
Subject: more firewall scripting
Date: Sun, 18 Dec 2005 12:21:21 -0500
Message-ID: <1134926481.add6476cf4871@webmail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter <netfilter@lists.netfilter.org>

Is it better to use DROP LDROP or TREJECT when blocking ipaddresses for example
I have the following in my firewall script:
$IPC -A FORWARD -p tcp -s 12.120.25.14 -j LDROP
$IPC -A FORWARD -p tcp -d 12.120.25.14 -j LDROP
$IPC -A FORWARD -p tcp -s 198.82.30.204 -j LDROP
$IPC -A FORWARD -p tcp -d 198.82.30.204 -j LDROP

Should I change it to TREJECT, or DROP?

thanks,

ddh


--
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools

