From: Alaios <alaios@yahoo.com>
Subject: ftos patch
Date: Fri, 28 Jan 2005 07:50:08 -0800 (PST)
Message-ID: <20050128155009.99786.qmail@web54702.mail.yahoo.com>
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

Hi i want to know in advance if the followin patch
would allow me to set whatever tos field i want or f.e
0x28
0x40
0x48
0x52
0x30
etc
Thx

4.1 ftos patch 


This patch by Matthew G. Marsh <mgm@paktronix.com>
adds a new target that allows you to set the TOS of
packets to an arbitrary value.

 

For example, if you want to set the TOS of all the
outgoing packets to be 15, you can do as follows :

 

# iptables -t mangle -A OUTPUT -j FTOS --set-ftos 15

# iptables -t mangle --list
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination  
      
FTOS       all  --  anywhere             anywhere     
     TOS set 0x0f 

 

Supported options for the FTOS target are :

 

--set-ftos value

-> Set TOS field in packet header to value. This value
can be in decimal (ex: 32) or in hex (ex: 0x20)

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

