From: "James Sanders" <Jsanders@co.riverside.ca.us>
Subject: PORT COMMAND
Date: Wed, 14 Dec 2005 17:22:43 -0800
Message-ID: <s3a0556b.009@cor-mail02.co.riverside.ca.us>
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

Hello,
I am a new list user, I have spent time searching the archives to no
avail.

I am a relative firewall newbie, Hoping someone can help me.

I am using Shorewall 2.4.1 to manage my IPTables, everything works
great, but I have 1 single vendor who cannot FTP files to me.
my many other FTP vendors work fine and dandy.

I get an error on the console from the conn tracker.   conntrack_ftp:
partial PORT  xxxxx-xx

With Ethereal, I discovered that the PORT command from this problematic
vendor is not terminated with CR/LF.
All other FTP sequences (that work fine) have cr/lf at the end of the
port command.
RFC959 simplified, states that all commands will be terminated with
cr/lf

Has anyone run into a fix for this type of situation..the vendor has
pushed back saying the cr/lf is actually in the next packet (which I
have not verified yet)
I have read online where the port command must be contained within 1
single packet but this information is hard to come by.

IPTables 1.3.3        
Linux Kernel 2.6.8.2.386
Shorewall 2.4.1
Thank you all.
JimSanders
RCRMC.



