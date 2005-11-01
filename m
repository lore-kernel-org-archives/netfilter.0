From: "Ashley M. Kirchner" <ashley@pcraft.com>
Subject: iptables problem
Date: Tue, 01 Nov 2005 11:06:29 -0700
Message-ID: <4367AEA5.7080501@pcraft.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


    I have three machines on our private network that need unrestricted 
access to and from FTP.  These are little photo kiosks that periodically 
connect to the master service machine elsewhere through ftp to send 
files and then receives information back.

    The machine running iptables has eth0 with our public ip and eth2 
with the internal (192.168.x.x) ip (where the three machines are on.) 

    Help anyone?


