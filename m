From: Nathanael Morrison <nathanael_morrison@cogeco.ca>
Subject: Iptables Forwarding Vnc Connection
Date: Fri, 14 Feb 2003 18:29:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E4D7BE7.6010008@cogeco.ca>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I currently have several computers behind a linux gateway, one of which 
is my personal computer. I often want to access my desktop from campus 
using KDE's remote desktop feature. At the moment I forward any 
connections to port 5900 to my pc. This works but then I thought, 
wouldn't it be nice if I could to this securely with an ssh tunnel 
Correct me if I'm wrong but, I think the connection gets tunneled 
through ssh, and a connection is made locally (on the gateway) to port 
5900. Using iptables, is there a way to forward a locally generated 
connection to another computer?

Your help would be greatly appreciated,

Nathanael Morrison



