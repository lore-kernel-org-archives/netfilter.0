From: "Flavio Borup" <borup@running.com.br>
Subject: Wich authentication is configured on FC2?
Date: Wed, 18 Aug 2004 09:57:32 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ab01c48523$030dc480$1164a8c0@runningcentro.local>
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

Which authentication scheme comes pre-compiled on Fedora Core 2?
I've installed a FC2 with (Squid 2.5 Stable 5 i think) and tested basic ncsa
authenticatioin, successfuly.

Questions:

1) It comes with NTLM support compiled, or i have to compile squid ?
2) To use the /etc/passwd-/etc/shadow authentication, i have to use
pam_auth?
3) I can use NTLM authentication with Non-Domain Controllers machine?
(authentication beeing validated on a stand-alone Windows machine, using the
local account databased, the SAM)?


