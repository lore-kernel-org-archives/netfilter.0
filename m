From: forum@users.pc9.org
Subject: Re: how to get the entry of  NAT table?
Date: Thu, 18 Mar 2004 21:27:54 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <jbm.20040318212754.20bdf816@alkaid.pc9>
References: <BAY12-DAV7rrd58ircf00000dab@hotmail.com>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY12-DAV7rrd58ircf00000dab@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Try:
iptables -t nat -L

This should print the current nat table entries.

-- 
forum@users.pc9.org



