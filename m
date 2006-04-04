From: Clist <clist@uah.es>
Subject: ipset command ipporthash anormal behavior
Date: Tue, 4 Apr 2006 14:46:00 +0200
Message-ID: <200604041446.01536.clist@uah.es>
Reply-To: clist@uah.es
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
To: netfilter@lists.netfilter.org

Hi 
I have ipsets 2.2.8 

All commands using iphash run fine but, all comands from other sets return 
error, (ipporthas, nethash etc..) 
Example:

The set clients does not exist, so it is ok to create one,

Shell Command:

ipset -N clients ipporthash --from 192.168.153.206 --to 192.168.153.207 
--hashsize 1024 --probes 4 --resize 50 || echo "failure .."

it prints :

"failure .."

But the set got created!!. 

This is confusing and make my script run bad, if the commnad ran sucessfully, 

Why it returns error code !=0 to the OS??
-- 
---------------------------------------------
Clister UAH
---------------------------------------------

