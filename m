From: Alejandro Flores <alejandro.flores@triforsec.com.br>
Subject: Re: Wich authentication is configured on FC2?
Date: Thu, 19 Aug 2004 09:01:12 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092916872.2221.3.camel@aflores>
References: <00ab01c48523$030dc480$1164a8c0@runningcentro.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00ab01c48523$030dc480$1164a8c0@runningcentro.local>
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
To: Flavio Borup <borup@running.com.br>
Cc: netfilter@lists.netfilter.org

	Hello Flavio,

> 1) It comes with NTLM support compiled, or i have to compile squid ?

	Take a look at /usr/lib/squid

> 2) To use the /etc/passwd-/etc/shadow authentication, i have to use
> pam_auth?

	Yes.

> 3) I can use NTLM authentication with Non-Domain Controllers machine?
> (authentication beeing validated on a stand-alone Windows machine, using the
> local account databased, the SAM)?

	AFAIK, no.

	Flavio, this list is intended for Netfilter/Iptables discussion only.

-- 
--
Alejandro Flores
http://www.triforsec.com.br/
http://www.defenselayer.com/
http://www.nabucodonosor.com/

