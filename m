From: Michiel Brandenburg <michielb@toad.stack.nl>
Subject: Re[2]: using ip_nat_ftp
Date: Sat, 15 Feb 2003 19:29:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <64338714703.20030215192909@stack.nl>
References: <46338.80.26.113.199.1045142920.squirrel@www.clientes.sedifa.com>
 <49309.80.26.113.199.1045228632.squirrel@www.clientes.sedifa.com>
 <3E4CEF2A.2040702@lucidpixels.com>
Reply-To: michielb <michielb@toad.stack.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E4CEF2A.2040702@lucidpixels.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Question:
I'm trying to allow passive ftp traffic for a server running on a
nonstandard port (1212) with a non-modular ip_nat_ftp.

Is there a way to append something to the kernel boot to add 1212 to
the list of ftp ports the helper should check ?

-- 
Best regards,
 Michiel



