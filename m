From: Suchitra H <chatwithsuchi2003@yahoo.com>
Subject: Programming without using iptables
Date: Tue, 29 Mar 2005 18:44:32 -0800 (PST)
Message-ID: <20050330024432.21809.qmail@web41728.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi Everyone ,
                         I am working on a firewall project , where I need to replace the iptables part ( which is complicated ) with my own code ( hopefully it will be simpler ) , making use of libiptc. The whole idea is to program as though iptables dosent exist and write my own code which is capable of performing all the commands and output the desired results.  I have been able to do so for listing the chains , policy and counters. Now I want to set the policy for a built-in chain.  Is it possible to do so using libiptc ? Or is there any other altrenative to this???
                 Not able to find any suitable resource on the net. Just one - Querying libiptc - HOWTO , which has been of great help but is very limited. 
                  Any suggestions , solutions to the above problem would be of great help! 
 
Suchitra.

		
---------------------------------
Do you Yahoo!?
 Yahoo! Small Business - Try our new resources site! 
