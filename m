From: "Gautham Thavva" <gautham.thavva@lycos.com>
Subject: TFTP ..unable to track...
Date: Mon, 12 May 2003 10:37:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LONLKONDBJILJAAA@mailcity.com>
Reply-To: gautham.thavva@lycos.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Language: en
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


I have a linux firewall (using iptables 1.2.6a). This machine is running a TFTP client. I am unable to track the TFTP sessions.

I have built the tftp.patch, the netfilter tracking module for tftp by Magnus Boden. I have not been able to track the sessions.

The TFTP Read Request goes to the destination port 69 at the server side. The packets at the INPUT side to the firewall is at a port for which I have no prior knowledge.

Please can someone suggest a way to filter in only the tftp packets.

with regards,
Gautham Thavva




____________________________________________________________
Get advanced SPAM filtering on Webmail or POP Mail ... Get Lycos Mail!
http://login.mail.lycos.com/r/referral?aid=27005

