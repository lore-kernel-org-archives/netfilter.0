From: Payal Rathod <payal-iptables@staticky.com>
Subject: natting help needed urgently.
Date: Sun, 7 Sep 2003 16:34:17 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030907110417.GA1463@linux.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi,
I have asked this before but nobody responded. Is this un-do-able?
I have a windows box which is on intertnal ip 192.168.10.3. I want the
outside world to access the servers (ftp, http, smtp, pop3) from it.
The scene is something like this,


+----------+       +--------------+         +---------------+
|          +---><--+ Linux        +---->--<-+win2k          |
|router    |       |  (1.2.3.4)   |         | (192.168.10.3)|
+----------+       +--------------+         +---------------+
                                  
I am not able to redirect any request for windows box from outside world
to internal machine 192.168.10.3

Please help me to solve this problem.

Waiting eagerly for any help on this.

With warm regards,
-Payal

-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

