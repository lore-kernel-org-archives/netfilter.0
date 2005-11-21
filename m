From: Daniel <damage@rooties.de>
Subject: ipt_recent timestamp
Date: Mon, 21 Nov 2005 07:48:45 +0100
Message-ID: <200511210748.45555.damage@rooties.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Netfilter List <netfilter@lists.netfilter.org>

Hi,
I want to generate some statistcs form /proc/net/ipt_recent/* lists. But I 
don't understand the timestamp. Which unit is that timestamp of (e.g. 
seconds, milliseconds...)? And where is it relative to? May be it is relativ 
to the time the computer was started, so the timestamp in the list files is 
just the current uptime?

tia
Daniel

