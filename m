From: Jay Brown <linuxsa2002@yahoo.com>
Subject: path of packets in the default chains
Date: Thu, 16 May 2002 16:15:16 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020516231516.49964.qmail@web21503.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Sorry if this is someplace else but can't find the
answer.

There are 8 default tables INPUT, OUTPUT, FORWARD,
nat/PREROUTING, nat/OUTPUT, nat/POSTROUTING,
mangle/PREROUTING, mangle/OUTPUT.  For a packet coming
into an interface and going to leave another interface
(not going to userspace), what tables does the packet
traverse?  Is it ethX -> mangle/PREROUTING ->
nat/PREROUTING -> route process -> FORWARD ->
nat/POSTROUTING ->ethZ?  or are fewer items involved? 
 
What about for a packet going into userspace is it
ethX -> mangle/PREROUTING -> nat/PREROUTING -> route
process -> INPUT -> userspace ? 

What about for a packet going from userspace -
userspace -> OUTPUT -> mangle/OUTPUT ->
nat/POSTROUTING ->ethZ?  

Thanks for the clarification in advance.
Jay Brown

__________________________________________________
Do You Yahoo!?
LAUNCH - Your Yahoo! Music Experience
http://launch.yahoo.com

