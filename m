From: =?iso-8859-1?q?Steve=20Quartly?= <stevequartly@yahoo.com>
Subject: Urgent Help needed.... please.
Date: Sat, 29 Mar 2003 19:09:54 +1100 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030329080954.19290.qmail@web10808.mail.yahoo.com>
Reply-To: steve@quartly.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1392145271-1048925394=:18896"
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

--0-1392145271-1048925394=:18896
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Id: 
Content-Disposition: inline

Hi,

A week ago I put a dedicated server on the internet. 2
days ago a hacker got into my system and caused many
problems through a security flaw in the version of SSH
I am running. Last night he tried again, however I
locked the machine down so even I couldn't get into
it, and he had no success.

I have now changed over to giptables (which is great)
but I have a few problems.

If I connect to my server, run the firewall,
everything is ok. I can look at webpages, SSH, etc
from my home system. If I shutdown my home system, and
re-dial to the net, the firewall blocks eveything! I
can't even ping my server. My parents computer can't
access my server either. This is very frustrating, can
anybody please help me here. I suspect that DNS is
being blocked?

I have attached my firewall script.

If anyone could give me some guidance I'd be very
grateful.

Thanks,

Steve Q.

http://mobile.yahoo.com.au - Yahoo! Mobile
- Check & compose your email via SMS on your Telstra or Vodafone mobile.
--0-1392145271-1048925394=:18896
Content-Type: application/x-zip-compressed; name="giptables.rules.zip"
Content-Transfer-Encoding: base64
Content-Description: giptables.rules.zip
Content-Disposition: attachment; filename="giptables.rules.zip"

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

--0-1392145271-1048925394=:18896--

