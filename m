From: "Jacob Hansen" <luffe@diku.dk>
Subject: Netfilter after kernel 2.4.3 ??
Date: Tue, 25 Jun 2002 09:05:23 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <001001c21c16$b00597d0$6e01a8c0@raptor>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.samba.org

Hi,

I am working on a packet-mangling module for Netfilter (actually I am
extending another guys work: http://piconet.sourceforge.net/). The
modules implements Ad Hoc Networking for Linux as a kernel module. The
module hooks into pre_route, local_in and local_out handlers to provide
ad hoc routing.

The modele was initially developed for kernel 2.4.3 and on this version
everything works as expected. For some bizarre reason, when I use a
later kernel, TCP connections have problems. (i.e. I can connect via
ftp, login, look at directory contents but when I start downloading a
file - nothing happens).

Now I ask, what changes have been made since 2.4.3, that apparently
breaks functionality of the module? Any ideas?


Best regards, 


Jacob



