From: Andre Kalamandeen <x_trodinary@yahoo.com>
Subject: Cant get iptables string match and ROUTE to work.
Date: Sat, 6 May 2006 21:47:23 -0700 (PDT)
Message-ID: <20060507044723.71491.qmail@web53312.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Hey all, i've been trying to do a combination filter
using string matching and the "-j ROUTE" extras from
netfilter but i cant seem to get them to work. Here's
what i do, i got a source (2.6.16.5) from kernel.org
untared to folder, got a copy of iptables (1.3.1) and
untared that too, got me a copy of patch-o-matic-ng
and untared also. I ran the 
p-o-m giving the folders with kernel and iptables
source and apply the patch i want (ROUTE). Next, i
start a xmenuconfig and compile the kernel making sure
the "string" match option and "ROUTE" option are being
installed as modules. Compilation and install goes
fine, i reboot to the new kernel but when i try to use
the string match i keep getting an error saying :
"String match v1.3.5 (I'm 1.3.1)" i figured i have to
upgrade iptables, but when i try a test using the -j
ROUTE --gw it doesnt recognise the command. I did a
search in the kernel compilation folder and there
exists a _ROUTE.o file there. Im not really sure what
to do from here, any help would be appreciated.
 
Thanks.

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

