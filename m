From: "Shaun T. Erickson" <ste@smxy.org>
Subject: Slightly delayed dns response packets getting delayed - how to handle
 them?
Date: Thu, 22 Apr 2004 18:05:28 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <408841A8.1000307@smxy.org>
Reply-To: ste@smxy.org
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I have an RH9 system with three nics: 1 WAN & 2 LANs. One lan is really 
locked down - the only thing allowed into it are responses to traffic 
initiated frm that lan.

The DNS server is on the other LAN. I'm seeing occaisional dns packets 
being blocked from entering the locked down LAN. My assumption, correct 
or not, is that these are slightly delayed packets that are arriving 
after the state has been torn down, and they are thus blocked. I see 
something like 30 or so of these every 8 hours or so.

Is this something people see a lot? If so, what is the best way to dal 
with it?

	-ste

