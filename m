From: richard lucassen <netfilter@lucassen.org>
Subject: kernel-2.6: ipsec without devices
Date: Thu, 5 Aug 2004 11:33:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040805113320.5a1ade04.netfilter@lucassen.org>
Reply-To: reply3@lucassen.org
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello list,

Anyone an explanation (or a link to an explanation) why the IPSEC
implementation in kernel-2.6 doesn't use devices like "ipsec0"? I
searched google, but I can't find anything on this subject. For tunnels
between Linux-boxes I can use OpenVPN of course, but for all other
connections I only can use the kernel-IPSEC. And I prefer not to use
FreeSWAN.

I really miss these devices. E.g.: I can't do a tcpdump on the tunnel to
see what's happening there, nor can I do some shaping *in* the tunnel.

Or have I missed something crucial?

Richard.

-- 
___________________________________________________________________
Recursion: see recursion

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+

