From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: allow ll for one thru firewall
Date: Wed, 27 Aug 2003 20:41:58 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDEMKKNJDLAJDPNDPCDDAEHCNFAA.georgev@citadelcomputer.com.au>
References: <20030827080615.GA19717@staticky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030827080615.GA19717@staticky.com>
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
To: Payal Rathod <payal-iptables@staticky.com>, Netfilter ML <netfilter@lists.netfilter.org>

Show us what you have...

Put a rule before the others where it's source address is 192.168.10.10 and
there IS NO destination port.. then it'll allow anything from this machin
with the correct remaining rules if any..

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Payal Rathod
Sent: Wednesday, August 27, 2003 6:06 PM
To: Netfilter ML
Subject: allow ll for one thru firewall


Hi,
I am allowing onlyftp,dns for all people on my LAN. Now there is one IP
(192.68.10.10) for whom i want to allow anything. What should b done for
this?This particular IP canuse htp, fpanythingfor that matter. How
should my rule-set be formatted?
Can anyone advice?
With warm regards,
-Payal

--
For GNU/Linux Success Stories and Articles visit:
          http://payal.staticky.com



