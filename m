From: Tony Earnshaw <tonye@billy.demon.nl>
Subject: Re: 1.2.9 connlimit POM patch
Date: Sun, 28 Mar 2004 18:44:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080492247.1595.16.camel@localhost>
References: <1080313891.6013.50.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1080313891.6013.50.camel@localhost>
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

fre, 26.03.2004 kl. 16.11 skrev Tony Earnshaw:

> The above (wrongly described and detailed as "iplimit" in the latest
> HOWTO) still "does not work for me", whilst I actually find it very
> important for easy traffic shaping; in my case, client Internet MTAs.
> 
> Is anyone on the list familiar with this patch, or have I to contact
> Gerd Knorr directly? (Me, I get poisoned by having list people contact
> me directly, so I'd rather keep it to the list).

This was utter crap, sorry Gerd :) It works perfectly - I found out by
myself without me ever having written lies about it not working to you -
I'd forgotten how to write iptables rules: "order matters".

--Tonni

-- 

mail: billy - at - billy.demon.nl
http://www.billy.demon.nl


