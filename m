From: "hareram" <hareram@sol.net.in>
Subject: Logging suggestions
Date: Tue, 12 Apr 2005 20:51:54 +0530
Message-ID: <0aa401c53f73$5c19a2a0$09603fca@southern>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi all

I have large  capacity link like STM with my provider
Iam planning to log the every packet, source IP , Dest IP, Src port, Dest 
port , Type of Service
what kind of system configuration recommended

what kind of  logging system is better ?
iam trying to use Ulogd and try to log every packet, but the kernel crashes 
after 5min

i have Xeon 1GB ram with 40GB Scsi HDD running FC1

How can logging whole history of the packet with the better performance
with out any payload to the user access, and transparently

any suggestions will be appreciated

hare



