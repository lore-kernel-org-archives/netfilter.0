From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: what's the funcion of ip_nat_ftp and ip__conntack_ftp modules?
Date: Mon, 3 Jun 2002 10:07:20 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206030907.g5397PA13623@Networker.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

ip_nat_ftp handles address translation of ftp connections - a far more 
complex matter than NATting things like telnet, pop3, smtp....

ip_conntrack_ftp handles connection tracking for ftp connections - ie it 
recognises the returning replies and labels them as RELATED, even though 
they're on different source / destination ports from the original connection 
they're replying to.


Antony

