From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: mark ftp passive connections
Date: Mon, 02 Jan 2006 18:02:36 +0100
Message-ID: <BAY103-F1F6A1885C88454A8FBD44B22D0@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I would like how to mark ftp passive connections with connmark.
Currently I have resolved this problem in the following manner:

# mark ftp active conn (no problem)
--protocol tcp --dports 20,21 -j MARK --set-mark 1
# mark ftp passive data conn with helper's help
-m helper --helper ftp -j MARK --set-mark 1

TIA



